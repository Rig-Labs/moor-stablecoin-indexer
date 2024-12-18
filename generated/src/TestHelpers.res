/***** TAKE NOTE ******
This is a hack to get genType to work!

In order for genType to produce recursive types, it needs to be at the 
root module of a file. If it's defined in a nested module it does not 
work. So all the MockDb types and internal functions are defined in TestHelpers_MockDb
and only public functions are recreated and exported from this module.

the following module:
```rescript
module MyModule = {
  @genType
  type rec a = {fieldB: b}
  @genType and b = {fieldA: a}
}
```

produces the following in ts:
```ts
// tslint:disable-next-line:interface-over-type-literal
export type MyModule_a = { readonly fieldB: b };

// tslint:disable-next-line:interface-over-type-literal
export type MyModule_b = { readonly fieldA: MyModule_a };
```

fieldB references type b which doesn't exist because it's defined
as MyModule_b
*/

module MockDb = {
  @genType
  let createMockDb = TestHelpers_MockDb.createMockDb
}

@genType
module Addresses = {
  include TestHelpers_MockAddresses
}

module EventFunctions = {
  //Note these are made into a record to make operate in the same way
  //for Res, JS and TS.

  /**
  The arguements that get passed to a "processEvent" helper function
  */
  @genType
  type eventProcessorArgs<'event> = {
    event: 'event,
    mockDb: TestHelpers_MockDb.t,
    chainId?: int,
  }

  @genType
  type eventProcessor<'event> = eventProcessorArgs<'event> => promise<TestHelpers_MockDb.t>

  /**
  A function composer to help create individual processEvent functions
  */
  let makeEventProcessor = (~contractName, ~eventName, ~handlerRegister, ~paramsRawEventSchema) => {
    async args => {
      let {event, mockDb, ?chainId} = args->(Utils.magic: eventProcessorArgs<'event> => eventProcessorArgs<Internal.event>)
      let paramsRawEventSchema = paramsRawEventSchema->(Utils.magic: S.t<'eventArgs> => S.t<Internal.eventParams>)

      let config = RegisterHandlers.getConfig()

      // The user can specify a chainId of an event or leave it off
      // and it will default to the first chain in the config
      let chain = switch chainId {
      | Some(chainId) => config->Config.getChain(~chainId)
      | None =>
        switch config.defaultChain {
        | Some(chainConfig) => chainConfig.chain
        | None =>
          Js.Exn.raiseError(
            "No default chain Id found, please add at least 1 chain to your config.yaml",
          )
        }
      }

      //Create an individual logging context for traceability
      let logger = Logging.createChild(
        ~params={
          "Context": `Test Processor for "${eventName}" event on contract "${contractName}"`,
          "Chain ID": chain->ChainMap.Chain.toChainId,
          "event": event,
        },
      )

      //Deep copy the data in mockDb, mutate the clone and return the clone
      //So no side effects occur here and state can be compared between process
      //steps
      let mockDbClone = mockDb->TestHelpers_MockDb.cloneMockDb

      if !(handlerRegister->Types.HandlerTypes.Register.hasRegistration) {
        Not_found->ErrorHandling.mkLogAndRaise(
          ~logger,
          ~msg=`No registered handler found for "${eventName}" on contract "${contractName}"`,
        )
      }
      //Construct a new instance of an in memory store to run for the given event
      let inMemoryStore = InMemoryStore.make()
      let loadLayer = LoadLayer.make(
        ~loadEntitiesByIds=TestHelpers_MockDb.makeLoadEntitiesByIds(mockDbClone),
        ~makeLoadEntitiesByField=(~entityMod) =>
          TestHelpers_MockDb.makeLoadEntitiesByField(mockDbClone, ~entityMod),
      )

      //No need to check contract is registered or return anything.
      //The only purpose is to test the registerContract function and to
      //add the entity to the in memory store for asserting registrations

      let loader = handlerRegister->Types.HandlerTypes.Register.getLoader
      let handler = handlerRegister->Types.HandlerTypes.Register.getHandler
      let eventItem: Internal.eventItem = {
        event,
        eventName,
        contractName,
        loader,
        handler,
        contractRegister: handlerRegister->Types.HandlerTypes.Register.getContractRegister,
        paramsRawEventSchema,
        chain,
        logIndex: event.logIndex,
        timestamp: event.block->Types.Block.getTimestamp,
        blockNumber: event.block->Types.Block.getNumber,
      }

      switch handlerRegister->Types.HandlerTypes.Register.getContractRegister {
      | Some(contractRegister) =>
        switch contractRegister->EventProcessing.runEventContractRegister(
          ~logger,
          ~eventItem,
          ~checkContractIsRegistered=(~chain as _, ~contractAddress as _, ~contractName as _) =>
            false,
          ~dynamicContractRegistrations=None,
          ~inMemoryStore,
          ~shouldSaveHistory=false,
        ) {
        | Ok(_) => ()
        | Error(e) => e->ErrorHandling.logAndRaise
        }
      | None => () //No need to run contract registration
      }

      switch handler {
      | Some(handler) =>
        switch await eventItem->EventProcessing.runEventHandler(
          ~inMemoryStore,
          ~loader,
          ~handler,
          ~loadLayer,
          ~logger,
          ~shouldSaveHistory=false,
        ) {
        | Ok(_) => ()
        | Error(e) => e->ErrorHandling.logAndRaise
        }
      | None => () //No need to run handler
      }

      //In mem store can still contatin raw events and dynamic contracts for the
      //testing framework in cases where either contract register or loaderHandler
      //is None
      mockDbClone->TestHelpers_MockDb.writeFromMemoryStore(~inMemoryStore)
      mockDbClone
    }
  }

  module MockBlock = {
    @genType
    type t = {
      height?: int,
      id?: string,
      time?: int,
    }

    let toBlock = (_mock: t) => {
      height: _mock.height->Belt.Option.getWithDefault(0),
      id: _mock.id->Belt.Option.getWithDefault("foo"),
      time: _mock.time->Belt.Option.getWithDefault(0),
    }->(Utils.magic: Types.AggregatedBlock.t => Internal.eventBlock)
  }

  module MockTransaction = {
    @genType
    type t = {
      id?: string,
    }

    let toTransaction = (_mock: t) => {
      id: _mock.id->Belt.Option.getWithDefault("foo"),
    }->(Utils.magic: Types.AggregatedTransaction.t => Internal.eventTransaction)
  }

  @genType
  type mockEventData = {
    chainId?: int,
    srcAddress?: Address.t,
    logIndex?: int,
    block?: MockBlock.t,
    transaction?: MockTransaction.t,
  }

  /**
  Applies optional paramters with defaults for all common eventLog field
  */
  let makeEventMocker = (
    ~params: Internal.eventParams,
    ~mockEventData: option<mockEventData>,
  ): Internal.event => {
    let {?block, ?transaction, ?srcAddress, ?chainId, ?logIndex} =
      mockEventData->Belt.Option.getWithDefault({})
    let block = block->Belt.Option.getWithDefault({})->MockBlock.toBlock
    let transaction = transaction->Belt.Option.getWithDefault({})->MockTransaction.toTransaction
    {
      params,
      transaction,
      chainId: chainId->Belt.Option.getWithDefault(1),
      block,
      srcAddress: srcAddress->Belt.Option.getWithDefault(Addresses.defaultAddress),
      logIndex: logIndex->Belt.Option.getWithDefault(0),
    }
  }
}


module BorrowOperations = {
  module OpenTroveEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.BorrowOperations.OpenTroveEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.BorrowOperations.contractName,
      ~eventName=Types.BorrowOperations.OpenTroveEvent.name,
      ~handlerRegister=Types.BorrowOperations.OpenTroveEvent.handlerRegister,
      ~paramsRawEventSchema=Types.BorrowOperations.OpenTroveEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.BorrowOperations.OpenTroveEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.BorrowOperations.OpenTroveEvent.event)
    }
  }

  module CloseTroveEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.BorrowOperations.CloseTroveEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.BorrowOperations.contractName,
      ~eventName=Types.BorrowOperations.CloseTroveEvent.name,
      ~handlerRegister=Types.BorrowOperations.CloseTroveEvent.handlerRegister,
      ~paramsRawEventSchema=Types.BorrowOperations.CloseTroveEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.BorrowOperations.CloseTroveEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.BorrowOperations.CloseTroveEvent.event)
    }
  }

  module AdjustTroveEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.BorrowOperations.AdjustTroveEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.BorrowOperations.contractName,
      ~eventName=Types.BorrowOperations.AdjustTroveEvent.name,
      ~handlerRegister=Types.BorrowOperations.AdjustTroveEvent.handlerRegister,
      ~paramsRawEventSchema=Types.BorrowOperations.AdjustTroveEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.BorrowOperations.AdjustTroveEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.BorrowOperations.AdjustTroveEvent.event)
    }
  }

}


module FPTStaking = {
  module StakeEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FPTStaking.StakeEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FPTStaking.contractName,
      ~eventName=Types.FPTStaking.StakeEvent.name,
      ~handlerRegister=Types.FPTStaking.StakeEvent.handlerRegister,
      ~paramsRawEventSchema=Types.FPTStaking.StakeEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.FPTStaking.StakeEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.FPTStaking.StakeEvent.event)
    }
  }

  module UnstakeEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FPTStaking.UnstakeEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FPTStaking.contractName,
      ~eventName=Types.FPTStaking.UnstakeEvent.name,
      ~handlerRegister=Types.FPTStaking.UnstakeEvent.handlerRegister,
      ~paramsRawEventSchema=Types.FPTStaking.UnstakeEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.FPTStaking.UnstakeEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.FPTStaking.UnstakeEvent.event)
    }
  }

}


module StabilityPool = {
  module StabilityPoolLiquidationEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.StabilityPool.StabilityPoolLiquidationEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.StabilityPool.contractName,
      ~eventName=Types.StabilityPool.StabilityPoolLiquidationEvent.name,
      ~handlerRegister=Types.StabilityPool.StabilityPoolLiquidationEvent.handlerRegister,
      ~paramsRawEventSchema=Types.StabilityPool.StabilityPoolLiquidationEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.StabilityPool.StabilityPoolLiquidationEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.StabilityPool.StabilityPoolLiquidationEvent.event)
    }
  }

  module ProvideToStabilityPoolEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.StabilityPool.ProvideToStabilityPoolEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.StabilityPool.contractName,
      ~eventName=Types.StabilityPool.ProvideToStabilityPoolEvent.name,
      ~handlerRegister=Types.StabilityPool.ProvideToStabilityPoolEvent.handlerRegister,
      ~paramsRawEventSchema=Types.StabilityPool.ProvideToStabilityPoolEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.StabilityPool.ProvideToStabilityPoolEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.StabilityPool.ProvideToStabilityPoolEvent.event)
    }
  }

  module WithdrawFromStabilityPoolEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.StabilityPool.WithdrawFromStabilityPoolEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.StabilityPool.contractName,
      ~eventName=Types.StabilityPool.WithdrawFromStabilityPoolEvent.name,
      ~handlerRegister=Types.StabilityPool.WithdrawFromStabilityPoolEvent.handlerRegister,
      ~paramsRawEventSchema=Types.StabilityPool.WithdrawFromStabilityPoolEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.StabilityPool.WithdrawFromStabilityPoolEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.StabilityPool.WithdrawFromStabilityPoolEvent.event)
    }
  }

}


module TroveManager = {
  module TrovePartialLiquidationEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.TroveManager.TrovePartialLiquidationEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.TroveManager.contractName,
      ~eventName=Types.TroveManager.TrovePartialLiquidationEvent.name,
      ~handlerRegister=Types.TroveManager.TrovePartialLiquidationEvent.handlerRegister,
      ~paramsRawEventSchema=Types.TroveManager.TrovePartialLiquidationEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.TroveManager.TrovePartialLiquidationEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.TroveManager.TrovePartialLiquidationEvent.event)
    }
  }

  module TroveFullLiquidationEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.TroveManager.TroveFullLiquidationEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.TroveManager.contractName,
      ~eventName=Types.TroveManager.TroveFullLiquidationEvent.name,
      ~handlerRegister=Types.TroveManager.TroveFullLiquidationEvent.handlerRegister,
      ~paramsRawEventSchema=Types.TroveManager.TroveFullLiquidationEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.TroveManager.TroveFullLiquidationEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.TroveManager.TroveFullLiquidationEvent.event)
    }
  }

  module RedemptionEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.TroveManager.RedemptionEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.TroveManager.contractName,
      ~eventName=Types.TroveManager.RedemptionEvent.name,
      ~handlerRegister=Types.TroveManager.RedemptionEvent.handlerRegister,
      ~paramsRawEventSchema=Types.TroveManager.RedemptionEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.TroveManager.RedemptionEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.TroveManager.RedemptionEvent.event)
    }
  }

}


module USDF = {
  module TotalSupplyEvent = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.USDF.TotalSupplyEvent.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.USDF.contractName,
      ~eventName=Types.USDF.TotalSupplyEvent.name,
      ~handlerRegister=Types.USDF.TotalSupplyEvent.handlerRegister,
      ~paramsRawEventSchema=Types.USDF.TotalSupplyEvent.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.USDF.TotalSupplyEvent.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.USDF.TotalSupplyEvent.event)
    }
  }

  module Mint = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.USDF.Mint.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.USDF.contractName,
      ~eventName=Types.USDF.Mint.name,
      ~handlerRegister=Types.USDF.Mint.handlerRegister,
      ~paramsRawEventSchema=Types.USDF.Mint.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.USDF.Mint.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.USDF.Mint.event)
    }
  }

  module Burn = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.USDF.Burn.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.USDF.contractName,
      ~eventName=Types.USDF.Burn.name,
      ~handlerRegister=Types.USDF.Burn.handlerRegister,
      ~paramsRawEventSchema=Types.USDF.Burn.paramsRawEventSchema,
    )

    @genType
    let mockData = (params) => {
      EventFunctions.makeEventMocker(
        ~params=params->(Utils.magic: Types.USDF.Burn.eventArgs => Internal.eventParams),
        ~mockEventData=None
      )->(Utils.magic: Internal.event => Types.USDF.Burn.event)
    }
  }

}

