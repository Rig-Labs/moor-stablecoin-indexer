/* TypeScript file generated from TestHelpers.res by genType. */

/* eslint-disable */
/* tslint:disable */

const TestHelpersJS = require('./TestHelpers.bs.js');

import type {BorrowOperations_AdjustTroveEvent_eventArgs as Types_BorrowOperations_AdjustTroveEvent_eventArgs} from './Types.gen';

import type {BorrowOperations_AdjustTroveEvent_event as Types_BorrowOperations_AdjustTroveEvent_event} from './Types.gen';

import type {BorrowOperations_CloseTroveEvent_eventArgs as Types_BorrowOperations_CloseTroveEvent_eventArgs} from './Types.gen';

import type {BorrowOperations_CloseTroveEvent_event as Types_BorrowOperations_CloseTroveEvent_event} from './Types.gen';

import type {BorrowOperations_OpenTroveEvent_eventArgs as Types_BorrowOperations_OpenTroveEvent_eventArgs} from './Types.gen';

import type {BorrowOperations_OpenTroveEvent_event as Types_BorrowOperations_OpenTroveEvent_event} from './Types.gen';

import type {FPTStaking_StakeEvent_eventArgs as Types_FPTStaking_StakeEvent_eventArgs} from './Types.gen';

import type {FPTStaking_StakeEvent_event as Types_FPTStaking_StakeEvent_event} from './Types.gen';

import type {FPTStaking_UnstakeEvent_eventArgs as Types_FPTStaking_UnstakeEvent_eventArgs} from './Types.gen';

import type {FPTStaking_UnstakeEvent_event as Types_FPTStaking_UnstakeEvent_event} from './Types.gen';

import type {StabilityPool_ProvideToStabilityPoolEvent_eventArgs as Types_StabilityPool_ProvideToStabilityPoolEvent_eventArgs} from './Types.gen';

import type {StabilityPool_ProvideToStabilityPoolEvent_event as Types_StabilityPool_ProvideToStabilityPoolEvent_event} from './Types.gen';

import type {StabilityPool_StabilityPoolLiquidationEvent_eventArgs as Types_StabilityPool_StabilityPoolLiquidationEvent_eventArgs} from './Types.gen';

import type {StabilityPool_StabilityPoolLiquidationEvent_event as Types_StabilityPool_StabilityPoolLiquidationEvent_event} from './Types.gen';

import type {StabilityPool_WithdrawFromStabilityPoolEvent_eventArgs as Types_StabilityPool_WithdrawFromStabilityPoolEvent_eventArgs} from './Types.gen';

import type {StabilityPool_WithdrawFromStabilityPoolEvent_event as Types_StabilityPool_WithdrawFromStabilityPoolEvent_event} from './Types.gen';

import type {TroveManager_RedemptionEvent_eventArgs as Types_TroveManager_RedemptionEvent_eventArgs} from './Types.gen';

import type {TroveManager_RedemptionEvent_event as Types_TroveManager_RedemptionEvent_event} from './Types.gen';

import type {TroveManager_TroveFullLiquidationEvent_eventArgs as Types_TroveManager_TroveFullLiquidationEvent_eventArgs} from './Types.gen';

import type {TroveManager_TroveFullLiquidationEvent_event as Types_TroveManager_TroveFullLiquidationEvent_event} from './Types.gen';

import type {TroveManager_TrovePartialLiquidationEvent_eventArgs as Types_TroveManager_TrovePartialLiquidationEvent_eventArgs} from './Types.gen';

import type {TroveManager_TrovePartialLiquidationEvent_event as Types_TroveManager_TrovePartialLiquidationEvent_event} from './Types.gen';

import type {USDF_Burn_eventArgs as Types_USDF_Burn_eventArgs} from './Types.gen';

import type {USDF_Burn_event as Types_USDF_Burn_event} from './Types.gen';

import type {USDF_Mint_eventArgs as Types_USDF_Mint_eventArgs} from './Types.gen';

import type {USDF_Mint_event as Types_USDF_Mint_event} from './Types.gen';

import type {USDF_TotalSupplyEvent_eventArgs as Types_USDF_TotalSupplyEvent_eventArgs} from './Types.gen';

import type {USDF_TotalSupplyEvent_event as Types_USDF_TotalSupplyEvent_event} from './Types.gen';

import type {t as Address_t} from 'envio/src/Address.gen';

import type {t as TestHelpers_MockDb_t} from './TestHelpers_MockDb.gen';

/** The arguements that get passed to a "processEvent" helper function */
export type EventFunctions_eventProcessorArgs<event> = {
  readonly event: event; 
  readonly mockDb: TestHelpers_MockDb_t; 
  readonly chainId?: number
};

export type EventFunctions_eventProcessor<event> = (_1:EventFunctions_eventProcessorArgs<event>) => Promise<TestHelpers_MockDb_t>;

export type EventFunctions_MockBlock_t = {
  readonly time?: number; 
  readonly id?: string; 
  readonly height?: number
};

export type EventFunctions_MockTransaction_t = { readonly id?: string };

export type EventFunctions_mockEventData = {
  readonly chainId?: number; 
  readonly srcAddress?: Address_t; 
  readonly logIndex?: number; 
  readonly block?: EventFunctions_MockBlock_t; 
  readonly transaction?: EventFunctions_MockTransaction_t
};

export const MockDb_createMockDb: () => TestHelpers_MockDb_t = TestHelpersJS.MockDb.createMockDb as any;

export const Addresses_mockAddresses: Address_t[] = TestHelpersJS.Addresses.mockAddresses as any;

export const Addresses_defaultAddress: Address_t = TestHelpersJS.Addresses.defaultAddress as any;

export const BorrowOperations_OpenTroveEvent_processEvent: EventFunctions_eventProcessor<Types_BorrowOperations_OpenTroveEvent_event> = TestHelpersJS.BorrowOperations.OpenTroveEvent.processEvent as any;

export const BorrowOperations_OpenTroveEvent_mockData: (params:Types_BorrowOperations_OpenTroveEvent_eventArgs) => Types_BorrowOperations_OpenTroveEvent_event = TestHelpersJS.BorrowOperations.OpenTroveEvent.mockData as any;

export const BorrowOperations_CloseTroveEvent_processEvent: EventFunctions_eventProcessor<Types_BorrowOperations_CloseTroveEvent_event> = TestHelpersJS.BorrowOperations.CloseTroveEvent.processEvent as any;

export const BorrowOperations_CloseTroveEvent_mockData: (params:Types_BorrowOperations_CloseTroveEvent_eventArgs) => Types_BorrowOperations_CloseTroveEvent_event = TestHelpersJS.BorrowOperations.CloseTroveEvent.mockData as any;

export const BorrowOperations_AdjustTroveEvent_processEvent: EventFunctions_eventProcessor<Types_BorrowOperations_AdjustTroveEvent_event> = TestHelpersJS.BorrowOperations.AdjustTroveEvent.processEvent as any;

export const BorrowOperations_AdjustTroveEvent_mockData: (params:Types_BorrowOperations_AdjustTroveEvent_eventArgs) => Types_BorrowOperations_AdjustTroveEvent_event = TestHelpersJS.BorrowOperations.AdjustTroveEvent.mockData as any;

export const FPTStaking_StakeEvent_processEvent: EventFunctions_eventProcessor<Types_FPTStaking_StakeEvent_event> = TestHelpersJS.FPTStaking.StakeEvent.processEvent as any;

export const FPTStaking_StakeEvent_mockData: (params:Types_FPTStaking_StakeEvent_eventArgs) => Types_FPTStaking_StakeEvent_event = TestHelpersJS.FPTStaking.StakeEvent.mockData as any;

export const FPTStaking_UnstakeEvent_processEvent: EventFunctions_eventProcessor<Types_FPTStaking_UnstakeEvent_event> = TestHelpersJS.FPTStaking.UnstakeEvent.processEvent as any;

export const FPTStaking_UnstakeEvent_mockData: (params:Types_FPTStaking_UnstakeEvent_eventArgs) => Types_FPTStaking_UnstakeEvent_event = TestHelpersJS.FPTStaking.UnstakeEvent.mockData as any;

export const StabilityPool_StabilityPoolLiquidationEvent_processEvent: EventFunctions_eventProcessor<Types_StabilityPool_StabilityPoolLiquidationEvent_event> = TestHelpersJS.StabilityPool.StabilityPoolLiquidationEvent.processEvent as any;

export const StabilityPool_StabilityPoolLiquidationEvent_mockData: (params:Types_StabilityPool_StabilityPoolLiquidationEvent_eventArgs) => Types_StabilityPool_StabilityPoolLiquidationEvent_event = TestHelpersJS.StabilityPool.StabilityPoolLiquidationEvent.mockData as any;

export const StabilityPool_ProvideToStabilityPoolEvent_processEvent: EventFunctions_eventProcessor<Types_StabilityPool_ProvideToStabilityPoolEvent_event> = TestHelpersJS.StabilityPool.ProvideToStabilityPoolEvent.processEvent as any;

export const StabilityPool_ProvideToStabilityPoolEvent_mockData: (params:Types_StabilityPool_ProvideToStabilityPoolEvent_eventArgs) => Types_StabilityPool_ProvideToStabilityPoolEvent_event = TestHelpersJS.StabilityPool.ProvideToStabilityPoolEvent.mockData as any;

export const StabilityPool_WithdrawFromStabilityPoolEvent_processEvent: EventFunctions_eventProcessor<Types_StabilityPool_WithdrawFromStabilityPoolEvent_event> = TestHelpersJS.StabilityPool.WithdrawFromStabilityPoolEvent.processEvent as any;

export const StabilityPool_WithdrawFromStabilityPoolEvent_mockData: (params:Types_StabilityPool_WithdrawFromStabilityPoolEvent_eventArgs) => Types_StabilityPool_WithdrawFromStabilityPoolEvent_event = TestHelpersJS.StabilityPool.WithdrawFromStabilityPoolEvent.mockData as any;

export const TroveManager_TrovePartialLiquidationEvent_processEvent: EventFunctions_eventProcessor<Types_TroveManager_TrovePartialLiquidationEvent_event> = TestHelpersJS.TroveManager.TrovePartialLiquidationEvent.processEvent as any;

export const TroveManager_TrovePartialLiquidationEvent_mockData: (params:Types_TroveManager_TrovePartialLiquidationEvent_eventArgs) => Types_TroveManager_TrovePartialLiquidationEvent_event = TestHelpersJS.TroveManager.TrovePartialLiquidationEvent.mockData as any;

export const TroveManager_TroveFullLiquidationEvent_processEvent: EventFunctions_eventProcessor<Types_TroveManager_TroveFullLiquidationEvent_event> = TestHelpersJS.TroveManager.TroveFullLiquidationEvent.processEvent as any;

export const TroveManager_TroveFullLiquidationEvent_mockData: (params:Types_TroveManager_TroveFullLiquidationEvent_eventArgs) => Types_TroveManager_TroveFullLiquidationEvent_event = TestHelpersJS.TroveManager.TroveFullLiquidationEvent.mockData as any;

export const TroveManager_RedemptionEvent_processEvent: EventFunctions_eventProcessor<Types_TroveManager_RedemptionEvent_event> = TestHelpersJS.TroveManager.RedemptionEvent.processEvent as any;

export const TroveManager_RedemptionEvent_mockData: (params:Types_TroveManager_RedemptionEvent_eventArgs) => Types_TroveManager_RedemptionEvent_event = TestHelpersJS.TroveManager.RedemptionEvent.mockData as any;

export const USDF_TotalSupplyEvent_processEvent: EventFunctions_eventProcessor<Types_USDF_TotalSupplyEvent_event> = TestHelpersJS.USDF.TotalSupplyEvent.processEvent as any;

export const USDF_TotalSupplyEvent_mockData: (params:Types_USDF_TotalSupplyEvent_eventArgs) => Types_USDF_TotalSupplyEvent_event = TestHelpersJS.USDF.TotalSupplyEvent.mockData as any;

export const USDF_Mint_processEvent: EventFunctions_eventProcessor<Types_USDF_Mint_event> = TestHelpersJS.USDF.Mint.processEvent as any;

export const USDF_Mint_mockData: (params:Types_USDF_Mint_eventArgs) => Types_USDF_Mint_event = TestHelpersJS.USDF.Mint.mockData as any;

export const USDF_Burn_processEvent: EventFunctions_eventProcessor<Types_USDF_Burn_event> = TestHelpersJS.USDF.Burn.processEvent as any;

export const USDF_Burn_mockData: (params:Types_USDF_Burn_eventArgs) => Types_USDF_Burn_event = TestHelpersJS.USDF.Burn.mockData as any;

export const Addresses: { mockAddresses: Address_t[]; defaultAddress: Address_t } = TestHelpersJS.Addresses as any;

export const USDF: {
  TotalSupplyEvent: {
    mockData: (params:Types_USDF_TotalSupplyEvent_eventArgs) => Types_USDF_TotalSupplyEvent_event; 
    processEvent: EventFunctions_eventProcessor<Types_USDF_TotalSupplyEvent_event>
  }; 
  Mint: {
    mockData: (params:Types_USDF_Mint_eventArgs) => Types_USDF_Mint_event; 
    processEvent: EventFunctions_eventProcessor<Types_USDF_Mint_event>
  }; 
  Burn: {
    mockData: (params:Types_USDF_Burn_eventArgs) => Types_USDF_Burn_event; 
    processEvent: EventFunctions_eventProcessor<Types_USDF_Burn_event>
  }
} = TestHelpersJS.USDF as any;

export const TroveManager: {
  TroveFullLiquidationEvent: {
    mockData: (params:Types_TroveManager_TroveFullLiquidationEvent_eventArgs) => Types_TroveManager_TroveFullLiquidationEvent_event; 
    processEvent: EventFunctions_eventProcessor<Types_TroveManager_TroveFullLiquidationEvent_event>
  }; 
  RedemptionEvent: {
    mockData: (params:Types_TroveManager_RedemptionEvent_eventArgs) => Types_TroveManager_RedemptionEvent_event; 
    processEvent: EventFunctions_eventProcessor<Types_TroveManager_RedemptionEvent_event>
  }; 
  TrovePartialLiquidationEvent: {
    mockData: (params:Types_TroveManager_TrovePartialLiquidationEvent_eventArgs) => Types_TroveManager_TrovePartialLiquidationEvent_event; 
    processEvent: EventFunctions_eventProcessor<Types_TroveManager_TrovePartialLiquidationEvent_event>
  }
} = TestHelpersJS.TroveManager as any;

export const BorrowOperations: {
  OpenTroveEvent: {
    mockData: (params:Types_BorrowOperations_OpenTroveEvent_eventArgs) => Types_BorrowOperations_OpenTroveEvent_event; 
    processEvent: EventFunctions_eventProcessor<Types_BorrowOperations_OpenTroveEvent_event>
  }; 
  CloseTroveEvent: {
    mockData: (params:Types_BorrowOperations_CloseTroveEvent_eventArgs) => Types_BorrowOperations_CloseTroveEvent_event; 
    processEvent: EventFunctions_eventProcessor<Types_BorrowOperations_CloseTroveEvent_event>
  }; 
  AdjustTroveEvent: {
    mockData: (params:Types_BorrowOperations_AdjustTroveEvent_eventArgs) => Types_BorrowOperations_AdjustTroveEvent_event; 
    processEvent: EventFunctions_eventProcessor<Types_BorrowOperations_AdjustTroveEvent_event>
  }
} = TestHelpersJS.BorrowOperations as any;

export const StabilityPool: {
  ProvideToStabilityPoolEvent: {
    mockData: (params:Types_StabilityPool_ProvideToStabilityPoolEvent_eventArgs) => Types_StabilityPool_ProvideToStabilityPoolEvent_event; 
    processEvent: EventFunctions_eventProcessor<Types_StabilityPool_ProvideToStabilityPoolEvent_event>
  }; 
  WithdrawFromStabilityPoolEvent: {
    mockData: (params:Types_StabilityPool_WithdrawFromStabilityPoolEvent_eventArgs) => Types_StabilityPool_WithdrawFromStabilityPoolEvent_event; 
    processEvent: EventFunctions_eventProcessor<Types_StabilityPool_WithdrawFromStabilityPoolEvent_event>
  }; 
  StabilityPoolLiquidationEvent: {
    mockData: (params:Types_StabilityPool_StabilityPoolLiquidationEvent_eventArgs) => Types_StabilityPool_StabilityPoolLiquidationEvent_event; 
    processEvent: EventFunctions_eventProcessor<Types_StabilityPool_StabilityPoolLiquidationEvent_event>
  }
} = TestHelpersJS.StabilityPool as any;

export const FPTStaking: { UnstakeEvent: { mockData: (params:Types_FPTStaking_UnstakeEvent_eventArgs) => Types_FPTStaking_UnstakeEvent_event; processEvent: EventFunctions_eventProcessor<Types_FPTStaking_UnstakeEvent_event> }; StakeEvent: { mockData: (params:Types_FPTStaking_StakeEvent_eventArgs) => Types_FPTStaking_StakeEvent_event; processEvent: EventFunctions_eventProcessor<Types_FPTStaking_StakeEvent_event> } } = TestHelpersJS.FPTStaking as any;

export const MockDb: { createMockDb: () => TestHelpers_MockDb_t } = TestHelpersJS.MockDb as any;
