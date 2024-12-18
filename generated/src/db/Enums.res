module ContractType = {
  @genType
  type t = 
    | @as("BorrowOperations") BorrowOperations
    | @as("FPTStaking") FPTStaking
    | @as("StabilityPool") StabilityPool
    | @as("TroveManager") TroveManager
    | @as("USDF") USDF

  let name = "CONTRACT_TYPE"
  let variants = [
    BorrowOperations,
    FPTStaking,
    StabilityPool,
    TroveManager,
    USDF,
  ]
  let enum = Enum.make(~name, ~variants)
}

module EntityType = {
  @genType
  type t = 
    | @as("BorrowOperations_AdjustTroveEvent") BorrowOperations_AdjustTroveEvent
    | @as("BorrowOperations_CloseTroveEvent") BorrowOperations_CloseTroveEvent
    | @as("BorrowOperations_OpenTroveEvent") BorrowOperations_OpenTroveEvent
    | @as("FPTStaking_StakeEvent") FPTStaking_StakeEvent
    | @as("FPTStaking_UnstakeEvent") FPTStaking_UnstakeEvent
    | @as("StabilityPool_ProvideToStabilityPoolEvent") StabilityPool_ProvideToStabilityPoolEvent
    | @as("StabilityPool_StabilityPoolLiquidationEvent") StabilityPool_StabilityPoolLiquidationEvent
    | @as("StabilityPool_WithdrawFromStabilityPoolEvent") StabilityPool_WithdrawFromStabilityPoolEvent
    | @as("TroveManager_RedemptionEvent") TroveManager_RedemptionEvent
    | @as("TroveManager_TroveFullLiquidationEvent") TroveManager_TroveFullLiquidationEvent
    | @as("TroveManager_TrovePartialLiquidationEvent") TroveManager_TrovePartialLiquidationEvent
    | @as("USDF_Burn") USDF_Burn
    | @as("USDF_Mint") USDF_Mint
    | @as("USDF_TotalSupplyEvent") USDF_TotalSupplyEvent
    | @as("dynamic_contract_registry") DynamicContractRegistry

  let name = "ENTITY_TYPE"
  let variants = [
    BorrowOperations_AdjustTroveEvent,
    BorrowOperations_CloseTroveEvent,
    BorrowOperations_OpenTroveEvent,
    FPTStaking_StakeEvent,
    FPTStaking_UnstakeEvent,
    StabilityPool_ProvideToStabilityPoolEvent,
    StabilityPool_StabilityPoolLiquidationEvent,
    StabilityPool_WithdrawFromStabilityPoolEvent,
    TroveManager_RedemptionEvent,
    TroveManager_TroveFullLiquidationEvent,
    TroveManager_TrovePartialLiquidationEvent,
    USDF_Burn,
    USDF_Mint,
    USDF_TotalSupplyEvent,
    DynamicContractRegistry,
  ]

  let enum = Enum.make(~name, ~variants)
}

let allEnums: array<module(Enum.S)> = [
  module(EntityHistory.RowAction),
  module(ContractType), 
  module(EntityType),
]
