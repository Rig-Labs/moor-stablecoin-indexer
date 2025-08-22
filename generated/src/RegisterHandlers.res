@val external require: string => unit = "require"

let registerContractHandlers = (
  ~contractName,
  ~handlerPathRelativeToRoot,
  ~handlerPathRelativeToConfig,
) => {
  try {
    require("root/" ++ handlerPathRelativeToRoot)
  } catch {
  | exn =>
    let params = {
      "Contract Name": contractName,
      "Expected Handler Path": handlerPathRelativeToConfig,
      "Code": "EE500",
    }
    let logger = Logging.createChild(~params)

    let errHandler = exn->ErrorHandling.make(~msg="Failed to import handler file", ~logger)
    errHandler->ErrorHandling.log
    errHandler->ErrorHandling.raiseExn
  }
}

%%private(
  let makeGeneratedConfig = () => {
    let chains = [
      {
        let contracts = [
          {
            Config.name: "BorrowOperations",
            abi: Types.BorrowOperations.abi,
            addresses: [
              "0x783c5e5ea9a84350cfced8e217049a9f0ad70b11aaf42fc9ed9fd671bb401f97"->Address.unsafeFromString
              ,
            ],
            events: [
              module(Types.BorrowOperations.OpenTroveEvent),
              module(Types.BorrowOperations.CloseTroveEvent),
              module(Types.BorrowOperations.AdjustTroveEvent),
            ],
            sighashes: [
              Types.BorrowOperations.OpenTroveEvent.sighash,
              Types.BorrowOperations.CloseTroveEvent.sighash,
              Types.BorrowOperations.AdjustTroveEvent.sighash,
            ],
          },
          {
            Config.name: "StabilityPool",
            abi: Types.StabilityPool.abi,
            addresses: [
              "0xe8b947dc0d738024096c209f87968782ad328ed5e71b71f57d9e4018f9e686c0"->Address.unsafeFromString
              ,
            ],
            events: [
              module(Types.StabilityPool.StabilityPoolLiquidationEvent),
              module(Types.StabilityPool.ProvideToStabilityPoolEvent),
              module(Types.StabilityPool.WithdrawFromStabilityPoolEvent),
            ],
            sighashes: [
              Types.StabilityPool.StabilityPoolLiquidationEvent.sighash,
              Types.StabilityPool.ProvideToStabilityPoolEvent.sighash,
              Types.StabilityPool.WithdrawFromStabilityPoolEvent.sighash,
            ],
          },
          {
            Config.name: "USDM",
            abi: Types.USDM.abi,
            addresses: [
              "0x4d991aecdf1615def5bdb432ab683394787182e5cfad83988b856c8d388e449f"->Address.unsafeFromString
              ,
            ],
            events: [
              module(Types.USDM.TotalSupplyEvent),
              module(Types.USDM.Mint),
              module(Types.USDM.Burn),
            ],
            sighashes: [
              Types.USDM.TotalSupplyEvent.sighash,
              Types.USDM.Mint.sighash,
              Types.USDM.Burn.sighash,
            ],
          },
          {
            Config.name: "TroveManager",
            abi: Types.TroveManager.abi,
            addresses: [
              "0x22a4c76edce873781e94a33627170656a507e1badf906fabdbdfaa3b5165a38c"->Address.unsafeFromString
              ,
              "0xc944cfeb826b3a62b648fe81e397256cc24364367089febcb40a96bb454f8b70"->Address.unsafeFromString
              ,
              "0x4fa56ee8ec817b31818407ba08c1a20c9d70cf0d245ce644d2ede713a50b4d58"->Address.unsafeFromString
              ,
            ],
            events: [
              module(Types.TroveManager.TrovePartialLiquidationEvent),
              module(Types.TroveManager.TroveFullLiquidationEvent),
              module(Types.TroveManager.RedemptionEvent),
            ],
            sighashes: [
              Types.TroveManager.TrovePartialLiquidationEvent.sighash,
              Types.TroveManager.TroveFullLiquidationEvent.sighash,
              Types.TroveManager.RedemptionEvent.sighash,
            ],
          },
        ]
        let chain = ChainMap.Chain.makeUnsafe(~chainId=0)
        {
          Config.confirmedBlockThreshold: 0,
          syncSource: 
            HyperFuel
            ,
          startBlock: 0,
          endBlock:  None ,
          chain,
          contracts,
          chainWorker:
            module(HyperFuelWorker.Make({
              let chain = chain
              let endpointUrl = "https://fuel-testnet.hypersync.xyz"
              let contracts: array<Internal.fuelContractConfig> = [
                {
                  name: "BorrowOperations",
                  events: [
                    Types.BorrowOperations.OpenTroveEvent.register(),
                    Types.BorrowOperations.CloseTroveEvent.register(),
                    Types.BorrowOperations.AdjustTroveEvent.register(),
                  ]
                },
                {
                  name: "StabilityPool",
                  events: [
                    Types.StabilityPool.StabilityPoolLiquidationEvent.register(),
                    Types.StabilityPool.ProvideToStabilityPoolEvent.register(),
                    Types.StabilityPool.WithdrawFromStabilityPoolEvent.register(),
                  ]
                },
                {
                  name: "USDM",
                  events: [
                    Types.USDM.TotalSupplyEvent.register(),
                    Types.USDM.Mint.register(),
                    Types.USDM.Burn.register(),
                  ]
                },
                {
                  name: "TroveManager",
                  events: [
                    Types.TroveManager.TrovePartialLiquidationEvent.register(),
                    Types.TroveManager.TroveFullLiquidationEvent.register(),
                    Types.TroveManager.RedemptionEvent.register(),
                  ]
                },
              ]
            }))
        }
      },
    ]

    Config.make(
      ~shouldRollbackOnReorg=false,
      ~shouldSaveFullHistory=false,
      ~isUnorderedMultichainMode=false,
      ~chains,
      ~enableRawEvents=false,
      ~entities=[
        module(Entities.BorrowOperations_AdjustTroveEvent),
        module(Entities.BorrowOperations_CloseTroveEvent),
        module(Entities.BorrowOperations_OpenTroveEvent),
        module(Entities.StabilityPool_ProvideToStabilityPoolEvent),
        module(Entities.StabilityPool_StabilityPoolLiquidationEvent),
        module(Entities.StabilityPool_WithdrawFromStabilityPoolEvent),
        module(Entities.TroveManager_RedemptionEvent),
        module(Entities.TroveManager_TroveFullLiquidationEvent),
        module(Entities.TroveManager_TrovePartialLiquidationEvent),
        module(Entities.USDM_Burn),
        module(Entities.USDM_Mint),
        module(Entities.USDM_TotalSupplyEvent),
      ],
    )
  }

  let config: ref<option<Config.t>> = ref(None)
)

let registerAllHandlers = () => {
  registerContractHandlers(
    ~contractName="BorrowOperations",
    ~handlerPathRelativeToRoot="src/EventHandlers.ts",
    ~handlerPathRelativeToConfig="src/EventHandlers.ts",
  )
  registerContractHandlers(
    ~contractName="StabilityPool",
    ~handlerPathRelativeToRoot="src/EventHandlers.ts",
    ~handlerPathRelativeToConfig="src/EventHandlers.ts",
  )
  registerContractHandlers(
    ~contractName="TroveManager",
    ~handlerPathRelativeToRoot="src/EventHandlers.ts",
    ~handlerPathRelativeToConfig="src/EventHandlers.ts",
  )
  registerContractHandlers(
    ~contractName="USDM",
    ~handlerPathRelativeToRoot="src/EventHandlers.ts",
    ~handlerPathRelativeToConfig="src/EventHandlers.ts",
  )

  let generatedConfig = makeGeneratedConfig()
  config := Some(generatedConfig)
  generatedConfig
}

let getConfig = () => {
  switch config.contents {
  | Some(config) => config
  | None => registerAllHandlers()
  }
}
