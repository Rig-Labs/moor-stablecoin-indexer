/* TypeScript file generated from TestHelpers_MockDb.res by genType. */

/* eslint-disable */
/* tslint:disable */

const TestHelpers_MockDbJS = require('./TestHelpers_MockDb.bs.js');

import type {BorrowOperations_AdjustTroveEvent_t as Entities_BorrowOperations_AdjustTroveEvent_t} from '../src/db/Entities.gen';

import type {BorrowOperations_CloseTroveEvent_t as Entities_BorrowOperations_CloseTroveEvent_t} from '../src/db/Entities.gen';

import type {BorrowOperations_OpenTroveEvent_t as Entities_BorrowOperations_OpenTroveEvent_t} from '../src/db/Entities.gen';

import type {DynamicContractRegistry_t as TablesStatic_DynamicContractRegistry_t} from '../src/db/TablesStatic.gen';

import type {EventSyncState_t as TablesStatic_EventSyncState_t} from '../src/db/TablesStatic.gen';

import type {RawEvents_t as TablesStatic_RawEvents_t} from '../src/db/TablesStatic.gen';

import type {StabilityPool_ProvideToStabilityPoolEvent_t as Entities_StabilityPool_ProvideToStabilityPoolEvent_t} from '../src/db/Entities.gen';

import type {StabilityPool_StabilityPoolLiquidationEvent_t as Entities_StabilityPool_StabilityPoolLiquidationEvent_t} from '../src/db/Entities.gen';

import type {StabilityPool_WithdrawFromStabilityPoolEvent_t as Entities_StabilityPool_WithdrawFromStabilityPoolEvent_t} from '../src/db/Entities.gen';

import type {TroveManager_RedemptionEvent_t as Entities_TroveManager_RedemptionEvent_t} from '../src/db/Entities.gen';

import type {TroveManager_TroveFullLiquidationEvent_t as Entities_TroveManager_TroveFullLiquidationEvent_t} from '../src/db/Entities.gen';

import type {TroveManager_TrovePartialLiquidationEvent_t as Entities_TroveManager_TrovePartialLiquidationEvent_t} from '../src/db/Entities.gen';

import type {USDM_Burn_t as Entities_USDM_Burn_t} from '../src/db/Entities.gen';

import type {USDM_Mint_t as Entities_USDM_Mint_t} from '../src/db/Entities.gen';

import type {USDM_TotalSupplyEvent_t as Entities_USDM_TotalSupplyEvent_t} from '../src/db/Entities.gen';

import type {chainId as Types_chainId} from './Types.gen';

import type {rawEventsKey as InMemoryStore_rawEventsKey} from './InMemoryStore.gen';

/** The mockDb type is simply an InMemoryStore internally. __dbInternal__ holds a reference
to an inMemoryStore and all the the accessor methods point to the reference of that inMemory
store */
export abstract class inMemoryStore { protected opaque!: any }; /* simulate opaque types */

export type t = {
  readonly __dbInternal__: inMemoryStore; 
  readonly entities: entities; 
  readonly rawEvents: storeOperations<InMemoryStore_rawEventsKey,TablesStatic_RawEvents_t>; 
  readonly eventSyncState: storeOperations<Types_chainId,TablesStatic_EventSyncState_t>; 
  readonly dynamicContractRegistry: entityStoreOperations<TablesStatic_DynamicContractRegistry_t>
};

export type entities = {
  readonly BorrowOperations_AdjustTroveEvent: entityStoreOperations<Entities_BorrowOperations_AdjustTroveEvent_t>; 
  readonly BorrowOperations_CloseTroveEvent: entityStoreOperations<Entities_BorrowOperations_CloseTroveEvent_t>; 
  readonly BorrowOperations_OpenTroveEvent: entityStoreOperations<Entities_BorrowOperations_OpenTroveEvent_t>; 
  readonly StabilityPool_ProvideToStabilityPoolEvent: entityStoreOperations<Entities_StabilityPool_ProvideToStabilityPoolEvent_t>; 
  readonly StabilityPool_StabilityPoolLiquidationEvent: entityStoreOperations<Entities_StabilityPool_StabilityPoolLiquidationEvent_t>; 
  readonly StabilityPool_WithdrawFromStabilityPoolEvent: entityStoreOperations<Entities_StabilityPool_WithdrawFromStabilityPoolEvent_t>; 
  readonly TroveManager_RedemptionEvent: entityStoreOperations<Entities_TroveManager_RedemptionEvent_t>; 
  readonly TroveManager_TroveFullLiquidationEvent: entityStoreOperations<Entities_TroveManager_TroveFullLiquidationEvent_t>; 
  readonly TroveManager_TrovePartialLiquidationEvent: entityStoreOperations<Entities_TroveManager_TrovePartialLiquidationEvent_t>; 
  readonly USDM_Burn: entityStoreOperations<Entities_USDM_Burn_t>; 
  readonly USDM_Mint: entityStoreOperations<Entities_USDM_Mint_t>; 
  readonly USDM_TotalSupplyEvent: entityStoreOperations<Entities_USDM_TotalSupplyEvent_t>
};

export type entityStoreOperations<entity> = storeOperations<string,entity>;

export type storeOperations<entityKey,entity> = {
  readonly getAll: () => entity[]; 
  readonly get: (_1:entityKey) => (undefined | entity); 
  readonly set: (_1:entity) => t; 
  readonly delete: (_1:entityKey) => t
};

/** The constructor function for a mockDb. Call it and then set up the inital state by calling
any of the set functions it provides access to. A mockDb will be passed into a processEvent 
helper. Note, process event helpers will not mutate the mockDb but return a new mockDb with
new state so you can compare states before and after. */
export const createMockDb: () => t = TestHelpers_MockDbJS.createMockDb as any;
