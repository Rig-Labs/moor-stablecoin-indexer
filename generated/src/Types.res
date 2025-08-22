//*************
//***ENTITIES**
//*************
@genType.as("Id")
type id = string

@genType
type contractRegistrations = {
  // TODO: only add contracts we've registered for the event in the config
  addBorrowOperations: (Address.t) => unit,
  addStabilityPool: (Address.t) => unit,
  addTroveManager: (Address.t) => unit,
  addUSDM: (Address.t) => unit,
}

@genType
type entityLoaderContext<'entity, 'indexedFieldOperations> = {
  get: id => promise<option<'entity>>,
  getWhere: 'indexedFieldOperations,
}

@genType
type loaderContext = {
  log: Logs.userLogger,
  @as("BorrowOperations_AdjustTroveEvent") borrowOperations_AdjustTroveEvent: entityLoaderContext<Entities.BorrowOperations_AdjustTroveEvent.t, Entities.BorrowOperations_AdjustTroveEvent.indexedFieldOperations>,
  @as("BorrowOperations_CloseTroveEvent") borrowOperations_CloseTroveEvent: entityLoaderContext<Entities.BorrowOperations_CloseTroveEvent.t, Entities.BorrowOperations_CloseTroveEvent.indexedFieldOperations>,
  @as("BorrowOperations_OpenTroveEvent") borrowOperations_OpenTroveEvent: entityLoaderContext<Entities.BorrowOperations_OpenTroveEvent.t, Entities.BorrowOperations_OpenTroveEvent.indexedFieldOperations>,
  @as("StabilityPool_ProvideToStabilityPoolEvent") stabilityPool_ProvideToStabilityPoolEvent: entityLoaderContext<Entities.StabilityPool_ProvideToStabilityPoolEvent.t, Entities.StabilityPool_ProvideToStabilityPoolEvent.indexedFieldOperations>,
  @as("StabilityPool_StabilityPoolLiquidationEvent") stabilityPool_StabilityPoolLiquidationEvent: entityLoaderContext<Entities.StabilityPool_StabilityPoolLiquidationEvent.t, Entities.StabilityPool_StabilityPoolLiquidationEvent.indexedFieldOperations>,
  @as("StabilityPool_WithdrawFromStabilityPoolEvent") stabilityPool_WithdrawFromStabilityPoolEvent: entityLoaderContext<Entities.StabilityPool_WithdrawFromStabilityPoolEvent.t, Entities.StabilityPool_WithdrawFromStabilityPoolEvent.indexedFieldOperations>,
  @as("TroveManager_RedemptionEvent") troveManager_RedemptionEvent: entityLoaderContext<Entities.TroveManager_RedemptionEvent.t, Entities.TroveManager_RedemptionEvent.indexedFieldOperations>,
  @as("TroveManager_TroveFullLiquidationEvent") troveManager_TroveFullLiquidationEvent: entityLoaderContext<Entities.TroveManager_TroveFullLiquidationEvent.t, Entities.TroveManager_TroveFullLiquidationEvent.indexedFieldOperations>,
  @as("TroveManager_TrovePartialLiquidationEvent") troveManager_TrovePartialLiquidationEvent: entityLoaderContext<Entities.TroveManager_TrovePartialLiquidationEvent.t, Entities.TroveManager_TrovePartialLiquidationEvent.indexedFieldOperations>,
  @as("USDM_Burn") uSDM_Burn: entityLoaderContext<Entities.USDM_Burn.t, Entities.USDM_Burn.indexedFieldOperations>,
  @as("USDM_Mint") uSDM_Mint: entityLoaderContext<Entities.USDM_Mint.t, Entities.USDM_Mint.indexedFieldOperations>,
  @as("USDM_TotalSupplyEvent") uSDM_TotalSupplyEvent: entityLoaderContext<Entities.USDM_TotalSupplyEvent.t, Entities.USDM_TotalSupplyEvent.indexedFieldOperations>,
}

@genType
type entityHandlerContext<'entity> = {
  get: id => promise<option<'entity>>,
  set: 'entity => unit,
  deleteUnsafe: id => unit,
}


@genType
type handlerContext = {
  log: Logs.userLogger,
  @as("BorrowOperations_AdjustTroveEvent") borrowOperations_AdjustTroveEvent: entityHandlerContext<Entities.BorrowOperations_AdjustTroveEvent.t>,
  @as("BorrowOperations_CloseTroveEvent") borrowOperations_CloseTroveEvent: entityHandlerContext<Entities.BorrowOperations_CloseTroveEvent.t>,
  @as("BorrowOperations_OpenTroveEvent") borrowOperations_OpenTroveEvent: entityHandlerContext<Entities.BorrowOperations_OpenTroveEvent.t>,
  @as("StabilityPool_ProvideToStabilityPoolEvent") stabilityPool_ProvideToStabilityPoolEvent: entityHandlerContext<Entities.StabilityPool_ProvideToStabilityPoolEvent.t>,
  @as("StabilityPool_StabilityPoolLiquidationEvent") stabilityPool_StabilityPoolLiquidationEvent: entityHandlerContext<Entities.StabilityPool_StabilityPoolLiquidationEvent.t>,
  @as("StabilityPool_WithdrawFromStabilityPoolEvent") stabilityPool_WithdrawFromStabilityPoolEvent: entityHandlerContext<Entities.StabilityPool_WithdrawFromStabilityPoolEvent.t>,
  @as("TroveManager_RedemptionEvent") troveManager_RedemptionEvent: entityHandlerContext<Entities.TroveManager_RedemptionEvent.t>,
  @as("TroveManager_TroveFullLiquidationEvent") troveManager_TroveFullLiquidationEvent: entityHandlerContext<Entities.TroveManager_TroveFullLiquidationEvent.t>,
  @as("TroveManager_TrovePartialLiquidationEvent") troveManager_TrovePartialLiquidationEvent: entityHandlerContext<Entities.TroveManager_TrovePartialLiquidationEvent.t>,
  @as("USDM_Burn") uSDM_Burn: entityHandlerContext<Entities.USDM_Burn.t>,
  @as("USDM_Mint") uSDM_Mint: entityHandlerContext<Entities.USDM_Mint.t>,
  @as("USDM_TotalSupplyEvent") uSDM_TotalSupplyEvent: entityHandlerContext<Entities.USDM_TotalSupplyEvent.t>,
}

//Re-exporting types for backwards compatability
@genType.as("BorrowOperations_AdjustTroveEvent")
type borrowOperations_AdjustTroveEvent = Entities.BorrowOperations_AdjustTroveEvent.t
@genType.as("BorrowOperations_CloseTroveEvent")
type borrowOperations_CloseTroveEvent = Entities.BorrowOperations_CloseTroveEvent.t
@genType.as("BorrowOperations_OpenTroveEvent")
type borrowOperations_OpenTroveEvent = Entities.BorrowOperations_OpenTroveEvent.t
@genType.as("StabilityPool_ProvideToStabilityPoolEvent")
type stabilityPool_ProvideToStabilityPoolEvent = Entities.StabilityPool_ProvideToStabilityPoolEvent.t
@genType.as("StabilityPool_StabilityPoolLiquidationEvent")
type stabilityPool_StabilityPoolLiquidationEvent = Entities.StabilityPool_StabilityPoolLiquidationEvent.t
@genType.as("StabilityPool_WithdrawFromStabilityPoolEvent")
type stabilityPool_WithdrawFromStabilityPoolEvent = Entities.StabilityPool_WithdrawFromStabilityPoolEvent.t
@genType.as("TroveManager_RedemptionEvent")
type troveManager_RedemptionEvent = Entities.TroveManager_RedemptionEvent.t
@genType.as("TroveManager_TroveFullLiquidationEvent")
type troveManager_TroveFullLiquidationEvent = Entities.TroveManager_TroveFullLiquidationEvent.t
@genType.as("TroveManager_TrovePartialLiquidationEvent")
type troveManager_TrovePartialLiquidationEvent = Entities.TroveManager_TrovePartialLiquidationEvent.t
@genType.as("USDM_Burn")
type uSDM_Burn = Entities.USDM_Burn.t
@genType.as("USDM_Mint")
type uSDM_Mint = Entities.USDM_Mint.t
@genType.as("USDM_TotalSupplyEvent")
type uSDM_TotalSupplyEvent = Entities.USDM_TotalSupplyEvent.t

type eventIdentifier = {
  chainId: int,
  blockTimestamp: int,
  blockNumber: int,
  logIndex: int,
}

type entityUpdateAction<'entityType> =
  | Set('entityType)
  | Delete

type entityUpdate<'entityType> = {
  eventIdentifier: eventIdentifier,
  entityId: id,
  entityUpdateAction: entityUpdateAction<'entityType>,
}

let mkEntityUpdate = (~eventIdentifier, ~entityId, entityUpdateAction) => {
  entityId,
  eventIdentifier,
  entityUpdateAction,
}

type entityValueAtStartOfBatch<'entityType> =
  | NotSet // The entity isn't in the DB yet
  | AlreadySet('entityType)

type updatedValue<'entityType> = {
  latest: entityUpdate<'entityType>,
  history: array<entityUpdate<'entityType>>,
}

@genType
type inMemoryStoreRowEntity<'entityType> =
  | Updated(updatedValue<'entityType>)
  | InitialReadFromDb(entityValueAtStartOfBatch<'entityType>) // This means there is no change from the db.

//*************
//**CONTRACTS**
//*************

module Transaction = {
  @genType
  type t = {id: string}

  let schema = S.object((s): t => {id: s.field("id", S.string)})
}

module Block = {
  @genType
  type t = {id: string, height: int, time: int}

  let schema = S.object((s): t => {id: s.field("id", S.string), height: s.field("height", GqlDbCustomTypes.Int.schema), time: s.field("time", GqlDbCustomTypes.Int.schema)})

  @get
  external getNumber: Internal.eventBlock => int = "height"

  @get
  external getTimestamp: Internal.eventBlock => int = "time"
 
  @get
  external getId: Internal.eventBlock => string = "id"

  let cleanUpRawEventFieldsInPlace: Js.Json.t => () = %raw(`fields => {
    delete fields.id
    delete fields.height
    delete fields.time
  }`)
}

module AggregatedBlock = {
  @genType
  type t = {time: int, id: string, height: int}
  let schema = S.object((s): t => {time: s.field("time", GqlDbCustomTypes.Int.schema), id: s.field("id", S.string), height: s.field("height", GqlDbCustomTypes.Int.schema)})
    ->(Utils.magic: S.t<t> => S.t<Internal.eventBlock>)
}
module AggregatedTransaction = {
  @genType
  type t = {id: string}
  let schema = S.object((s): t => {id: s.field("id", S.string)})
    ->(Utils.magic: S.t<t> => S.t<Internal.eventTransaction>)
}

@genType.as("EventLog")
type eventLog<'params> = Internal.genericEvent<'params, Block.t, Transaction.t>

module SingleOrMultiple: {
  @genType.import(("./bindings/OpaqueTypes", "SingleOrMultiple"))
  type t<'a>
  let normalizeOrThrow: (t<'a>, ~nestedArrayDepth: int=?) => array<'a>
  let single: 'a => t<'a>
  let multiple: array<'a> => t<'a>
} = {
  type t<'a> = Js.Json.t

  external single: 'a => t<'a> = "%identity"
  external multiple: array<'a> => t<'a> = "%identity"
  external castMultiple: t<'a> => array<'a> = "%identity"
  external castSingle: t<'a> => 'a = "%identity"

  exception AmbiguousEmptyNestedArray

  let rec isMultiple = (t: t<'a>, ~nestedArrayDepth): bool =>
    switch t->Js.Json.decodeArray {
    | None => false
    | Some(_arr) if nestedArrayDepth == 0 => true
    | Some([]) if nestedArrayDepth > 0 =>
      AmbiguousEmptyNestedArray->ErrorHandling.mkLogAndRaise(
        ~msg="The given empty array could be interperated as a flat array (value) or nested array. Since it's ambiguous,
        please pass in a nested empty array if the intention is to provide an empty array as a value",
      )
    | Some(arr) => arr->Js.Array2.unsafe_get(0)->isMultiple(~nestedArrayDepth=nestedArrayDepth - 1)
    }

  let normalizeOrThrow = (t: t<'a>, ~nestedArrayDepth=0): array<'a> => {
    if t->isMultiple(~nestedArrayDepth) {
      t->castMultiple
    } else {
      [t->castSingle]
    }
  }
}

module HandlerTypes = {
  @genType
  type args<'eventArgs, 'context> = {
    event: eventLog<'eventArgs>,
    context: 'context,
  }

  @genType
  type contractRegisterArgs<'eventArgs> = Internal.genericContractRegisterArgs<eventLog<'eventArgs>, contractRegistrations>
  @genType
  type contractRegister<'eventArgs> = Internal.genericContractRegister<contractRegisterArgs<'eventArgs>>

  @genType
  type loaderArgs<'eventArgs> = Internal.genericLoaderArgs<eventLog<'eventArgs>, loaderContext>
  @genType
  type loader<'eventArgs, 'loaderReturn> = Internal.genericLoader<loaderArgs<'eventArgs>, 'loaderReturn>

  @genType
  type handlerArgs<'eventArgs, 'loaderReturn> = Internal.genericHandlerArgs<eventLog<'eventArgs>, handlerContext, 'loaderReturn>

  @genType
  type handler<'eventArgs, 'loaderReturn> = Internal.genericHandler<handlerArgs<'eventArgs, 'loaderReturn>>

  @genType
  type loaderHandler<'eventArgs, 'loaderReturn, 'eventFilter> = Internal.genericHandlerWithLoader<
    loader<'eventArgs, 'loaderReturn>,
    handler<'eventArgs, 'loaderReturn>,
    SingleOrMultiple.t<'eventFilter>
  >

  @genType
  type eventConfig<'eventFilter> = {
    wildcard?: bool,
    eventFilters?: SingleOrMultiple.t<'eventFilter>,
    preRegisterDynamicContracts?: bool,
  }

  module EventOptions = {
    type t = {
      isWildcard: bool,
      topicSelections: array<LogSelection.topicSelection>,
      preRegisterDynamicContracts: bool,
    }

    let getDefault = (~topic0) => {
      isWildcard: false,
      topicSelections: [LogSelection.makeTopicSelection(~topic0=[topic0])->Utils.unwrapResultExn],
      preRegisterDynamicContracts: false,
    }

    let make = (
      ~isWildcard,
      ~topicSelections: array<LogSelection.topicSelection>,
      ~preRegisterDynamicContracts,
    ) => {
      let topic0sGrouped = []
      let topicSelectionWithFilters = []
      topicSelections->Belt.Array.forEach(ts =>
        if ts->LogSelection.hasFilters {
          topicSelectionWithFilters->Js.Array2.push(ts)->ignore
        } else {
          ts.topic0->Belt.Array.forEach(topic0 => {
            topic0sGrouped->Js.Array2.push(topic0)->ignore
          })
        }
      )
      let topicSelections = switch topic0sGrouped {
      | [] => topicSelectionWithFilters
      | topic0sGrouped =>
        [
          LogSelection.makeTopicSelection(~topic0=topic0sGrouped)->Utils.unwrapResultExn,
        ]->Belt.Array.concat(topicSelectionWithFilters)
      }

      {
        isWildcard,
        topicSelections,
        preRegisterDynamicContracts,
      }
    }
  }

  module Register: {
    type t
    let make: (~topic0: EvmTypes.Hex.t, ~contractName: string, ~eventName: string) => t
    let setLoaderHandler: (
      t,
      Internal.genericHandlerWithLoader<'loader, 'handler, 'eventFilters>,
      ~getEventOptions: Internal.genericHandlerWithLoader<'loader, 'handler, 'eventFilters> => option<
        EventOptions.t,
      >,
      ~logger: Pino.t=?,
    ) => unit
    let setContractRegister: (
      t,
      Internal.genericContractRegister<Internal.genericContractRegisterArgs<'event, 'context>>,
      ~eventOptions: option<EventOptions.t>,
      ~logger: Pino.t=?,
    ) => unit
    let noopLoader: Internal.genericLoader<'event, ()>
    let getLoader: t => option<Internal.loader>
    let getHandler: t => option<Internal.handler>
    let getContractRegister: t => option<Internal.contractRegister>
    let getEventOptions: t => EventOptions.t
    let hasRegistration: t => bool
  } = {
    type eventFilter
    type handlerWithLoader = Internal.genericHandlerWithLoader<Internal.loader, Internal.handler, SingleOrMultiple.t<eventFilter>>

    type t = {
      contractName: string,
      eventName: string,
      topic0: EvmTypes.Hex.t,
      mutable loaderHandler: option<handlerWithLoader>,
      mutable contractRegister: option<Internal.contractRegister>,
      mutable eventOptions: option<EventOptions.t>,
    }

    let noopLoader = _ => Promise.resolve()

    let getLoader = (t: t) => 
      switch t.loaderHandler {
        | Some({loader}) => {
          if loader === noopLoader->(Utils.magic: Internal.genericLoader<'event, ()> => Internal.loader) {
            None
          } else {
            Some(loader)
          }
        }
        | None => None
      }

    let getHandler = (t: t) => 
      switch t.loaderHandler {
        | Some({handler}) => Some(handler)
        | None => None
      }

    let getContractRegister = (t: t) => t.contractRegister

    let getEventOptions = ({eventOptions, topic0}: t): EventOptions.t =>
      switch eventOptions {
      | Some(eventOptions) => eventOptions
      | None => EventOptions.getDefault(~topic0)
      }

    let hasRegistration = ({loaderHandler, contractRegister}) =>
      loaderHandler->Belt.Option.isSome || contractRegister->Belt.Option.isSome

    let make = (~topic0, ~contractName, ~eventName) => {
      contractName,
      eventName,
      topic0,
      loaderHandler: None,
      contractRegister: None,
      eventOptions: None,
    }

    type eventNamespace = {contractName: string, eventName: string}
    exception DuplicateEventRegistration(eventNamespace)

    let setEventOptions = (t: t, value: EventOptions.t, ~logger=Logging.logger) => {
      switch t.eventOptions {
      | None => t.eventOptions = Some(value)
      | Some(_) =>
        let eventNamespace = {contractName: t.contractName, eventName: t.eventName}
        DuplicateEventRegistration(eventNamespace)->ErrorHandling.mkLogAndRaise(
          ~logger=Logging.createChildFrom(~logger, ~params=eventNamespace),
          ~msg="Duplicate eventOptions in handlers not allowed",
        )
      }
    }

    let setLoaderHandler = (
      t: t,
      value,
      ~getEventOptions,
      ~logger=Logging.logger,
    ) => {
      switch t.loaderHandler {
      | None =>
        t.loaderHandler =
          value
          ->(Utils.magic: Internal.genericHandlerWithLoader<'loader, 'handler, 'eventFilters> => handlerWithLoader)
          ->Some
      | Some(_) =>
        let eventNamespace = {contractName: t.contractName, eventName: t.eventName}
        DuplicateEventRegistration(eventNamespace)->ErrorHandling.mkLogAndRaise(
          ~logger=Logging.createChildFrom(~logger, ~params=eventNamespace),
          ~msg="Duplicate registration of event handlers not allowed",
        )
      }

      switch getEventOptions(value) {
      | Some(eventOptions) => t->setEventOptions(eventOptions, ~logger)
      | None => ()
      }
    }

    let setContractRegister = (
      t: t,
      value,
      ~eventOptions,
      ~logger=Logging.logger,
    ) => {
      switch t.contractRegister {
      | None => t.contractRegister = Some(value->(Utils.magic: Internal.genericContractRegister<Internal.genericContractRegisterArgs<'event, 'context>> => Internal.contractRegister))
      | Some(_) =>
        let eventNamespace = {contractName: t.contractName, eventName: t.eventName}
        DuplicateEventRegistration(eventNamespace)->ErrorHandling.mkLogAndRaise(
          ~logger=Logging.createChildFrom(~logger, ~params=eventNamespace),
          ~msg="Duplicate contractRegister handlers not allowed",
        )
      }
      switch eventOptions {
      | Some(eventOptions) => t->setEventOptions(eventOptions, ~logger)
      | None => ()
      }
    }
  }
}

module type Event = {
  let sighash: string // topic0 for Evm and rb for Fuel receipts
  let topicCount: int // Number of topics for evm, always 0 for fuel
  let name: string
  let contractName: string

  type eventArgs
  type block
  type transaction

  type event = Internal.genericEvent<eventArgs, block, transaction>
  type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
  type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
  type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

  let paramsRawEventSchema: S.schema<eventArgs>
  let blockSchema: S.schema<block>
  let transactionSchema: S.schema<transaction>

  let convertHyperSyncEventArgs: HyperSyncClient.Decoder.decodedEvent => eventArgs
  let handlerRegister: HandlerTypes.Register.t

  type eventFilter
  let getTopicSelection: SingleOrMultiple.t<eventFilter> => array<LogSelection.topicSelection>
}
module type InternalEvent = Event
  with type eventArgs = Internal.eventParams
  and type transaction = Internal.eventTransaction
  and type block = Internal.eventBlock
external eventModToInternal: module(Event with type eventArgs = 'a) => module(InternalEvent) = "%identity"
external eventModWithoutArgTypeToInternal: module(Event) => module(InternalEvent) = "%identity"

let makeEventOptions = (
  type eventFilter,
  eventConfig: option<HandlerTypes.eventConfig<eventFilter>>,
  eventMod: module(Event with type eventFilter = eventFilter),
) => {
  let module(Event) = eventMod
  open Belt
  eventConfig->Option.map(({?wildcard, ?eventFilters, ?preRegisterDynamicContracts}) =>
    HandlerTypes.EventOptions.make(
      ~isWildcard=wildcard->Option.getWithDefault(false),
      ~topicSelections=eventFilters->Option.mapWithDefault(
        [
          LogSelection.makeTopicSelection(
            ~topic0=[Event.sighash->EvmTypes.Hex.fromStringUnsafe],
          )->Utils.unwrapResultExn,
        ],
        v => v->Event.getTopicSelection,
      ),
      ~preRegisterDynamicContracts=preRegisterDynamicContracts->Option.getWithDefault(false),
    )
  )
}

let makeGetEventOptions = (
  type eventFilter eventArgs,
  eventMod: module(Event with type eventFilter = eventFilter and type eventArgs = eventArgs),
) => {
  open Belt
  let module(Event) = eventMod
  (loaderHandler: Internal.genericHandlerWithLoader<'loader, 'handler, SingleOrMultiple.t<Event.eventFilter>>) =>
    switch loaderHandler {
    | {wildcard: ?None, eventFilters: ?None, preRegisterDynamicContracts: ?None} => None
    | {?wildcard, ?eventFilters, ?preRegisterDynamicContracts} =>
      let topicSelections =
        eventFilters->Option.mapWithDefault(
          [
            LogSelection.makeTopicSelection(
              ~topic0=[Event.sighash->EvmTypes.Hex.fromStringUnsafe],
            )->Utils.unwrapResultExn,
          ],
          v => v->Event.getTopicSelection,
        )
      HandlerTypes.EventOptions.make(
        ~isWildcard=wildcard->Option.getWithDefault(false),
        ~topicSelections,
        ~preRegisterDynamicContracts=preRegisterDynamicContracts->Option.getWithDefault(false),
      )->Some
    }
}

@genType.import(("./bindings/OpaqueTypes.ts", "HandlerWithOptions"))
type fnWithEventConfig<'fn, 'eventConfig> = ('fn, ~eventConfig: 'eventConfig=?) => unit

@genType
type handlerWithOptions<'eventArgs, 'loaderReturn, 'eventFilter> = fnWithEventConfig<
  HandlerTypes.handler<'eventArgs, 'loaderReturn>,
  HandlerTypes.eventConfig<'eventFilter>,
>

@genType
type contractRegisterWithOptions<'eventArgs, 'eventFilter> = fnWithEventConfig<
  HandlerTypes.contractRegister<'eventArgs>,
  HandlerTypes.eventConfig<'eventFilter>,
>

module MakeRegister = (Event: Event) => {
  let handler: fnWithEventConfig<
    Event.handler<unit>,
    HandlerTypes.eventConfig<Event.eventFilter>,
  > = (
    handler,
    ~eventConfig=?,
  ) => {
    Event.handlerRegister->HandlerTypes.Register.setLoaderHandler(
      {
        loader: HandlerTypes.Register.noopLoader,
        handler,
        wildcard: ?eventConfig->Belt.Option.flatMap(c => c.wildcard),
        eventFilters: ?eventConfig->Belt.Option.flatMap(c => c.eventFilters),
        preRegisterDynamicContracts: ?eventConfig->Belt.Option.flatMap(c =>
          c.preRegisterDynamicContracts
        ),
      },
      ~getEventOptions=makeGetEventOptions(module(Event)),
    )
  }

  let contractRegister: fnWithEventConfig<
    Event.contractRegister,
    HandlerTypes.eventConfig<Event.eventFilter>,
  > = (
    contractRegister,
    ~eventConfig=?,
  ) =>
    Event.handlerRegister->HandlerTypes.Register.setContractRegister(
      contractRegister,
      ~eventOptions=makeEventOptions(eventConfig, module(Event)),
    )

  let handlerWithLoader = (args: Internal.genericHandlerWithLoader<
    Event.loader<'loaderReturn>, Event.handler<'loaderReturn>, SingleOrMultiple.t<Event.eventFilter>
  >) =>
    Event.handlerRegister->HandlerTypes.Register.setLoaderHandler(
      args,
      ~getEventOptions=makeGetEventOptions(module(Event)),
    )
}

module BorrowOperations = {
let abi = Fuel.transpileAbi(%raw(`require("../../abis/borrowoperations-abi.json")`))
/*Silence warning of label defined in multiple types*/
@@warning("-30")
type rec type0 = string
 @tag("case") and type1 = | NotOwner({payload: type13})
 @tag("case") and type2 = | Address({payload: type7}) | ContractId({payload: type9})
 @tag("case") and type3 = | CannotReinitialized({payload: type13})
 and type4 = {user: type2, asset_id: type8, collateral_change: type16, debt_change: type16, is_collateral_increase: type14, is_debt_increase: type14, total_collateral: type16, total_debt: type16}
 and type5 = {user: type2, asset_id: type8, collateral: type16, debt: type16}
 and type6 = {user: type2, asset_id: type8, collateral: type16, debt: type16}
 and type7 = {bits: type0}
 and type8 = {bits: type0}
 and type9 = {bits: type0}
 and type10 = {previous_owner: type2}
 and type11 = {new_owner: type2}
 and type12 = {new_owner: type2, previous_owner: type2}
 and type13 = unit
 and type14 = bool
 and type15 = string
 and type16 = bigint
@@warning("+30")
let type0Schema = S.string
let type7Schema = S.object((s): type7 => {bits: s.field("bits", type0Schema)})
let type8Schema = S.object((s): type8 => {bits: s.field("bits", type0Schema)})
let type9Schema = S.object((s): type9 => {bits: s.field("bits", type0Schema)})
let type13Schema = S.literal(%raw(`null`))->S.variant(_ => ())
let type14Schema = S.bool
let type15Schema = S.string
let type16Schema = BigInt.schema
let type1Schema = S.union([S.object((s): type1 =>
{
  s.tag("case", "NotOwner")
  NotOwner({payload: s.field("payload", type13Schema)})
})])
let type2Schema = S.union([S.object((s): type2 =>
{
  s.tag("case", "Address")
  Address({payload: s.field("payload", type7Schema)})
}), S.object((s): type2 =>
{
  s.tag("case", "ContractId")
  ContractId({payload: s.field("payload", type9Schema)})
})])
let type3Schema = S.union([S.object((s): type3 =>
{
  s.tag("case", "CannotReinitialized")
  CannotReinitialized({payload: s.field("payload", type13Schema)})
})])
let type4Schema = S.object((s): type4 => {user: s.field("user", type2Schema), asset_id: s.field("asset_id", type8Schema), collateral_change: s.field("collateral_change", type16Schema), debt_change: s.field("debt_change", type16Schema), is_collateral_increase: s.field("is_collateral_increase", type14Schema), is_debt_increase: s.field("is_debt_increase", type14Schema), total_collateral: s.field("total_collateral", type16Schema), total_debt: s.field("total_debt", type16Schema)})
let type5Schema = S.object((s): type5 => {user: s.field("user", type2Schema), asset_id: s.field("asset_id", type8Schema), collateral: s.field("collateral", type16Schema), debt: s.field("debt", type16Schema)})
let type6Schema = S.object((s): type6 => {user: s.field("user", type2Schema), asset_id: s.field("asset_id", type8Schema), collateral: s.field("collateral", type16Schema), debt: s.field("debt", type16Schema)})
let type10Schema = S.object((s): type10 => {previous_owner: s.field("previous_owner", type2Schema)})
let type11Schema = S.object((s): type11 => {new_owner: s.field("new_owner", type2Schema)})
let type12Schema = S.object((s): type12 => {new_owner: s.field("new_owner", type2Schema), previous_owner: s.field("previous_owner", type2Schema)})
let contractName = "BorrowOperations"

module OpenTroveEvent = {

let sighash = "17081261052530365109"
let topicCount = 0
let name = "OpenTroveEvent"
let contractName = contractName

@genType
type eventArgs = type6
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = type6Schema->Utils.Schema.coerceToJsonPgType
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: LogData({
  logId: sighash,
  decode: Fuel.Receipt.getLogDataDecoder(~abi, ~logId=sighash),
}),
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}

module CloseTroveEvent = {

let sighash = "2361378587801497692"
let topicCount = 0
let name = "CloseTroveEvent"
let contractName = contractName

@genType
type eventArgs = type5
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = type5Schema->Utils.Schema.coerceToJsonPgType
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: LogData({
  logId: sighash,
  decode: Fuel.Receipt.getLogDataDecoder(~abi, ~logId=sighash),
}),
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}

module AdjustTroveEvent = {

let sighash = "6739255540342412543"
let topicCount = 0
let name = "AdjustTroveEvent"
let contractName = contractName

@genType
type eventArgs = type4
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = type4Schema->Utils.Schema.coerceToJsonPgType
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: LogData({
  logId: sighash,
  decode: Fuel.Receipt.getLogDataDecoder(~abi, ~logId=sighash),
}),
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}
}

module StabilityPool = {
let abi = Fuel.transpileAbi(%raw(`require("../../abis/stabilitypool-abi.json")`))
/*Silence warning of label defined in multiple types*/
@@warning("-30")
type rec type0 = string
 @tag("case") and type1 = | Address({payload: type5}) | ContractId({payload: type7})
 and type2 = {user: type1, amount_to_deposit: type10, initial_amount: type10, compounded_amount: type10}
 and type3 = {asset_id: type6, debt_to_offset: type10, collateral_to_offset: type10}
 and type4 = {user: type1, amount_to_withdraw: type10, initial_amount: type10, compounded_amount: type10}
 and type5 = {bits: type0}
 and type6 = {bits: type0}
 and type7 = {bits: type0}
 and type8 = unit
 and type9 = string
 and type10 = bigint
@@warning("+30")
let type0Schema = S.string
let type5Schema = S.object((s): type5 => {bits: s.field("bits", type0Schema)})
let type6Schema = S.object((s): type6 => {bits: s.field("bits", type0Schema)})
let type7Schema = S.object((s): type7 => {bits: s.field("bits", type0Schema)})
let type8Schema = S.literal(%raw(`null`))->S.variant(_ => ())
let type9Schema = S.string
let type10Schema = BigInt.schema
let type1Schema = S.union([S.object((s): type1 =>
{
  s.tag("case", "Address")
  Address({payload: s.field("payload", type5Schema)})
}), S.object((s): type1 =>
{
  s.tag("case", "ContractId")
  ContractId({payload: s.field("payload", type7Schema)})
})])
let type2Schema = S.object((s): type2 => {user: s.field("user", type1Schema), amount_to_deposit: s.field("amount_to_deposit", type10Schema), initial_amount: s.field("initial_amount", type10Schema), compounded_amount: s.field("compounded_amount", type10Schema)})
let type3Schema = S.object((s): type3 => {asset_id: s.field("asset_id", type6Schema), debt_to_offset: s.field("debt_to_offset", type10Schema), collateral_to_offset: s.field("collateral_to_offset", type10Schema)})
let type4Schema = S.object((s): type4 => {user: s.field("user", type1Schema), amount_to_withdraw: s.field("amount_to_withdraw", type10Schema), initial_amount: s.field("initial_amount", type10Schema), compounded_amount: s.field("compounded_amount", type10Schema)})
let contractName = "StabilityPool"

module StabilityPoolLiquidationEvent = {

let sighash = "4532511178510817406"
let topicCount = 0
let name = "StabilityPoolLiquidationEvent"
let contractName = contractName

@genType
type eventArgs = type3
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = type3Schema->Utils.Schema.coerceToJsonPgType
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: LogData({
  logId: sighash,
  decode: Fuel.Receipt.getLogDataDecoder(~abi, ~logId=sighash),
}),
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}

module ProvideToStabilityPoolEvent = {

let sighash = "11918694519390339650"
let topicCount = 0
let name = "ProvideToStabilityPoolEvent"
let contractName = contractName

@genType
type eventArgs = type2
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = type2Schema->Utils.Schema.coerceToJsonPgType
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: LogData({
  logId: sighash,
  decode: Fuel.Receipt.getLogDataDecoder(~abi, ~logId=sighash),
}),
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}

module WithdrawFromStabilityPoolEvent = {

let sighash = "9108112476981792364"
let topicCount = 0
let name = "WithdrawFromStabilityPoolEvent"
let contractName = contractName

@genType
type eventArgs = type4
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = type4Schema->Utils.Schema.coerceToJsonPgType
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: LogData({
  logId: sighash,
  decode: Fuel.Receipt.getLogDataDecoder(~abi, ~logId=sighash),
}),
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}
}

module TroveManager = {
let abi = Fuel.transpileAbi(%raw(`require("../../abis/trovemanager-abi.json")`))
/*Silence warning of label defined in multiple types*/
@@warning("-30")
type rec type0 = (type19, type19, type19, type19)
 and type1 = string
 @tag("case") and type2 = | NonExistent({payload: type16}) | Active({payload: type16}) | ClosedByOwner({payload: type16}) | ClosedByLiquidation({payload: type16}) | ClosedByRedemption({payload: type16})
 @tag("case") and type3 = | Address({payload: type11}) | ContractId({payload: type13})
 and type5 = bigint
 and type6 = {borrower: type3, usdm_amount: type19, collateral_amount: type19, collateral_price: type19}
 and type7 = {borrower: type3, debt: type19, collateral: type19}
 and type8 = {borrower: type3, remaining_debt: type19, remaining_collateral: type19}
 and type9 = {asset: type19, usdm_debt: type19}
 and type10 = {usdm_lot: type19, asset_lot: type19, cancelled_partial: type17}
 and type11 = {bits: type1}
 and type12 = {bits: type1}
 and type13 = {bits: type1}
 and type14<'t> = {ptr: type5, cap: type19}
 and type15<'t> = array<'t>
 and type16 = unit
 and type17 = bool
 and type18 = string
 and type19 = bigint
@@warning("+30")
let type1Schema = S.string
let type5Schema = BigInt.schema
let type11Schema = S.object((s): type11 => {bits: s.field("bits", type1Schema)})
let type12Schema = S.object((s): type12 => {bits: s.field("bits", type1Schema)})
let type13Schema = S.object((s): type13 => {bits: s.field("bits", type1Schema)})
let type15Schema = (_tSchema: S.t<'t>) => S.array(_tSchema)
let type16Schema = S.literal(%raw(`null`))->S.variant(_ => ())
let type17Schema = S.bool
let type18Schema = S.string
let type19Schema = BigInt.schema
let type0Schema = S.tuple(s => (s.item(0, type19Schema), s.item(1, type19Schema), s.item(2, type19Schema), s.item(3, type19Schema)))
let type2Schema = S.union([S.object((s): type2 =>
{
  s.tag("case", "NonExistent")
  NonExistent({payload: s.field("payload", type16Schema)})
}), S.object((s): type2 =>
{
  s.tag("case", "Active")
  Active({payload: s.field("payload", type16Schema)})
}), S.object((s): type2 =>
{
  s.tag("case", "ClosedByOwner")
  ClosedByOwner({payload: s.field("payload", type16Schema)})
}), S.object((s): type2 =>
{
  s.tag("case", "ClosedByLiquidation")
  ClosedByLiquidation({payload: s.field("payload", type16Schema)})
}), S.object((s): type2 =>
{
  s.tag("case", "ClosedByRedemption")
  ClosedByRedemption({payload: s.field("payload", type16Schema)})
})])
let type3Schema = S.union([S.object((s): type3 =>
{
  s.tag("case", "Address")
  Address({payload: s.field("payload", type11Schema)})
}), S.object((s): type3 =>
{
  s.tag("case", "ContractId")
  ContractId({payload: s.field("payload", type13Schema)})
})])
let type6Schema = S.object((s): type6 => {borrower: s.field("borrower", type3Schema), usdm_amount: s.field("usdm_amount", type19Schema), collateral_amount: s.field("collateral_amount", type19Schema), collateral_price: s.field("collateral_price", type19Schema)})
let type7Schema = S.object((s): type7 => {borrower: s.field("borrower", type3Schema), debt: s.field("debt", type19Schema), collateral: s.field("collateral", type19Schema)})
let type8Schema = S.object((s): type8 => {borrower: s.field("borrower", type3Schema), remaining_debt: s.field("remaining_debt", type19Schema), remaining_collateral: s.field("remaining_collateral", type19Schema)})
let type9Schema = S.object((s): type9 => {asset: s.field("asset", type19Schema), usdm_debt: s.field("usdm_debt", type19Schema)})
let type10Schema = S.object((s): type10 => {usdm_lot: s.field("usdm_lot", type19Schema), asset_lot: s.field("asset_lot", type19Schema), cancelled_partial: s.field("cancelled_partial", type17Schema)})
let type14Schema = (_tSchema: S.t<'t>) => S.object((s): type14<'t> => {ptr: s.field("ptr", type5Schema), cap: s.field("cap", type19Schema)})
let contractName = "TroveManager"

module TrovePartialLiquidationEvent = {

let sighash = "1415805281139303833"
let topicCount = 0
let name = "TrovePartialLiquidationEvent"
let contractName = contractName

@genType
type eventArgs = type8
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = type8Schema->Utils.Schema.coerceToJsonPgType
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: LogData({
  logId: sighash,
  decode: Fuel.Receipt.getLogDataDecoder(~abi, ~logId=sighash),
}),
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}

module TroveFullLiquidationEvent = {

let sighash = "3901993240860012357"
let topicCount = 0
let name = "TroveFullLiquidationEvent"
let contractName = contractName

@genType
type eventArgs = type7
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = type7Schema->Utils.Schema.coerceToJsonPgType
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: LogData({
  logId: sighash,
  decode: Fuel.Receipt.getLogDataDecoder(~abi, ~logId=sighash),
}),
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}

module RedemptionEvent = {

let sighash = "13563887075398870426"
let topicCount = 0
let name = "RedemptionEvent"
let contractName = contractName

@genType
type eventArgs = type6
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = type6Schema->Utils.Schema.coerceToJsonPgType
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: LogData({
  logId: sighash,
  decode: Fuel.Receipt.getLogDataDecoder(~abi, ~logId=sighash),
}),
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}
}

module USDM = {
let abi = Fuel.transpileAbi(%raw(`require("../../abis/usdm-abi.json")`))
/*Silence warning of label defined in multiple types*/
@@warning("-30")
@tag("case") type rec type0 = | Address({payload: type8}) | ContractId({payload: type12})
 @tag("case") and type1<'t> = | None({payload: type14}) | Some({payload: 't})
 and type3 = bigint
 and type4 = {asset: type9, decimals: type18, sender: type0}
 and type5 = {asset: type9, name: type1<type13>, sender: type0}
 and type6 = {asset: type9, symbol: type1<type13>, sender: type0}
 and type7 = {asset: type9, supply: type17, sender: type0}
 and type8 = {bits: type15}
 and type9 = {bits: type15}
 and type10 = unknown
 and type11 = {ptr: type3, cap: type17}
 and type12 = {bits: type15}
 and type13 = string
 and type14 = unit
 and type15 = string
 and type16 = string
 and type17 = bigint
 and type18 = int
@@warning("+30")
let type3Schema = BigInt.schema
let type10Schema = S.unknown
let type13Schema = S.string
let type14Schema = S.literal(%raw(`null`))->S.variant(_ => ())
let type15Schema = S.string
let type16Schema = S.string
let type17Schema = BigInt.schema
let type18Schema = GqlDbCustomTypes.Int.schema
let type1Schema = (_tSchema: S.t<'t>) => S.union([S.object((s): type1<'t> =>
{
  s.tag("case", "None")
  None({payload: s.field("payload", type14Schema)})
}), S.object((s): type1<'t> =>
{
  s.tag("case", "Some")
  Some({payload: s.field("payload", _tSchema)})
})])
let type8Schema = S.object((s): type8 => {bits: s.field("bits", type15Schema)})
let type9Schema = S.object((s): type9 => {bits: s.field("bits", type15Schema)})
let type11Schema = S.object((s): type11 => {ptr: s.field("ptr", type3Schema), cap: s.field("cap", type17Schema)})
let type12Schema = S.object((s): type12 => {bits: s.field("bits", type15Schema)})
let type0Schema = S.union([S.object((s): type0 =>
{
  s.tag("case", "Address")
  Address({payload: s.field("payload", type8Schema)})
}), S.object((s): type0 =>
{
  s.tag("case", "ContractId")
  ContractId({payload: s.field("payload", type12Schema)})
})])
let type4Schema = S.object((s): type4 => {asset: s.field("asset", type9Schema), decimals: s.field("decimals", type18Schema), sender: s.field("sender", type0Schema)})
let type5Schema = S.object((s): type5 => {asset: s.field("asset", type9Schema), name: s.field("name", type1Schema(type13Schema)), sender: s.field("sender", type0Schema)})
let type6Schema = S.object((s): type6 => {asset: s.field("asset", type9Schema), symbol: s.field("symbol", type1Schema(type13Schema)), sender: s.field("sender", type0Schema)})
let type7Schema = S.object((s): type7 => {asset: s.field("asset", type9Schema), supply: s.field("supply", type17Schema), sender: s.field("sender", type0Schema)})
let contractName = "USDM"

module TotalSupplyEvent = {

let sighash = "17462098202904023478"
let topicCount = 0
let name = "TotalSupplyEvent"
let contractName = contractName

@genType
type eventArgs = type7
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = type7Schema->Utils.Schema.coerceToJsonPgType
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: LogData({
  logId: sighash,
  decode: Fuel.Receipt.getLogDataDecoder(~abi, ~logId=sighash),
}),
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}

module Mint = {

let sighash = "mint"
let topicCount = 0
let name = "Mint"
let contractName = contractName

@genType
type eventArgs = Internal.fuelSupplyParams
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = Internal.fuelSupplyParamsSchema
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: Mint,
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}

module Burn = {

let sighash = "burn"
let topicCount = 0
let name = "Burn"
let contractName = contractName

@genType
type eventArgs = Internal.fuelSupplyParams
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = Internal.fuelSupplyParamsSchema
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (Utils.magic: HyperSyncClient.Decoder.decodedEvent => eventArgs)

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {}

let getTopicSelection = _ => [LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe])->Utils.unwrapResultExn]

let register = (): Internal.fuelEventConfig => {
  name,
  kind: Burn,
  isWildcard: (handlerRegister->HandlerTypes.Register.getEventOptions).isWildcard,
  loader: handlerRegister->HandlerTypes.Register.getLoader,
  handler: handlerRegister->HandlerTypes.Register.getHandler,
  contractRegister: handlerRegister->HandlerTypes.Register.getContractRegister,
  paramsRawEventSchema: paramsRawEventSchema->(Utils.magic: S.t<eventArgs> => S.t<Internal.eventParams>),
}
}
}

@genType
type chainId = int
