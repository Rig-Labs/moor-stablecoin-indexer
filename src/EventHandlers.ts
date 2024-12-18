/*
 * Please refer to https://docs.envio.dev for a thorough guide on all Envio indexer features
 */
import {
  BorrowOperations,
  BorrowOperations_OpenTroveEvent,
  BorrowOperations_CloseTroveEvent,
  BorrowOperations_AdjustTroveEvent,
  FPTStaking,
  FPTStaking_StakeEvent,
  FPTStaking_UnstakeEvent,
  StabilityPool,
  StabilityPool_StabilityPoolLiquidationEvent,
  StabilityPool_ProvideToStabilityPoolEvent,
  StabilityPool_WithdrawFromStabilityPoolEvent,
  TroveManager,
  TroveManager_TrovePartialLiquidationEvent,
  TroveManager_TroveFullLiquidationEvent,
  TroveManager_RedemptionEvent,
  USDF,
  USDF_TotalSupplyEvent,
  USDF_Mint,
  USDF_Burn,
  BorrowOperations_type2 as Identity,
} from "generated";

type IdentityIsContract = [string, boolean];

function identityToStr(identity: Identity): IdentityIsContract {
  switch (identity.case) {
    case "Address":
      return [identity.payload.bits, false];
    case "ContractId":
      return [identity.payload.bits, true];
  }
}

// ETH
// tm: 0x8b90326e5e82ca3b0a2d0fa0ef42023d2df25360e538d5833e94599a1178c64f
// asset: 0xf8f8b6283d7fa5b672b530cbb84fcccb4ff8dc40f8176ef4544ddb1f1952ad07
// WSTETH
// tm: 0x9eea94d170cfb8a1831e7c86e5167acad3e3d1166ddfc81c725377267622ec8e
// asset: 0x1a7815cc9f75db5c24a5b0814bfb706bb9fe485333e98254015de8f48f84c67b
// EZETH
// tm: 0x5e8956e557b1e0bc79d7064222d1e853163ff8edc928be8f5ec32c1abd13df7e
// asset: 0x91b3559edb2619cde8ffb2aa7b3c3be97efd794ea46700db7092abeee62281b0
// WEETH
// tm: 0x4cdbfd7958cffe4562357104271c23228139e5a77933f0d4795f52ca7b715353
// asset: 0x239ed6e12b7ce4089ee245244e3bf906999a6429c2a9a445a1e1faf56914a4ab
// RSETH
// tm: 0xd7fce11644efb7a878e99229e9ee2f6de93ebec23647a0e3fb67cfbf03233264
// asset: 0xbae80f7fb8aa6b90d9b01ef726ec847cc4f59419c4d5f2ea88fec785d1b0e849
// METH
// tm: 0xc20ae74bfb15fb05652d911c156767051aa0c9ee918668cc3db45094106c8388
// asset: 0xafd219f513317b1750783c6581f55530d6cf189a5863fd18bd1b3ffcec1714b4

function assetIdToStr(assetId: string): string {
  switch (assetId) {
    case "0xf8f8b6283d7fa5b672b530cbb84fcccb4ff8dc40f8176ef4544ddb1f1952ad07":
      return "ETH";
    case "0x1a7815cc9f75db5c24a5b0814bfb706bb9fe485333e98254015de8f48f84c67b":
      return "WSTETH";
    case "0x91b3559edb2619cde8ffb2aa7b3c3be97efd794ea46700db7092abeee62281b0":
      return "EZETH";
    case "0x239ed6e12b7ce4089ee245244e3bf906999a6429c2a9a445a1e1faf56914a4ab":
      return "WEETH";
    case "0xbae80f7fb8aa6b90d9b01ef726ec847cc4f59419c4d5f2ea88fec785d1b0e849":
      return "RSETH";
    case "0xafd219f513317b1750783c6581f55530d6cf189a5863fd18bd1b3ffcec1714b4":
      return "METH";
    default:
      return "UNKNOWN";
  }
}

function troveManagerContractIdToStr(troveManagerContractId: string): string {
  switch (troveManagerContractId) {
    case "8b90326e5e82ca3b0a2d0fa0ef42023d2df25360e538d5833e94599a1178c64f":
      return "ETH";
    case "9eea94d170cfb8a1831e7c86e5167acad3e3d1166ddfc81c725377267622ec8e":
      return "WSTETH";
    case "5e8956e557b1e0bc79d7064222d1e853163ff8edc928be8f5ec32c1abd13df7e":
      return "EZETH";
    case "4cdbfd7958cffe4562357104271c23228139e5a77933f0d4795f52ca7b715353":
      return "WEETH";
    case "d7fce11644efb7a878e99229e9ee2f6de93ebec23647a0e3fb67cfbf03233264":
      return "RSETH";
    case "c20ae74bfb15fb05652d911c156767051aa0c9ee918668cc3db45094106c8388":
      return "METH";
    default:
      return "UNKNOWN";
  }
}

// Converts TAI64 timestamp to Unix timestamp
function tai64ToUnix(tai64Timestamp: number): number {
  // TAI64 epoch starts at 1970-01-01 00:00:00 TAI
  // Unix epoch offset is 2^62 (earliest possible TAI64 timestamp)
  const TAI64_EPOCH_OFFSET = 0;

  // Convert to Unix timestamp by subtracting the offset
  // and converting to number (safe since timestamps are within Number.MAX_SAFE_INTEGER)
  return Number(tai64Timestamp - TAI64_EPOCH_OFFSET);
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
  };

  context.BorrowOperations_OpenTroveEvent.set(entity);
});

BorrowOperations.CloseTroveEvent.handler(async ({ event, context }) => {
  console.log(event.params.asset_id.bits);
  const entity: BorrowOperations_CloseTroveEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    identity: identityToStr(event.params.user)[0],
    asset: assetIdToStr(event.params.asset_id.bits),
    collateral: event.params.collateral,
    debt: event.params.debt,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  };

  context.BorrowOperations_CloseTroveEvent.set(entity);
});

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
  };

  context.BorrowOperations_AdjustTroveEvent.set(entity);
});

FPTStaking.StakeEvent.handler(async ({ event, context }) => {
  const entity: FPTStaking_StakeEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    identity: identityToStr(event.params.user)[0],
    amount: event.params.amount,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  };

  context.FPTStaking_StakeEvent.set(entity);
});

FPTStaking.UnstakeEvent.handler(async ({ event, context }) => {
  const entity: FPTStaking_UnstakeEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    identity: identityToStr(event.params.user)[0],
    amount: event.params.amount,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  };

  context.FPTStaking_UnstakeEvent.set(entity);
});

StabilityPool.StabilityPoolLiquidationEvent.handler(
  async ({ event, context }) => {
    const entity: StabilityPool_StabilityPoolLiquidationEvent = {
      id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
      asset: assetIdToStr(event.params.asset_id.bits),
      collateral_to_offset: event.params.collateral_to_offset,
      debt_to_offset: event.params.debt_to_offset,
      timestamp: tai64ToUnix(event.block.time),
      txHash: event.transaction.id,
    };

    context.StabilityPool_StabilityPoolLiquidationEvent.set(entity);
  }
);

StabilityPool.ProvideToStabilityPoolEvent.handler(
  async ({ event, context }) => {
    const entity: StabilityPool_ProvideToStabilityPoolEvent = {
      id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
      identity: identityToStr(event.params.user)[0],
      amount: event.params.amount_to_deposit,
      compounded_amount: event.params.compounded_amount,
      timestamp: tai64ToUnix(event.block.time),
      txHash: event.transaction.id,
    };

    context.StabilityPool_ProvideToStabilityPoolEvent.set(entity);
  }
);

StabilityPool.WithdrawFromStabilityPoolEvent.handler(
  async ({ event, context }) => {
    const entity: StabilityPool_WithdrawFromStabilityPoolEvent = {
      id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
      identity: identityToStr(event.params.user)[0],
      amount: event.params.amount_to_withdraw,
      compounded_amount: event.params.compounded_amount,
      timestamp: tai64ToUnix(event.block.time),
      txHash: event.transaction.id,
    };

    context.StabilityPool_WithdrawFromStabilityPoolEvent.set(entity);
  }
);

TroveManager.TrovePartialLiquidationEvent.handler(
  async ({ event, context }) => {
    const entity: TroveManager_TrovePartialLiquidationEvent = {
      id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
      asset: event.srcAddress,
      identity: identityToStr(event.params.borrower)[0],
      remaining_collateral: event.params.remaining_collateral,
      remaining_debt: event.params.remaining_debt,
      timestamp: tai64ToUnix(event.block.time),
      txHash: event.transaction.id,
    };

    context.TroveManager_TrovePartialLiquidationEvent.set(entity);
  }
);

TroveManager.TroveFullLiquidationEvent.handler(async ({ event, context }) => {
  const entity: TroveManager_TroveFullLiquidationEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    asset: event.srcAddress,
    identity: identityToStr(event.params.borrower)[0],
    collateral: event.params.collateral,
    debt: event.params.debt,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  };

  context.TroveManager_TroveFullLiquidationEvent.set(entity);
});

TroveManager.RedemptionEvent.handler(async ({ event, context }) => {
  const entity: TroveManager_RedemptionEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    identity: identityToStr(event.params.borrower)[0],
    asset: event.srcAddress,
    collateral_amount: event.params.collateral_amount,
    collateral_price: event.params.collateral_price,
    usdf_amount: event.params.usdf_amount,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  };

  context.TroveManager_RedemptionEvent.set(entity);
});

USDF.TotalSupplyEvent.handler(async ({ event, context }) => {
  const entity: USDF_TotalSupplyEvent = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    amount: event.params.supply,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  };

  context.USDF_TotalSupplyEvent.set(entity);
});

USDF.Mint.handler(async ({ event, context }) => {
  const entity: USDF_Mint = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    amount: event.params.amount,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  };

  context.USDF_Mint.set(entity);
});

USDF.Burn.handler(async ({ event, context }) => {
  const entity: USDF_Burn = {
    id: `${event.chainId}_${event.block.height}_${event.logIndex}`,
    amount: event.params.amount,
    timestamp: tai64ToUnix(event.block.time),
    txHash: event.transaction.id,
  };

  context.USDF_Burn.set(entity);
});
