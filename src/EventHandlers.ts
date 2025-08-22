/*
 * Please refer to https://docs.envio.dev for a thorough guide on all Envio indexer features
 */
import {
  BorrowOperations,
  BorrowOperations_OpenTroveEvent,
  BorrowOperations_CloseTroveEvent,
  BorrowOperations_AdjustTroveEvent,
  StabilityPool,
  StabilityPool_StabilityPoolLiquidationEvent,
  StabilityPool_ProvideToStabilityPoolEvent,
  StabilityPool_WithdrawFromStabilityPoolEvent,
  TroveManager,
  TroveManager_TrovePartialLiquidationEvent,
  TroveManager_TroveFullLiquidationEvent,
  TroveManager_RedemptionEvent,
  USDM,
  BorrowOperations_type2 as Identity,
  USDM_Mint,
  USDM_TotalSupplyEvent,
  USDM_Burn,
} from 'generated'

type IdentityIsContract = [string, boolean]

function identityToStr(identity: Identity): IdentityIsContract {
  switch (identity.case) {
    case 'Address':
      return [identity.payload.bits, false]
    case 'ContractId':
      return [identity.payload.bits, true]
  }
}

// TESTNET
// -------
// ETH
// tm: 0x4fa56ee8ec817b31818407ba08c1a20c9d70cf0d245ce644d2ede713a50b4d58
// asset: 0x03d707fef3a33c0b643cb8bef53d239e2561e307dac841f8ba7f0ac62d4fd8d1
// FUEL
// tm: 0xc944cfeb826b3a62b648fe81e397256cc24364367089febcb40a96bb454f8b70
// asset: 0xa5041f8b3e1ae962cb0b3fff8a882a17fe135db7d0b7b94c964049c69ba2ed42
// STFUEL
// tm: 0x22a4c76edce873781e94a33627170656a507e1badf906fabdbdfaa3b5165a38c
// asset: 0x978cae387eb0de30314aabbd109f6a7a2b0ead20d8d2157ca1956a131b05ca46

function assetIdToStr(assetId: string): string {
  switch (assetId) {
    case '0x03d707fef3a33c0b643cb8bef53d239e2561e307dac841f8ba7f0ac62d4fd8d1':
      return 'ETH'
    case '0xa5041f8b3e1ae962cb0b3fff8a882a17fe135db7d0b7b94c964049c69ba2ed42':
      return 'FUEL'
    case '0x978cae387eb0de30314aabbd109f6a7a2b0ead20d8d2157ca1956a131b05ca46':
      return 'STFUEL'
    default:
      return 'UNKNOWN'
  }
}

function troveManagerContractIdToStr(troveManagerContractId: string): string {
  switch (troveManagerContractId) {
    case '0x4fa56ee8ec817b31818407ba08c1a20c9d70cf0d245ce644d2ede713a50b4d58':
      return 'ETH'
    case '0xc944cfeb826b3a62b648fe81e397256cc24364367089febcb40a96bb454f8b70':
      return 'FUEL'
    case '0x22a4c76edce873781e94a33627170656a507e1badf906fabdbdfaa3b5165a38c':
      return 'STFUEL'
    default:
      return 'UNKNOWN'
  }
}

// Converts TAI64 timestamp to Unix timestamp
function tai64ToUnix(tai64Timestamp: number): number {
  // TAI64 epoch starts at 1970-01-01 00:00:00 TAI
  // Unix epoch offset is 2^62 (earliest possible TAI64 timestamp)
  const TAI64_EPOCH_OFFSET = 0

  // Convert to Unix timestamp by subtracting the offset
  // and converting to number (safe since timestamps are within Number.MAX_SAFE_INTEGER)
  return Number(tai64Timestamp - TAI64_EPOCH_OFFSET)
}

BorrowOperations.OpenTroveEvent.handler(async ({ event, context }) => {
  const entity: BorrowOperations_OpenTroveEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    identity: identityToStr(event.params.user)[0],
    asset: assetIdToStr(event.params.asset_id.bits),
    collateral: event.params.collateral,
    debt: event.params.debt,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  }

  context.BorrowOperations_OpenTroveEvent.set(entity)
})

BorrowOperations.CloseTroveEvent.handler(async ({ event, context }) => {
  const entity: BorrowOperations_CloseTroveEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    identity: identityToStr(event.params.user)[0],
    asset: assetIdToStr(event.params.asset_id.bits),
    collateral: event.params.collateral,
    debt: event.params.debt,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  }

  context.BorrowOperations_CloseTroveEvent.set(entity)
})

BorrowOperations.AdjustTroveEvent.handler(async ({ event, context }) => {
  const entity: BorrowOperations_AdjustTroveEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    identity: identityToStr(event.params.user)[0],
    asset: assetIdToStr(event.params.asset_id.bits),
    collateral: event.params.total_collateral,
    debt: event.params.total_debt,
    collateralChange: event.params.collateral_change,
    debtChange: event.params.debt_change,
    isCollateralIncrease: event.params.is_collateral_increase,
    isDebtIncrease: event.params.is_debt_increase,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  }

  context.BorrowOperations_AdjustTroveEvent.set(entity)
})

StabilityPool.StabilityPoolLiquidationEvent.handler(
  async ({ event, context }) => {
    const entity: StabilityPool_StabilityPoolLiquidationEvent = {
      id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
      asset: assetIdToStr(event.params.asset_id.bits),
      collateral_to_offset: event.params.collateral_to_offset,
      debt_to_offset: event.params.debt_to_offset,
      timestamp: tai64ToUnix(event.block.time),
      txHash: event.transaction.id,
    }

    context.StabilityPool_StabilityPoolLiquidationEvent.set(entity)
  }
)

StabilityPool.ProvideToStabilityPoolEvent.handler(
  async ({ event, context }) => {
    const entity: StabilityPool_ProvideToStabilityPoolEvent = {
      id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
      identity: identityToStr(event.params.user)[0],
      amount: event.params.amount_to_deposit,
      compounded_amount: event.params.compounded_amount,
      timestamp: tai64ToUnix(event.block.time),
      txHash: event.transaction.id,
    }

    context.StabilityPool_ProvideToStabilityPoolEvent.set(entity)
  }
)

StabilityPool.WithdrawFromStabilityPoolEvent.handler(
  async ({ event, context }) => {
    const entity: StabilityPool_WithdrawFromStabilityPoolEvent = {
      id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
      identity: identityToStr(event.params.user)[0],
      amount: event.params.amount_to_withdraw,
      compounded_amount: event.params.compounded_amount,
      timestamp: tai64ToUnix(event.block.time),
      txHash: event.transaction.id,
    }

    context.StabilityPool_WithdrawFromStabilityPoolEvent.set(entity)
  }
)

TroveManager.TrovePartialLiquidationEvent.handler(
  async ({ event, context }) => {
    const entity: TroveManager_TrovePartialLiquidationEvent = {
      id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
      asset: troveManagerContractIdToStr(event.srcAddress),
      identity: identityToStr(event.params.borrower)[0],
      remaining_collateral: event.params.remaining_collateral,
      remaining_debt: event.params.remaining_debt,
      timestamp: tai64ToUnix(event.block.time),
      txHash: event.transaction.id,
    }

    context.TroveManager_TrovePartialLiquidationEvent.set(entity)
  }
)

TroveManager.TroveFullLiquidationEvent.handler(async ({ event, context }) => {
  const entity: TroveManager_TroveFullLiquidationEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    asset: troveManagerContractIdToStr(event.srcAddress),
    identity: identityToStr(event.params.borrower)[0],
    collateral: event.params.collateral,
    debt: event.params.debt,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  }

  context.TroveManager_TroveFullLiquidationEvent.set(entity)
})

TroveManager.RedemptionEvent.handler(async ({ event, context }) => {
  const entity: TroveManager_RedemptionEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    identity: identityToStr(event.params.borrower)[0],
    asset: troveManagerContractIdToStr(event.srcAddress),
    collateral_amount: event.params.collateral_amount,
    collateral_price: event.params.collateral_price,
    usdm_amount: event.params.usdm_amount,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  }

  context.TroveManager_RedemptionEvent.set(entity)
})

USDM.TotalSupplyEvent.handler(async ({ event, context }) => {
  const entity: USDM_TotalSupplyEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    amount: event.params.supply,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  }

  context.USDM_TotalSupplyEvent.set(entity)
})

USDM.Mint.handler(async ({ event, context }) => {
  const entity: USDM_Mint = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    amount: event.params.amount,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  }

  context.USDM_Mint.set(entity)
})

USDM.Burn.handler(async ({ event, context }) => {
  const entity: USDM_Burn = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    amount: event.params.amount,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  }

  context.USDM_Burn.set(entity)
})
