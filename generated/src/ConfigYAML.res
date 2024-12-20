
type hyperSyncConfig = {endpointUrl: string}
type hyperFuelConfig = {endpointUrl: string}

@genType.opaque
type rpcConfig = {
  syncConfig: Config.syncConfig,
}

@genType
type syncSource = HyperSync(hyperSyncConfig) | HyperFuel(hyperFuelConfig) | Rpc(rpcConfig)

@genType.opaque
type aliasAbi = Ethers.abi

type eventName = string

type contract = {
  name: string,
  abi: aliasAbi,
  addresses: array<string>,
  events: array<eventName>,
}

type configYaml = {
  syncSource,
  startBlock: int,
  confirmedBlockThreshold: int,
  contracts: dict<contract>,
}

let publicConfig = ChainMap.fromArrayUnsafe([
  {
    let contracts = Js.Dict.fromArray([
      (
        "BorrowOperations",
        {
          name: "BorrowOperations",
          abi: Types.BorrowOperations.abi,
          addresses: [
            "0xeda02ae9cbe68183ee86a0b5e7a475215fbafc307e5e6506f970fa6dcc15d62e",
          ],
          events: [
            Types.BorrowOperations.OpenTroveEvent.name,
            Types.BorrowOperations.CloseTroveEvent.name,
            Types.BorrowOperations.AdjustTroveEvent.name,
          ],
        }
      ),
      (
        "FPTStaking",
        {
          name: "FPTStaking",
          abi: Types.FPTStaking.abi,
          addresses: [
            "0xb86e9d843da16084fbfc06400f4d86ca2432f2487bf5ac6b776cab5449b1307f",
          ],
          events: [
            Types.FPTStaking.StakeEvent.name,
            Types.FPTStaking.UnstakeEvent.name,
          ],
        }
      ),
      (
        "StabilityPool",
        {
          name: "StabilityPool",
          abi: Types.StabilityPool.abi,
          addresses: [
            "0x90ae00be8f594c23ea87941a70574cd954fe1e1713470123b5111d6b04c37aef",
          ],
          events: [
            Types.StabilityPool.StabilityPoolLiquidationEvent.name,
            Types.StabilityPool.ProvideToStabilityPoolEvent.name,
            Types.StabilityPool.WithdrawFromStabilityPoolEvent.name,
          ],
        }
      ),
      (
        "USDF",
        {
          name: "USDF",
          abi: Types.USDF.abi,
          addresses: [
            "0x32deed96558e9572abce544aaf256724aee60517eeb1fabe76e86e4790c888b0",
          ],
          events: [
            Types.USDF.TotalSupplyEvent.name,
            Types.USDF.Mint.name,
            Types.USDF.Burn.name,
          ],
        }
      ),
      (
        "TroveManager",
        {
          name: "TroveManager",
          abi: Types.TroveManager.abi,
          addresses: [
            "0x8b90326e5e82ca3b0a2d0fa0ef42023d2df25360e538d5833e94599a1178c64f",
            "0x9eea94d170cfb8a1831e7c86e5167acad3e3d1166ddfc81c725377267622ec8e",
            "0x5e8956e557b1e0bc79d7064222d1e853163ff8edc928be8f5ec32c1abd13df7e",
            "0x4cdbfd7958cffe4562357104271c23228139e5a77933f0d4795f52ca7b715353",
            "0xd7fce11644efb7a878e99229e9ee2f6de93ebec23647a0e3fb67cfbf03233264",
            "0xc20ae74bfb15fb05652d911c156767051aa0c9ee918668cc3db45094106c8388",
            "0xde9d3793b761ec829edb5a3c48200f30dc4877e67e28f7194c8b457bbb41a1ef",
          ],
          events: [
            Types.TroveManager.TrovePartialLiquidationEvent.name,
            Types.TroveManager.TroveFullLiquidationEvent.name,
            Types.TroveManager.RedemptionEvent.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=9889)
    (
      chain,
      {
        confirmedBlockThreshold: 0,
        syncSource: 
          HyperFuel({endpointUrl: "https://fuel.hypersync.xyz"})
          ,
        startBlock: 0,
        contracts
      }
    )
  },
])

@genType
let getGeneratedByChainId: int => configYaml = chainId => {
  let chain = ChainMap.Chain.makeUnsafe(~chainId)
  if !(publicConfig->ChainMap.has(chain)) {
    Js.Exn.raiseError(
      "No chain with id " ++ chain->ChainMap.Chain.toString ++ " found in config.yaml",
    )
  }
  publicConfig->ChainMap.get(chain)
}
