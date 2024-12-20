/* TypeScript file generated from Types.res by genType. */

/* eslint-disable */
/* tslint:disable */

import type {BorrowOperations_AdjustTroveEvent_indexedFieldOperations as Entities_BorrowOperations_AdjustTroveEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {BorrowOperations_AdjustTroveEvent_t as Entities_BorrowOperations_AdjustTroveEvent_t} from '../src/db/Entities.gen';

import type {BorrowOperations_CloseTroveEvent_indexedFieldOperations as Entities_BorrowOperations_CloseTroveEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {BorrowOperations_CloseTroveEvent_t as Entities_BorrowOperations_CloseTroveEvent_t} from '../src/db/Entities.gen';

import type {BorrowOperations_OpenTroveEvent_indexedFieldOperations as Entities_BorrowOperations_OpenTroveEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {BorrowOperations_OpenTroveEvent_t as Entities_BorrowOperations_OpenTroveEvent_t} from '../src/db/Entities.gen';

import type {FPTStaking_StakeEvent_indexedFieldOperations as Entities_FPTStaking_StakeEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {FPTStaking_StakeEvent_t as Entities_FPTStaking_StakeEvent_t} from '../src/db/Entities.gen';

import type {FPTStaking_UnstakeEvent_indexedFieldOperations as Entities_FPTStaking_UnstakeEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {FPTStaking_UnstakeEvent_t as Entities_FPTStaking_UnstakeEvent_t} from '../src/db/Entities.gen';

import type {HandlerWithOptions as $$fnWithEventConfig} from './bindings/OpaqueTypes.ts';

import type {SingleOrMultiple as $$SingleOrMultiple_t} from './bindings/OpaqueTypes';

import type {StabilityPool_ProvideToStabilityPoolEvent_indexedFieldOperations as Entities_StabilityPool_ProvideToStabilityPoolEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {StabilityPool_ProvideToStabilityPoolEvent_t as Entities_StabilityPool_ProvideToStabilityPoolEvent_t} from '../src/db/Entities.gen';

import type {StabilityPool_StabilityPoolLiquidationEvent_indexedFieldOperations as Entities_StabilityPool_StabilityPoolLiquidationEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {StabilityPool_StabilityPoolLiquidationEvent_t as Entities_StabilityPool_StabilityPoolLiquidationEvent_t} from '../src/db/Entities.gen';

import type {StabilityPool_WithdrawFromStabilityPoolEvent_indexedFieldOperations as Entities_StabilityPool_WithdrawFromStabilityPoolEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {StabilityPool_WithdrawFromStabilityPoolEvent_t as Entities_StabilityPool_WithdrawFromStabilityPoolEvent_t} from '../src/db/Entities.gen';

import type {TroveManager_RedemptionEvent_indexedFieldOperations as Entities_TroveManager_RedemptionEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {TroveManager_RedemptionEvent_t as Entities_TroveManager_RedemptionEvent_t} from '../src/db/Entities.gen';

import type {TroveManager_TroveFullLiquidationEvent_indexedFieldOperations as Entities_TroveManager_TroveFullLiquidationEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {TroveManager_TroveFullLiquidationEvent_t as Entities_TroveManager_TroveFullLiquidationEvent_t} from '../src/db/Entities.gen';

import type {TroveManager_TrovePartialLiquidationEvent_indexedFieldOperations as Entities_TroveManager_TrovePartialLiquidationEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {TroveManager_TrovePartialLiquidationEvent_t as Entities_TroveManager_TrovePartialLiquidationEvent_t} from '../src/db/Entities.gen';

import type {USDF_Burn_indexedFieldOperations as Entities_USDF_Burn_indexedFieldOperations} from '../src/db/Entities.gen';

import type {USDF_Burn_t as Entities_USDF_Burn_t} from '../src/db/Entities.gen';

import type {USDF_Mint_indexedFieldOperations as Entities_USDF_Mint_indexedFieldOperations} from '../src/db/Entities.gen';

import type {USDF_Mint_t as Entities_USDF_Mint_t} from '../src/db/Entities.gen';

import type {USDF_TotalSupplyEvent_indexedFieldOperations as Entities_USDF_TotalSupplyEvent_indexedFieldOperations} from '../src/db/Entities.gen';

import type {USDF_TotalSupplyEvent_t as Entities_USDF_TotalSupplyEvent_t} from '../src/db/Entities.gen';

import type {fuelSupplyParams as Internal_fuelSupplyParams} from 'envio/src/Internal.gen';

import type {genericContractRegisterArgs as Internal_genericContractRegisterArgs} from 'envio/src/Internal.gen';

import type {genericContractRegister as Internal_genericContractRegister} from 'envio/src/Internal.gen';

import type {genericEvent as Internal_genericEvent} from 'envio/src/Internal.gen';

import type {genericHandlerArgs as Internal_genericHandlerArgs} from 'envio/src/Internal.gen';

import type {genericHandlerWithLoader as Internal_genericHandlerWithLoader} from 'envio/src/Internal.gen';

import type {genericHandler as Internal_genericHandler} from 'envio/src/Internal.gen';

import type {genericLoaderArgs as Internal_genericLoaderArgs} from 'envio/src/Internal.gen';

import type {genericLoader as Internal_genericLoader} from 'envio/src/Internal.gen';

import type {t as Address_t} from 'envio/src/Address.gen';

import type {userLogger as Logs_userLogger} from './Logs.gen';

export type id = string;
export type Id = id;

export type contractRegistrations = {
  readonly addBorrowOperations: (_1:Address_t) => void; 
  readonly addFPTStaking: (_1:Address_t) => void; 
  readonly addStabilityPool: (_1:Address_t) => void; 
  readonly addTroveManager: (_1:Address_t) => void; 
  readonly addUSDF: (_1:Address_t) => void
};

export type entityLoaderContext<entity,indexedFieldOperations> = { readonly get: (_1:id) => Promise<(undefined | entity)>; readonly getWhere: indexedFieldOperations };

export type loaderContext = {
  readonly log: Logs_userLogger; 
  readonly BorrowOperations_AdjustTroveEvent: entityLoaderContext<Entities_BorrowOperations_AdjustTroveEvent_t,Entities_BorrowOperations_AdjustTroveEvent_indexedFieldOperations>; 
  readonly BorrowOperations_CloseTroveEvent: entityLoaderContext<Entities_BorrowOperations_CloseTroveEvent_t,Entities_BorrowOperations_CloseTroveEvent_indexedFieldOperations>; 
  readonly BorrowOperations_OpenTroveEvent: entityLoaderContext<Entities_BorrowOperations_OpenTroveEvent_t,Entities_BorrowOperations_OpenTroveEvent_indexedFieldOperations>; 
  readonly FPTStaking_StakeEvent: entityLoaderContext<Entities_FPTStaking_StakeEvent_t,Entities_FPTStaking_StakeEvent_indexedFieldOperations>; 
  readonly FPTStaking_UnstakeEvent: entityLoaderContext<Entities_FPTStaking_UnstakeEvent_t,Entities_FPTStaking_UnstakeEvent_indexedFieldOperations>; 
  readonly StabilityPool_ProvideToStabilityPoolEvent: entityLoaderContext<Entities_StabilityPool_ProvideToStabilityPoolEvent_t,Entities_StabilityPool_ProvideToStabilityPoolEvent_indexedFieldOperations>; 
  readonly StabilityPool_StabilityPoolLiquidationEvent: entityLoaderContext<Entities_StabilityPool_StabilityPoolLiquidationEvent_t,Entities_StabilityPool_StabilityPoolLiquidationEvent_indexedFieldOperations>; 
  readonly StabilityPool_WithdrawFromStabilityPoolEvent: entityLoaderContext<Entities_StabilityPool_WithdrawFromStabilityPoolEvent_t,Entities_StabilityPool_WithdrawFromStabilityPoolEvent_indexedFieldOperations>; 
  readonly TroveManager_RedemptionEvent: entityLoaderContext<Entities_TroveManager_RedemptionEvent_t,Entities_TroveManager_RedemptionEvent_indexedFieldOperations>; 
  readonly TroveManager_TroveFullLiquidationEvent: entityLoaderContext<Entities_TroveManager_TroveFullLiquidationEvent_t,Entities_TroveManager_TroveFullLiquidationEvent_indexedFieldOperations>; 
  readonly TroveManager_TrovePartialLiquidationEvent: entityLoaderContext<Entities_TroveManager_TrovePartialLiquidationEvent_t,Entities_TroveManager_TrovePartialLiquidationEvent_indexedFieldOperations>; 
  readonly USDF_Burn: entityLoaderContext<Entities_USDF_Burn_t,Entities_USDF_Burn_indexedFieldOperations>; 
  readonly USDF_Mint: entityLoaderContext<Entities_USDF_Mint_t,Entities_USDF_Mint_indexedFieldOperations>; 
  readonly USDF_TotalSupplyEvent: entityLoaderContext<Entities_USDF_TotalSupplyEvent_t,Entities_USDF_TotalSupplyEvent_indexedFieldOperations>
};

export type entityHandlerContext<entity> = {
  readonly get: (_1:id) => Promise<(undefined | entity)>; 
  readonly set: (_1:entity) => void; 
  readonly deleteUnsafe: (_1:id) => void
};

export type handlerContext = {
  readonly log: Logs_userLogger; 
  readonly BorrowOperations_AdjustTroveEvent: entityHandlerContext<Entities_BorrowOperations_AdjustTroveEvent_t>; 
  readonly BorrowOperations_CloseTroveEvent: entityHandlerContext<Entities_BorrowOperations_CloseTroveEvent_t>; 
  readonly BorrowOperations_OpenTroveEvent: entityHandlerContext<Entities_BorrowOperations_OpenTroveEvent_t>; 
  readonly FPTStaking_StakeEvent: entityHandlerContext<Entities_FPTStaking_StakeEvent_t>; 
  readonly FPTStaking_UnstakeEvent: entityHandlerContext<Entities_FPTStaking_UnstakeEvent_t>; 
  readonly StabilityPool_ProvideToStabilityPoolEvent: entityHandlerContext<Entities_StabilityPool_ProvideToStabilityPoolEvent_t>; 
  readonly StabilityPool_StabilityPoolLiquidationEvent: entityHandlerContext<Entities_StabilityPool_StabilityPoolLiquidationEvent_t>; 
  readonly StabilityPool_WithdrawFromStabilityPoolEvent: entityHandlerContext<Entities_StabilityPool_WithdrawFromStabilityPoolEvent_t>; 
  readonly TroveManager_RedemptionEvent: entityHandlerContext<Entities_TroveManager_RedemptionEvent_t>; 
  readonly TroveManager_TroveFullLiquidationEvent: entityHandlerContext<Entities_TroveManager_TroveFullLiquidationEvent_t>; 
  readonly TroveManager_TrovePartialLiquidationEvent: entityHandlerContext<Entities_TroveManager_TrovePartialLiquidationEvent_t>; 
  readonly USDF_Burn: entityHandlerContext<Entities_USDF_Burn_t>; 
  readonly USDF_Mint: entityHandlerContext<Entities_USDF_Mint_t>; 
  readonly USDF_TotalSupplyEvent: entityHandlerContext<Entities_USDF_TotalSupplyEvent_t>
};

export type borrowOperations_AdjustTroveEvent = Entities_BorrowOperations_AdjustTroveEvent_t;
export type BorrowOperations_AdjustTroveEvent = borrowOperations_AdjustTroveEvent;

export type borrowOperations_CloseTroveEvent = Entities_BorrowOperations_CloseTroveEvent_t;
export type BorrowOperations_CloseTroveEvent = borrowOperations_CloseTroveEvent;

export type borrowOperations_OpenTroveEvent = Entities_BorrowOperations_OpenTroveEvent_t;
export type BorrowOperations_OpenTroveEvent = borrowOperations_OpenTroveEvent;

export type fPTStaking_StakeEvent = Entities_FPTStaking_StakeEvent_t;
export type FPTStaking_StakeEvent = fPTStaking_StakeEvent;

export type fPTStaking_UnstakeEvent = Entities_FPTStaking_UnstakeEvent_t;
export type FPTStaking_UnstakeEvent = fPTStaking_UnstakeEvent;

export type stabilityPool_ProvideToStabilityPoolEvent = Entities_StabilityPool_ProvideToStabilityPoolEvent_t;
export type StabilityPool_ProvideToStabilityPoolEvent = stabilityPool_ProvideToStabilityPoolEvent;

export type stabilityPool_StabilityPoolLiquidationEvent = Entities_StabilityPool_StabilityPoolLiquidationEvent_t;
export type StabilityPool_StabilityPoolLiquidationEvent = stabilityPool_StabilityPoolLiquidationEvent;

export type stabilityPool_WithdrawFromStabilityPoolEvent = Entities_StabilityPool_WithdrawFromStabilityPoolEvent_t;
export type StabilityPool_WithdrawFromStabilityPoolEvent = stabilityPool_WithdrawFromStabilityPoolEvent;

export type troveManager_RedemptionEvent = Entities_TroveManager_RedemptionEvent_t;
export type TroveManager_RedemptionEvent = troveManager_RedemptionEvent;

export type troveManager_TroveFullLiquidationEvent = Entities_TroveManager_TroveFullLiquidationEvent_t;
export type TroveManager_TroveFullLiquidationEvent = troveManager_TroveFullLiquidationEvent;

export type troveManager_TrovePartialLiquidationEvent = Entities_TroveManager_TrovePartialLiquidationEvent_t;
export type TroveManager_TrovePartialLiquidationEvent = troveManager_TrovePartialLiquidationEvent;

export type uSDF_Burn = Entities_USDF_Burn_t;
export type USDF_Burn = uSDF_Burn;

export type uSDF_Mint = Entities_USDF_Mint_t;
export type USDF_Mint = uSDF_Mint;

export type uSDF_TotalSupplyEvent = Entities_USDF_TotalSupplyEvent_t;
export type USDF_TotalSupplyEvent = uSDF_TotalSupplyEvent;

export type eventIdentifier = {
  readonly chainId: number; 
  readonly blockTimestamp: number; 
  readonly blockNumber: number; 
  readonly logIndex: number
};

export type entityUpdateAction<entityType> = "Delete" | { TAG: "Set"; _0: entityType };

export type entityUpdate<entityType> = {
  readonly eventIdentifier: eventIdentifier; 
  readonly entityId: id; 
  readonly entityUpdateAction: entityUpdateAction<entityType>
};

export type entityValueAtStartOfBatch<entityType> = 
    "NotSet"
  | { TAG: "AlreadySet"; _0: entityType };

export type updatedValue<entityType> = { readonly latest: entityUpdate<entityType>; readonly history: entityUpdate<entityType>[] };

export type inMemoryStoreRowEntity<entityType> = 
    { TAG: "Updated"; _0: updatedValue<entityType> }
  | { TAG: "InitialReadFromDb"; _0: entityValueAtStartOfBatch<entityType> };

export type Transaction_t = { readonly id: string };

export type Block_t = {
  readonly id: string; 
  readonly height: number; 
  readonly time: number
};

export type AggregatedBlock_t = {
  readonly time: number; 
  readonly id: string; 
  readonly height: number
};

export type AggregatedTransaction_t = { readonly id: string };

export type eventLog<params> = Internal_genericEvent<params,Block_t,Transaction_t>;
export type EventLog<params> = eventLog<params>;

export type SingleOrMultiple_t<a> = $$SingleOrMultiple_t<a>;

export type HandlerTypes_args<eventArgs,context> = { readonly event: eventLog<eventArgs>; readonly context: context };

export type HandlerTypes_contractRegisterArgs<eventArgs> = Internal_genericContractRegisterArgs<eventLog<eventArgs>,contractRegistrations>;

export type HandlerTypes_contractRegister<eventArgs> = Internal_genericContractRegister<HandlerTypes_contractRegisterArgs<eventArgs>>;

export type HandlerTypes_loaderArgs<eventArgs> = Internal_genericLoaderArgs<eventLog<eventArgs>,loaderContext>;

export type HandlerTypes_loader<eventArgs,loaderReturn> = Internal_genericLoader<HandlerTypes_loaderArgs<eventArgs>,loaderReturn>;

export type HandlerTypes_handlerArgs<eventArgs,loaderReturn> = Internal_genericHandlerArgs<eventLog<eventArgs>,handlerContext,loaderReturn>;

export type HandlerTypes_handler<eventArgs,loaderReturn> = Internal_genericHandler<HandlerTypes_handlerArgs<eventArgs,loaderReturn>>;

export type HandlerTypes_loaderHandler<eventArgs,loaderReturn,eventFilter> = Internal_genericHandlerWithLoader<HandlerTypes_loader<eventArgs,loaderReturn>,HandlerTypes_handler<eventArgs,loaderReturn>,SingleOrMultiple_t<eventFilter>>;

export type HandlerTypes_eventConfig<eventFilter> = {
  readonly wildcard?: boolean; 
  readonly eventFilters?: SingleOrMultiple_t<eventFilter>; 
  readonly preRegisterDynamicContracts?: boolean
};

export type fnWithEventConfig<fn,eventConfig> = $$fnWithEventConfig<fn,eventConfig>;

export type handlerWithOptions<eventArgs,loaderReturn,eventFilter> = fnWithEventConfig<HandlerTypes_handler<eventArgs,loaderReturn>,HandlerTypes_eventConfig<eventFilter>>;

export type contractRegisterWithOptions<eventArgs,eventFilter> = fnWithEventConfig<HandlerTypes_contractRegister<eventArgs>,HandlerTypes_eventConfig<eventFilter>>;

export type BorrowOperations_type0 = string;

export type BorrowOperations_type2 = 
    { case: "Address"; readonly payload: BorrowOperations_type7 }
  | { case: "ContractId"; readonly payload: BorrowOperations_type9 };

export type BorrowOperations_type4 = {
  readonly user: BorrowOperations_type2; 
  readonly asset_id: BorrowOperations_type8; 
  readonly collateral_change: BorrowOperations_type16; 
  readonly debt_change: BorrowOperations_type16; 
  readonly is_collateral_increase: BorrowOperations_type14; 
  readonly is_debt_increase: BorrowOperations_type14; 
  readonly total_collateral: BorrowOperations_type16; 
  readonly total_debt: BorrowOperations_type16
};

export type BorrowOperations_type5 = {
  readonly user: BorrowOperations_type2; 
  readonly asset_id: BorrowOperations_type8; 
  readonly collateral: BorrowOperations_type16; 
  readonly debt: BorrowOperations_type16
};

export type BorrowOperations_type6 = {
  readonly user: BorrowOperations_type2; 
  readonly asset_id: BorrowOperations_type8; 
  readonly collateral: BorrowOperations_type16; 
  readonly debt: BorrowOperations_type16
};

export type BorrowOperations_type7 = { readonly bits: BorrowOperations_type0 };

export type BorrowOperations_type8 = { readonly bits: BorrowOperations_type0 };

export type BorrowOperations_type9 = { readonly bits: BorrowOperations_type0 };

export type BorrowOperations_type14 = boolean;

export type BorrowOperations_type16 = bigint;

export type BorrowOperations_OpenTroveEvent_eventArgs = BorrowOperations_type6;

export type BorrowOperations_OpenTroveEvent_block = Block_t;

export type BorrowOperations_OpenTroveEvent_transaction = Transaction_t;

export type BorrowOperations_OpenTroveEvent_event = Internal_genericEvent<BorrowOperations_OpenTroveEvent_eventArgs,BorrowOperations_OpenTroveEvent_block,BorrowOperations_OpenTroveEvent_transaction>;

export type BorrowOperations_OpenTroveEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<BorrowOperations_OpenTroveEvent_event,loaderContext>,loaderReturn>;

export type BorrowOperations_OpenTroveEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<BorrowOperations_OpenTroveEvent_event,handlerContext,loaderReturn>>;

export type BorrowOperations_OpenTroveEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<BorrowOperations_OpenTroveEvent_event,contractRegistrations>>;

export type BorrowOperations_OpenTroveEvent_eventFilter = {};

export type BorrowOperations_CloseTroveEvent_eventArgs = BorrowOperations_type5;

export type BorrowOperations_CloseTroveEvent_block = Block_t;

export type BorrowOperations_CloseTroveEvent_transaction = Transaction_t;

export type BorrowOperations_CloseTroveEvent_event = Internal_genericEvent<BorrowOperations_CloseTroveEvent_eventArgs,BorrowOperations_CloseTroveEvent_block,BorrowOperations_CloseTroveEvent_transaction>;

export type BorrowOperations_CloseTroveEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<BorrowOperations_CloseTroveEvent_event,loaderContext>,loaderReturn>;

export type BorrowOperations_CloseTroveEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<BorrowOperations_CloseTroveEvent_event,handlerContext,loaderReturn>>;

export type BorrowOperations_CloseTroveEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<BorrowOperations_CloseTroveEvent_event,contractRegistrations>>;

export type BorrowOperations_CloseTroveEvent_eventFilter = {};

export type BorrowOperations_AdjustTroveEvent_eventArgs = BorrowOperations_type4;

export type BorrowOperations_AdjustTroveEvent_block = Block_t;

export type BorrowOperations_AdjustTroveEvent_transaction = Transaction_t;

export type BorrowOperations_AdjustTroveEvent_event = Internal_genericEvent<BorrowOperations_AdjustTroveEvent_eventArgs,BorrowOperations_AdjustTroveEvent_block,BorrowOperations_AdjustTroveEvent_transaction>;

export type BorrowOperations_AdjustTroveEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<BorrowOperations_AdjustTroveEvent_event,loaderContext>,loaderReturn>;

export type BorrowOperations_AdjustTroveEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<BorrowOperations_AdjustTroveEvent_event,handlerContext,loaderReturn>>;

export type BorrowOperations_AdjustTroveEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<BorrowOperations_AdjustTroveEvent_event,contractRegistrations>>;

export type BorrowOperations_AdjustTroveEvent_eventFilter = {};

export type FPTStaking_type0 = string;

export type FPTStaking_type2 = 
    { case: "Address"; readonly payload: FPTStaking_type6 }
  | { case: "ContractId"; readonly payload: FPTStaking_type8 };

export type FPTStaking_type3 = { readonly user: FPTStaking_type2; readonly amount: FPTStaking_type11 };

export type FPTStaking_type4 = { readonly user: FPTStaking_type2; readonly amount: FPTStaking_type11 };

export type FPTStaking_type6 = { readonly bits: FPTStaking_type0 };

export type FPTStaking_type8 = { readonly bits: FPTStaking_type0 };

export type FPTStaking_type11 = bigint;

export type FPTStaking_StakeEvent_eventArgs = FPTStaking_type3;

export type FPTStaking_StakeEvent_block = Block_t;

export type FPTStaking_StakeEvent_transaction = Transaction_t;

export type FPTStaking_StakeEvent_event = Internal_genericEvent<FPTStaking_StakeEvent_eventArgs,FPTStaking_StakeEvent_block,FPTStaking_StakeEvent_transaction>;

export type FPTStaking_StakeEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<FPTStaking_StakeEvent_event,loaderContext>,loaderReturn>;

export type FPTStaking_StakeEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<FPTStaking_StakeEvent_event,handlerContext,loaderReturn>>;

export type FPTStaking_StakeEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<FPTStaking_StakeEvent_event,contractRegistrations>>;

export type FPTStaking_StakeEvent_eventFilter = {};

export type FPTStaking_UnstakeEvent_eventArgs = FPTStaking_type4;

export type FPTStaking_UnstakeEvent_block = Block_t;

export type FPTStaking_UnstakeEvent_transaction = Transaction_t;

export type FPTStaking_UnstakeEvent_event = Internal_genericEvent<FPTStaking_UnstakeEvent_eventArgs,FPTStaking_UnstakeEvent_block,FPTStaking_UnstakeEvent_transaction>;

export type FPTStaking_UnstakeEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<FPTStaking_UnstakeEvent_event,loaderContext>,loaderReturn>;

export type FPTStaking_UnstakeEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<FPTStaking_UnstakeEvent_event,handlerContext,loaderReturn>>;

export type FPTStaking_UnstakeEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<FPTStaking_UnstakeEvent_event,contractRegistrations>>;

export type FPTStaking_UnstakeEvent_eventFilter = {};

export type StabilityPool_type0 = string;

export type StabilityPool_type1 = 
    { case: "Address"; readonly payload: StabilityPool_type5 }
  | { case: "ContractId"; readonly payload: StabilityPool_type7 };

export type StabilityPool_type2 = {
  readonly user: StabilityPool_type1; 
  readonly amount_to_deposit: StabilityPool_type10; 
  readonly initial_amount: StabilityPool_type10; 
  readonly compounded_amount: StabilityPool_type10
};

export type StabilityPool_type3 = {
  readonly asset_id: StabilityPool_type6; 
  readonly debt_to_offset: StabilityPool_type10; 
  readonly collateral_to_offset: StabilityPool_type10
};

export type StabilityPool_type4 = {
  readonly user: StabilityPool_type1; 
  readonly amount_to_withdraw: StabilityPool_type10; 
  readonly initial_amount: StabilityPool_type10; 
  readonly compounded_amount: StabilityPool_type10
};

export type StabilityPool_type5 = { readonly bits: StabilityPool_type0 };

export type StabilityPool_type6 = { readonly bits: StabilityPool_type0 };

export type StabilityPool_type7 = { readonly bits: StabilityPool_type0 };

export type StabilityPool_type10 = bigint;

export type StabilityPool_StabilityPoolLiquidationEvent_eventArgs = StabilityPool_type3;

export type StabilityPool_StabilityPoolLiquidationEvent_block = Block_t;

export type StabilityPool_StabilityPoolLiquidationEvent_transaction = Transaction_t;

export type StabilityPool_StabilityPoolLiquidationEvent_event = Internal_genericEvent<StabilityPool_StabilityPoolLiquidationEvent_eventArgs,StabilityPool_StabilityPoolLiquidationEvent_block,StabilityPool_StabilityPoolLiquidationEvent_transaction>;

export type StabilityPool_StabilityPoolLiquidationEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<StabilityPool_StabilityPoolLiquidationEvent_event,loaderContext>,loaderReturn>;

export type StabilityPool_StabilityPoolLiquidationEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<StabilityPool_StabilityPoolLiquidationEvent_event,handlerContext,loaderReturn>>;

export type StabilityPool_StabilityPoolLiquidationEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<StabilityPool_StabilityPoolLiquidationEvent_event,contractRegistrations>>;

export type StabilityPool_StabilityPoolLiquidationEvent_eventFilter = {};

export type StabilityPool_ProvideToStabilityPoolEvent_eventArgs = StabilityPool_type2;

export type StabilityPool_ProvideToStabilityPoolEvent_block = Block_t;

export type StabilityPool_ProvideToStabilityPoolEvent_transaction = Transaction_t;

export type StabilityPool_ProvideToStabilityPoolEvent_event = Internal_genericEvent<StabilityPool_ProvideToStabilityPoolEvent_eventArgs,StabilityPool_ProvideToStabilityPoolEvent_block,StabilityPool_ProvideToStabilityPoolEvent_transaction>;

export type StabilityPool_ProvideToStabilityPoolEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<StabilityPool_ProvideToStabilityPoolEvent_event,loaderContext>,loaderReturn>;

export type StabilityPool_ProvideToStabilityPoolEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<StabilityPool_ProvideToStabilityPoolEvent_event,handlerContext,loaderReturn>>;

export type StabilityPool_ProvideToStabilityPoolEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<StabilityPool_ProvideToStabilityPoolEvent_event,contractRegistrations>>;

export type StabilityPool_ProvideToStabilityPoolEvent_eventFilter = {};

export type StabilityPool_WithdrawFromStabilityPoolEvent_eventArgs = StabilityPool_type4;

export type StabilityPool_WithdrawFromStabilityPoolEvent_block = Block_t;

export type StabilityPool_WithdrawFromStabilityPoolEvent_transaction = Transaction_t;

export type StabilityPool_WithdrawFromStabilityPoolEvent_event = Internal_genericEvent<StabilityPool_WithdrawFromStabilityPoolEvent_eventArgs,StabilityPool_WithdrawFromStabilityPoolEvent_block,StabilityPool_WithdrawFromStabilityPoolEvent_transaction>;

export type StabilityPool_WithdrawFromStabilityPoolEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<StabilityPool_WithdrawFromStabilityPoolEvent_event,loaderContext>,loaderReturn>;

export type StabilityPool_WithdrawFromStabilityPoolEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<StabilityPool_WithdrawFromStabilityPoolEvent_event,handlerContext,loaderReturn>>;

export type StabilityPool_WithdrawFromStabilityPoolEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<StabilityPool_WithdrawFromStabilityPoolEvent_event,contractRegistrations>>;

export type StabilityPool_WithdrawFromStabilityPoolEvent_eventFilter = {};

export type TroveManager_type1 = string;

export type TroveManager_type3 = 
    { case: "Address"; readonly payload: TroveManager_type11 }
  | { case: "ContractId"; readonly payload: TroveManager_type13 };

export type TroveManager_type6 = {
  readonly borrower: TroveManager_type3; 
  readonly usdf_amount: TroveManager_type19; 
  readonly collateral_amount: TroveManager_type19; 
  readonly collateral_price: TroveManager_type19
};

export type TroveManager_type7 = {
  readonly borrower: TroveManager_type3; 
  readonly debt: TroveManager_type19; 
  readonly collateral: TroveManager_type19
};

export type TroveManager_type8 = {
  readonly borrower: TroveManager_type3; 
  readonly remaining_debt: TroveManager_type19; 
  readonly remaining_collateral: TroveManager_type19
};

export type TroveManager_type11 = { readonly bits: TroveManager_type1 };

export type TroveManager_type13 = { readonly bits: TroveManager_type1 };

export type TroveManager_type19 = bigint;

export type TroveManager_TrovePartialLiquidationEvent_eventArgs = TroveManager_type8;

export type TroveManager_TrovePartialLiquidationEvent_block = Block_t;

export type TroveManager_TrovePartialLiquidationEvent_transaction = Transaction_t;

export type TroveManager_TrovePartialLiquidationEvent_event = Internal_genericEvent<TroveManager_TrovePartialLiquidationEvent_eventArgs,TroveManager_TrovePartialLiquidationEvent_block,TroveManager_TrovePartialLiquidationEvent_transaction>;

export type TroveManager_TrovePartialLiquidationEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<TroveManager_TrovePartialLiquidationEvent_event,loaderContext>,loaderReturn>;

export type TroveManager_TrovePartialLiquidationEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<TroveManager_TrovePartialLiquidationEvent_event,handlerContext,loaderReturn>>;

export type TroveManager_TrovePartialLiquidationEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<TroveManager_TrovePartialLiquidationEvent_event,contractRegistrations>>;

export type TroveManager_TrovePartialLiquidationEvent_eventFilter = {};

export type TroveManager_TroveFullLiquidationEvent_eventArgs = TroveManager_type7;

export type TroveManager_TroveFullLiquidationEvent_block = Block_t;

export type TroveManager_TroveFullLiquidationEvent_transaction = Transaction_t;

export type TroveManager_TroveFullLiquidationEvent_event = Internal_genericEvent<TroveManager_TroveFullLiquidationEvent_eventArgs,TroveManager_TroveFullLiquidationEvent_block,TroveManager_TroveFullLiquidationEvent_transaction>;

export type TroveManager_TroveFullLiquidationEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<TroveManager_TroveFullLiquidationEvent_event,loaderContext>,loaderReturn>;

export type TroveManager_TroveFullLiquidationEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<TroveManager_TroveFullLiquidationEvent_event,handlerContext,loaderReturn>>;

export type TroveManager_TroveFullLiquidationEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<TroveManager_TroveFullLiquidationEvent_event,contractRegistrations>>;

export type TroveManager_TroveFullLiquidationEvent_eventFilter = {};

export type TroveManager_RedemptionEvent_eventArgs = TroveManager_type6;

export type TroveManager_RedemptionEvent_block = Block_t;

export type TroveManager_RedemptionEvent_transaction = Transaction_t;

export type TroveManager_RedemptionEvent_event = Internal_genericEvent<TroveManager_RedemptionEvent_eventArgs,TroveManager_RedemptionEvent_block,TroveManager_RedemptionEvent_transaction>;

export type TroveManager_RedemptionEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<TroveManager_RedemptionEvent_event,loaderContext>,loaderReturn>;

export type TroveManager_RedemptionEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<TroveManager_RedemptionEvent_event,handlerContext,loaderReturn>>;

export type TroveManager_RedemptionEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<TroveManager_RedemptionEvent_event,contractRegistrations>>;

export type TroveManager_RedemptionEvent_eventFilter = {};

export type USDF_type0 = 
    { case: "Address"; readonly payload: USDF_type8 }
  | { case: "ContractId"; readonly payload: USDF_type12 };

export type USDF_type7 = {
  readonly asset: USDF_type9; 
  readonly supply: USDF_type17; 
  readonly sender: USDF_type0
};

export type USDF_type8 = { readonly bits: USDF_type15 };

export type USDF_type9 = { readonly bits: USDF_type15 };

export type USDF_type12 = { readonly bits: USDF_type15 };

export type USDF_type15 = string;

export type USDF_type17 = bigint;

export type USDF_TotalSupplyEvent_eventArgs = USDF_type7;

export type USDF_TotalSupplyEvent_block = Block_t;

export type USDF_TotalSupplyEvent_transaction = Transaction_t;

export type USDF_TotalSupplyEvent_event = Internal_genericEvent<USDF_TotalSupplyEvent_eventArgs,USDF_TotalSupplyEvent_block,USDF_TotalSupplyEvent_transaction>;

export type USDF_TotalSupplyEvent_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<USDF_TotalSupplyEvent_event,loaderContext>,loaderReturn>;

export type USDF_TotalSupplyEvent_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<USDF_TotalSupplyEvent_event,handlerContext,loaderReturn>>;

export type USDF_TotalSupplyEvent_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<USDF_TotalSupplyEvent_event,contractRegistrations>>;

export type USDF_TotalSupplyEvent_eventFilter = {};

export type USDF_Mint_eventArgs = Internal_fuelSupplyParams;

export type USDF_Mint_block = Block_t;

export type USDF_Mint_transaction = Transaction_t;

export type USDF_Mint_event = Internal_genericEvent<USDF_Mint_eventArgs,USDF_Mint_block,USDF_Mint_transaction>;

export type USDF_Mint_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<USDF_Mint_event,loaderContext>,loaderReturn>;

export type USDF_Mint_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<USDF_Mint_event,handlerContext,loaderReturn>>;

export type USDF_Mint_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<USDF_Mint_event,contractRegistrations>>;

export type USDF_Mint_eventFilter = {};

export type USDF_Burn_eventArgs = Internal_fuelSupplyParams;

export type USDF_Burn_block = Block_t;

export type USDF_Burn_transaction = Transaction_t;

export type USDF_Burn_event = Internal_genericEvent<USDF_Burn_eventArgs,USDF_Burn_block,USDF_Burn_transaction>;

export type USDF_Burn_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<USDF_Burn_event,loaderContext>,loaderReturn>;

export type USDF_Burn_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<USDF_Burn_event,handlerContext,loaderReturn>>;

export type USDF_Burn_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<USDF_Burn_event,contractRegistrations>>;

export type USDF_Burn_eventFilter = {};

export type chainId = number;
