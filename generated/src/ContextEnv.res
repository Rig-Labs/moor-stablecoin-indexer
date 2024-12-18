open Types

/**
The context holds all the state for a given events loader and handler.
*/
type t = {
  logger: Pino.t,
  eventItem: Internal.eventItem,
  addedDynamicContractRegistrations: array<TablesStatic.DynamicContractRegistry.t>,
}

let getUserLogger = (logger): Logs.userLogger => {
  info: (message: string) => logger->Logging.uinfo(message),
  debug: (message: string) => logger->Logging.udebug(message),
  warn: (message: string) => logger->Logging.uwarn(message),
  error: (message: string) => logger->Logging.uerror(message),
  errorWithExn: (exn: option<Js.Exn.t>, message: string) =>
    logger->Logging.uerrorWithExn(exn, message),
}

let makeEventIdentifier = (
  eventItem: Internal.eventItem,
): Types.eventIdentifier => {
  let {event, blockNumber, timestamp} = eventItem
  {
    chainId: event.chainId,
    blockTimestamp: timestamp,
    blockNumber,
    logIndex: event.logIndex,
  }
}

let getEventId = (eventItem: Internal.eventItem) => {
  EventUtils.packEventIndex(
    ~blockNumber=eventItem.blockNumber,
    ~logIndex=eventItem.event.logIndex,
  )
}

let make = (~eventItem: Internal.eventItem, ~logger) => {
  let {event, chain, eventName, contractName, blockNumber} = eventItem
  let logger = logger->(
    Logging.createChildFrom(
      ~logger=_,
      ~params={
        "context": `Event '${eventName}' for contract '${contractName}'`,
        "chainId": chain->ChainMap.Chain.toChainId,
        "block": blockNumber,
        "logIndex": event.logIndex,
      },
    )
  )

  {
    logger,
    eventItem,
    addedDynamicContractRegistrations: [],
  }
}

let getAddedDynamicContractRegistrations = (contextEnv: t) =>
  contextEnv.addedDynamicContractRegistrations

let makeDynamicContractId = (~chainId, ~contractAddress) => {
  chainId->Belt.Int.toString ++ "-" ++ contractAddress->Address.toString
}
let makeDynamicContractRegisterFn = (
  ~contextEnv: t,
  ~contractName,
  ~inMemoryStore,
  ~shouldSaveHistory,
) => (contractAddress: Address.t) => {
  
  let {eventItem, addedDynamicContractRegistrations} = contextEnv
  let {chain, timestamp, blockNumber, logIndex} = eventItem

  let chainId = chain->ChainMap.Chain.toChainId
  let dynamicContractRegistration: TablesStatic.DynamicContractRegistry.t = {
    id: makeDynamicContractId(~chainId, ~contractAddress),
    chainId,
    registeringEventBlockNumber: blockNumber,
    registeringEventLogIndex: logIndex,
    registeringEventName: eventItem.eventName,
    registeringEventContractName: eventItem.contractName,
    registeringEventSrcAddress: eventItem.event.srcAddress,
    registeringEventBlockTimestamp: timestamp,
    contractAddress,
    contractType: contractName,
  }

  addedDynamicContractRegistrations->Js.Array2.push(dynamicContractRegistration)->ignore

  let eventIdentifier: Types.eventIdentifier = {
    chainId,
    blockTimestamp: timestamp,
    blockNumber,
    logIndex,
  }

  inMemoryStore.InMemoryStore.entities
  ->InMemoryStore.EntityTables.get(module(TablesStatic.DynamicContractRegistry))
  ->InMemoryTable.Entity.set(
    Set(dynamicContractRegistration)->Types.mkEntityUpdate(
      ~eventIdentifier,
      ~entityId=dynamicContractRegistration.id,
    ),
    ~shouldSaveHistory,
  )
}

let makeWhereLoader = (
  loadLayer,
  ~entityMod,
  ~inMemoryStore,
  ~fieldName,
  ~fieldValueSchema,
  ~logger,
) => {
  Entities.eq: loadLayer->LoadLayer.makeWhereEqLoader(
    ~entityMod,
    ~fieldName,
    ~fieldValueSchema,
    ~inMemoryStore,
    ~logger,
  ),
}

let makeEntityHandlerContext = (
  type entity,
  ~eventIdentifier,
  ~inMemoryStore,
  ~entityMod: module(Entities.Entity with type t = entity),
  ~logger,
  ~getKey,
  ~loadLayer,
  ~shouldSaveHistory,
): entityHandlerContext<entity> => {
  let inMemTable = inMemoryStore->InMemoryStore.getInMemTable(~entityMod)
  {
    set: entity => {
      inMemTable->InMemoryTable.Entity.set(
        Set(entity)->Types.mkEntityUpdate(~eventIdentifier, ~entityId=getKey(entity)),
        ~shouldSaveHistory,
      )
    },
    deleteUnsafe: entityId => {
      inMemTable->InMemoryTable.Entity.set(
        Delete->Types.mkEntityUpdate(~eventIdentifier, ~entityId),
        ~shouldSaveHistory,
      )
    },
    get: loadLayer->LoadLayer.makeLoader(~entityMod, ~logger, ~inMemoryStore),
  }
}

let getContractRegisterContext = (contextEnv, ~inMemoryStore, ~shouldSaveHistory) => {
  //TODO only add contracts we've registered for the event in the config
  addBorrowOperations:  makeDynamicContractRegisterFn(~contextEnv, ~inMemoryStore, ~contractName=BorrowOperations, ~shouldSaveHistory),
  addFPTStaking:  makeDynamicContractRegisterFn(~contextEnv, ~inMemoryStore, ~contractName=FPTStaking, ~shouldSaveHistory),
  addStabilityPool:  makeDynamicContractRegisterFn(~contextEnv, ~inMemoryStore, ~contractName=StabilityPool, ~shouldSaveHistory),
  addTroveManager:  makeDynamicContractRegisterFn(~contextEnv, ~inMemoryStore, ~contractName=TroveManager, ~shouldSaveHistory),
  addUSDF:  makeDynamicContractRegisterFn(~contextEnv, ~inMemoryStore, ~contractName=USDF, ~shouldSaveHistory),
}->(Utils.magic: Types.contractRegistrations => Internal.contractRegisterContext)

let getLoaderContext = (contextEnv: t, ~inMemoryStore: InMemoryStore.t, ~loadLayer: LoadLayer.t) => {
  let {logger} = contextEnv
  {
    log: logger->getUserLogger,
    borrowOperations_AdjustTroveEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.BorrowOperations_AdjustTroveEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        asset: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.BorrowOperations_AdjustTroveEvent),
          ~inMemoryStore,
          ~fieldName="asset",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
        identity: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.BorrowOperations_AdjustTroveEvent),
          ~inMemoryStore,
          ~fieldName="identity",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    borrowOperations_CloseTroveEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.BorrowOperations_CloseTroveEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        asset: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.BorrowOperations_CloseTroveEvent),
          ~inMemoryStore,
          ~fieldName="asset",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
        identity: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.BorrowOperations_CloseTroveEvent),
          ~inMemoryStore,
          ~fieldName="identity",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    borrowOperations_OpenTroveEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.BorrowOperations_OpenTroveEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        asset: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.BorrowOperations_OpenTroveEvent),
          ~inMemoryStore,
          ~fieldName="asset",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
        identity: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.BorrowOperations_OpenTroveEvent),
          ~inMemoryStore,
          ~fieldName="identity",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    fPTStaking_StakeEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FPTStaking_StakeEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        identity: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.FPTStaking_StakeEvent),
          ~inMemoryStore,
          ~fieldName="identity",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    fPTStaking_UnstakeEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FPTStaking_UnstakeEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        identity: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.FPTStaking_UnstakeEvent),
          ~inMemoryStore,
          ~fieldName="identity",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    stabilityPool_ProvideToStabilityPoolEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.StabilityPool_ProvideToStabilityPoolEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        identity: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.StabilityPool_ProvideToStabilityPoolEvent),
          ~inMemoryStore,
          ~fieldName="identity",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    stabilityPool_StabilityPoolLiquidationEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.StabilityPool_StabilityPoolLiquidationEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        asset: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.StabilityPool_StabilityPoolLiquidationEvent),
          ~inMemoryStore,
          ~fieldName="asset",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    stabilityPool_WithdrawFromStabilityPoolEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.StabilityPool_WithdrawFromStabilityPoolEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        identity: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.StabilityPool_WithdrawFromStabilityPoolEvent),
          ~inMemoryStore,
          ~fieldName="identity",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    troveManager_RedemptionEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.TroveManager_RedemptionEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        asset: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.TroveManager_RedemptionEvent),
          ~inMemoryStore,
          ~fieldName="asset",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
        identity: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.TroveManager_RedemptionEvent),
          ~inMemoryStore,
          ~fieldName="identity",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    troveManager_TroveFullLiquidationEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.TroveManager_TroveFullLiquidationEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        asset: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.TroveManager_TroveFullLiquidationEvent),
          ~inMemoryStore,
          ~fieldName="asset",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
        identity: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.TroveManager_TroveFullLiquidationEvent),
          ~inMemoryStore,
          ~fieldName="identity",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    troveManager_TrovePartialLiquidationEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.TroveManager_TrovePartialLiquidationEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
        asset: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.TroveManager_TrovePartialLiquidationEvent),
          ~inMemoryStore,
          ~fieldName="asset",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
        identity: loadLayer->makeWhereLoader(
          ~entityMod=module(Entities.TroveManager_TrovePartialLiquidationEvent),
          ~inMemoryStore,
          ~fieldName="identity",
          ~fieldValueSchema=S.string,
          ~logger,
        ),
      
      },
    },
    uSDF_Burn: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.USDF_Burn),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    uSDF_Mint: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.USDF_Mint),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    uSDF_TotalSupplyEvent: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.USDF_TotalSupplyEvent),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
  }->(Utils.magic: Types.loaderContext => Internal.loaderContext)
}

let getHandlerContext = (
  context,
  ~inMemoryStore: InMemoryStore.t,
  ~loadLayer,
  ~shouldSaveHistory,
) => {
  let {eventItem, logger} = context

  let eventIdentifier = eventItem->makeEventIdentifier
  {
    log: logger->getUserLogger,
    borrowOperations_AdjustTroveEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.BorrowOperations_AdjustTroveEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    borrowOperations_CloseTroveEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.BorrowOperations_CloseTroveEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    borrowOperations_OpenTroveEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.BorrowOperations_OpenTroveEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fPTStaking_StakeEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FPTStaking_StakeEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fPTStaking_UnstakeEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FPTStaking_UnstakeEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    stabilityPool_ProvideToStabilityPoolEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.StabilityPool_ProvideToStabilityPoolEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    stabilityPool_StabilityPoolLiquidationEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.StabilityPool_StabilityPoolLiquidationEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    stabilityPool_WithdrawFromStabilityPoolEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.StabilityPool_WithdrawFromStabilityPoolEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    troveManager_RedemptionEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.TroveManager_RedemptionEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    troveManager_TroveFullLiquidationEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.TroveManager_TroveFullLiquidationEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    troveManager_TrovePartialLiquidationEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.TroveManager_TrovePartialLiquidationEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    uSDF_Burn: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.USDF_Burn),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    uSDF_Mint: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.USDF_Mint),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    uSDF_TotalSupplyEvent: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.USDF_TotalSupplyEvent),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
  }->(Utils.magic: Types.handlerContext => Internal.handlerContext)
}

let getContractRegisterArgs = (contextEnv, ~inMemoryStore, ~shouldSaveHistory): Internal.contractRegisterArgs => {
  event: contextEnv.eventItem.event,
  context: contextEnv->getContractRegisterContext(~inMemoryStore, ~shouldSaveHistory),
}

let getLoaderArgs = (contextEnv, ~inMemoryStore, ~loadLayer): Internal.loaderArgs => {
  event: contextEnv.eventItem.event,
  context: contextEnv->getLoaderContext(~inMemoryStore, ~loadLayer),
}

let getHandlerArgs = (
  contextEnv,
  ~inMemoryStore,
  ~loaderReturn,
  ~loadLayer,
  ~shouldSaveHistory,
): Internal.handlerArgs => {
  event: contextEnv.eventItem.event,
  context: contextEnv->getHandlerContext(~inMemoryStore, ~loadLayer, ~shouldSaveHistory),
  loaderReturn,
}
