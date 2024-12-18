  @genType
module BorrowOperations = {
  module OpenTroveEvent = Types.MakeRegister(Types.BorrowOperations.OpenTroveEvent)
  module CloseTroveEvent = Types.MakeRegister(Types.BorrowOperations.CloseTroveEvent)
  module AdjustTroveEvent = Types.MakeRegister(Types.BorrowOperations.AdjustTroveEvent)
}

  @genType
module FPTStaking = {
  module StakeEvent = Types.MakeRegister(Types.FPTStaking.StakeEvent)
  module UnstakeEvent = Types.MakeRegister(Types.FPTStaking.UnstakeEvent)
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
module USDF = {
  module TotalSupplyEvent = Types.MakeRegister(Types.USDF.TotalSupplyEvent)
  module Mint = Types.MakeRegister(Types.USDF.Mint)
  module Burn = Types.MakeRegister(Types.USDF.Burn)
}

