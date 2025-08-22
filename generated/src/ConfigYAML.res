
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
            "0x783c5e5ea9a84350cfced8e217049a9f0ad70b11aaf42fc9ed9fd671bb401f97",
          ],
          events: [
            Types.BorrowOperations.OpenTroveEvent.name,
            Types.BorrowOperations.CloseTroveEvent.name,
            Types.BorrowOperations.AdjustTroveEvent.name,
          ],
        }
      ),
      (
        "StabilityPool",
        {
          name: "StabilityPool",
          abi: Types.StabilityPool.abi,
          addresses: [
            "0xe8b947dc0d738024096c209f87968782ad328ed5e71b71f57d9e4018f9e686c0",
          ],
          events: [
            Types.StabilityPool.StabilityPoolLiquidationEvent.name,
            Types.StabilityPool.ProvideToStabilityPoolEvent.name,
            Types.StabilityPool.WithdrawFromStabilityPoolEvent.name,
          ],
        }
      ),
      (
        "USDM",
        {
          name: "USDM",
          abi: Types.USDM.abi,
          addresses: [
            "0x4d991aecdf1615def5bdb432ab683394787182e5cfad83988b856c8d388e449f",
          ],
          events: [
            Types.USDM.TotalSupplyEvent.name,
            Types.USDM.Mint.name,
            Types.USDM.Burn.name,
          ],
        }
      ),
      (
        "TroveManager",
        {
          name: "TroveManager",
          abi: Types.TroveManager.abi,
          addresses: [
            "0x22a4c76edce873781e94a33627170656a507e1badf906fabdbdfaa3b5165a38c",
            "0xc944cfeb826b3a62b648fe81e397256cc24364367089febcb40a96bb454f8b70",
            "0x4fa56ee8ec817b31818407ba08c1a20c9d70cf0d245ce644d2ede713a50b4d58",
          ],
          events: [
            Types.TroveManager.TrovePartialLiquidationEvent.name,
            Types.TroveManager.TroveFullLiquidationEvent.name,
            Types.TroveManager.RedemptionEvent.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=0)
    (
      chain,
      {
        confirmedBlockThreshold: 0,
        syncSource: 
          HyperFuel({endpointUrl: "https://fuel-testnet.hypersync.xyz"})
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
