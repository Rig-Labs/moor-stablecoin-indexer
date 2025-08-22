  @genType
module BorrowOperations = {
  module OpenTroveEvent = Types.MakeRegister(Types.BorrowOperations.OpenTroveEvent)
  module CloseTroveEvent = Types.MakeRegister(Types.BorrowOperations.CloseTroveEvent)
  module AdjustTroveEvent = Types.MakeRegister(Types.BorrowOperations.AdjustTroveEvent)
}

  @genType
module StabilityPool = {
  module StabilityPoolLiquidationEvent = Types.MakeRegister(Types.StabilityPool.StabilityPoolLiquidationEvent)
  module ProvideToStabilityPoolEvent = Types.MakeRegister(Types.StabilityPool.ProvideToStabilityPoolEvent)
  module WithdrawFromStabilityPoolEvent = Types.MakeRegister(Types.StabilityPool.WithdrawFromStabilityPoolEvent)
}

  @genType
module TroveManager = {
  module TrovePartialLiquidationEvent = Types.MakeRegister(Types.TroveManager.TrovePartialLiquidationEvent)
  module TroveFullLiquidationEvent = Types.MakeRegister(Types.TroveManager.TroveFullLiquidationEvent)
  module RedemptionEvent = Types.MakeRegister(Types.TroveManager.RedemptionEvent)
}

  @genType
module USDM = {
  module TotalSupplyEvent = Types.MakeRegister(Types.USDM.TotalSupplyEvent)
  module Mint = Types.MakeRegister(Types.USDM.Mint)
  module Burn = Types.MakeRegister(Types.USDM.Burn)
}

