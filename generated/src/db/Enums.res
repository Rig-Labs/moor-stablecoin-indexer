module ContractType = {
  @genType
  type t = 
    | @as("BorrowOperations") BorrowOperations
    | @as("StabilityPool") StabilityPool
    | @as("TroveManager") TroveManager
    | @as("USDM") USDM

  let name = "CONTRACT_TYPE"
  let variants = [
    BorrowOperations,
    StabilityPool,
    TroveManager,
    USDM,
  ]
  let enum = Enum.make(~name, ~variants)
}

module EntityType = {
  @genType
  type t = 
    | @as("BorrowOperations_AdjustTroveEvent") BorrowOperations_AdjustTroveEvent
    | @as("BorrowOperations_CloseTroveEvent") BorrowOperations_CloseTroveEvent
    | @as("BorrowOperations_OpenTroveEvent") BorrowOperations_OpenTroveEvent
    | @as("StabilityPool_ProvideToStabilityPoolEvent") StabilityPool_ProvideToStabilityPoolEvent
    | @as("StabilityPool_StabilityPoolLiquidationEvent") StabilityPool_StabilityPoolLiquidationEvent
    | @as("StabilityPool_WithdrawFromStabilityPoolEvent") StabilityPool_WithdrawFromStabilityPoolEvent
    | @as("TroveManager_RedemptionEvent") TroveManager_RedemptionEvent
    | @as("TroveManager_TroveFullLiquidationEvent") TroveManager_TroveFullLiquidationEvent
    | @as("TroveManager_TrovePartialLiquidationEvent") TroveManager_TrovePartialLiquidationEvent
    | @as("USDM_Burn") USDM_Burn
    | @as("USDM_Mint") USDM_Mint
    | @as("USDM_TotalSupplyEvent") USDM_TotalSupplyEvent
    | @as("dynamic_contract_registry") DynamicContractRegistry

  let name = "ENTITY_TYPE"
  let variants = [
    BorrowOperations_AdjustTroveEvent,
    BorrowOperations_CloseTroveEvent,
    BorrowOperations_OpenTroveEvent,
    StabilityPool_ProvideToStabilityPoolEvent,
    StabilityPool_StabilityPoolLiquidationEvent,
    StabilityPool_WithdrawFromStabilityPoolEvent,
    TroveManager_RedemptionEvent,
    TroveManager_TroveFullLiquidationEvent,
    TroveManager_TrovePartialLiquidationEvent,
    USDM_Burn,
    USDM_Mint,
    USDM_TotalSupplyEvent,
    DynamicContractRegistry,
  ]

  let enum = Enum.make(~name, ~variants)
}

let allEnums: array<module(Enum.S)> = [
  module(EntityHistory.RowAction),
  module(ContractType), 
  module(EntityType),
]
