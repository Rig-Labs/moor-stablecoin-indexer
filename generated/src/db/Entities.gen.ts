/* TypeScript file generated from Entities.res by genType. */

/* eslint-disable */
/* tslint:disable */

export type id = string;

export type whereOperations<entity,fieldType> = { readonly eq: (_1:fieldType) => Promise<entity[]> };

export type BorrowOperations_AdjustTroveEvent_t = {
  readonly asset: string; 
  readonly collateral: bigint; 
  readonly collateralChange: bigint; 
  readonly debt: bigint; 
  readonly debtChange: bigint; 
  readonly id: id; 
  readonly identity: string; 
  readonly isCollateralIncrease: boolean; 
  readonly isDebtIncrease: boolean; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type BorrowOperations_AdjustTroveEvent_indexedFieldOperations = { readonly asset: whereOperations<BorrowOperations_AdjustTroveEvent_t,string>; readonly identity: whereOperations<BorrowOperations_AdjustTroveEvent_t,string> };

export type BorrowOperations_CloseTroveEvent_t = {
  readonly asset: string; 
  readonly collateral: bigint; 
  readonly debt: bigint; 
  readonly id: id; 
  readonly identity: string; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type BorrowOperations_CloseTroveEvent_indexedFieldOperations = { readonly asset: whereOperations<BorrowOperations_CloseTroveEvent_t,string>; readonly identity: whereOperations<BorrowOperations_CloseTroveEvent_t,string> };

export type BorrowOperations_OpenTroveEvent_t = {
  readonly asset: string; 
  readonly collateral: bigint; 
  readonly debt: bigint; 
  readonly id: id; 
  readonly identity: string; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type BorrowOperations_OpenTroveEvent_indexedFieldOperations = { readonly asset: whereOperations<BorrowOperations_OpenTroveEvent_t,string>; readonly identity: whereOperations<BorrowOperations_OpenTroveEvent_t,string> };

export type FPTStaking_StakeEvent_t = {
  readonly amount: bigint; 
  readonly id: id; 
  readonly identity: string; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type FPTStaking_StakeEvent_indexedFieldOperations = { readonly identity: whereOperations<FPTStaking_StakeEvent_t,string> };

export type FPTStaking_UnstakeEvent_t = {
  readonly amount: bigint; 
  readonly id: id; 
  readonly identity: string; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type FPTStaking_UnstakeEvent_indexedFieldOperations = { readonly identity: whereOperations<FPTStaking_UnstakeEvent_t,string> };

export type StabilityPool_ProvideToStabilityPoolEvent_t = {
  readonly amount: bigint; 
  readonly compounded_amount: bigint; 
  readonly id: id; 
  readonly identity: string; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type StabilityPool_ProvideToStabilityPoolEvent_indexedFieldOperations = { readonly identity: whereOperations<StabilityPool_ProvideToStabilityPoolEvent_t,string> };

export type StabilityPool_StabilityPoolLiquidationEvent_t = {
  readonly asset: string; 
  readonly collateral_to_offset: bigint; 
  readonly debt_to_offset: bigint; 
  readonly id: id; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type StabilityPool_StabilityPoolLiquidationEvent_indexedFieldOperations = { readonly asset: whereOperations<StabilityPool_StabilityPoolLiquidationEvent_t,string> };

export type StabilityPool_WithdrawFromStabilityPoolEvent_t = {
  readonly amount: bigint; 
  readonly compounded_amount: bigint; 
  readonly id: id; 
  readonly identity: string; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type StabilityPool_WithdrawFromStabilityPoolEvent_indexedFieldOperations = { readonly identity: whereOperations<StabilityPool_WithdrawFromStabilityPoolEvent_t,string> };

export type TroveManager_RedemptionEvent_t = {
  readonly asset: string; 
  readonly collateral_amount: bigint; 
  readonly collateral_price: bigint; 
  readonly id: id; 
  readonly identity: string; 
  readonly timestamp: number; 
  readonly txHash: string; 
  readonly usdf_amount: bigint
};

export type TroveManager_RedemptionEvent_indexedFieldOperations = { readonly asset: whereOperations<TroveManager_RedemptionEvent_t,string>; readonly identity: whereOperations<TroveManager_RedemptionEvent_t,string> };

export type TroveManager_TroveFullLiquidationEvent_t = {
  readonly asset: string; 
  readonly collateral: bigint; 
  readonly debt: bigint; 
  readonly id: id; 
  readonly identity: string; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type TroveManager_TroveFullLiquidationEvent_indexedFieldOperations = { readonly asset: whereOperations<TroveManager_TroveFullLiquidationEvent_t,string>; readonly identity: whereOperations<TroveManager_TroveFullLiquidationEvent_t,string> };

export type TroveManager_TrovePartialLiquidationEvent_t = {
  readonly asset: string; 
  readonly id: id; 
  readonly identity: string; 
  readonly remaining_collateral: bigint; 
  readonly remaining_debt: bigint; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type TroveManager_TrovePartialLiquidationEvent_indexedFieldOperations = { readonly asset: whereOperations<TroveManager_TrovePartialLiquidationEvent_t,string>; readonly identity: whereOperations<TroveManager_TrovePartialLiquidationEvent_t,string> };

export type USDF_Burn_t = {
  readonly amount: bigint; 
  readonly id: id; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type USDF_Burn_indexedFieldOperations = {};

export type USDF_Mint_t = {
  readonly amount: bigint; 
  readonly id: id; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type USDF_Mint_indexedFieldOperations = {};

export type USDF_TotalSupplyEvent_t = {
  readonly amount: bigint; 
  readonly id: id; 
  readonly timestamp: number; 
  readonly txHash: string
};

export type USDF_TotalSupplyEvent_indexedFieldOperations = {};
