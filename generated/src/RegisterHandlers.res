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
              "0xeda02ae9cbe68183ee86a0b5e7a475215fbafc307e5e6506f970fa6dcc15d62e"->Address.unsafeFromString
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
            Config.name: "FPTStaking",
            abi: Types.FPTStaking.abi,
            addresses: [
              "0xb86e9d843da16084fbfc06400f4d86ca2432f2487bf5ac6b776cab5449b1307f"->Address.unsafeFromString
              ,
            ],
            events: [
              module(Types.FPTStaking.StakeEvent),
              module(Types.FPTStaking.UnstakeEvent),
            ],
            sighashes: [
              Types.FPTStaking.StakeEvent.sighash,
              Types.FPTStaking.UnstakeEvent.sighash,
            ],
          },
          {
            Config.name: "StabilityPool",
            abi: Types.StabilityPool.abi,
            addresses: [
              "0x90ae00be8f594c23ea87941a70574cd954fe1e1713470123b5111d6b04c37aef"->Address.unsafeFromString
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
            Config.name: "USDF",
            abi: Types.USDF.abi,
            addresses: [
              "0x32deed96558e9572abce544aaf256724aee60517eeb1fabe76e86e4790c888b0"->Address.unsafeFromString
              ,
            ],
            events: [
              module(Types.USDF.TotalSupplyEvent),
              module(Types.USDF.Mint),
              module(Types.USDF.Burn),
            ],
            sighashes: [
              Types.USDF.TotalSupplyEvent.sighash,
              Types.USDF.Mint.sighash,
              Types.USDF.Burn.sighash,
            ],
          },
          {
            Config.name: "TroveManager",
            abi: Types.TroveManager.abi,
            addresses: [
              "0x8b90326e5e82ca3b0a2d0fa0ef42023d2df25360e538d5833e94599a1178c64f"->Address.unsafeFromString
              ,
              "0x9eea94d170cfb8a1831e7c86e5167acad3e3d1166ddfc81c725377267622ec8e"->Address.unsafeFromString
              ,
              "0x5e8956e557b1e0bc79d7064222d1e853163ff8edc928be8f5ec32c1abd13df7e"->Address.unsafeFromString
              ,
              "0x4cdbfd7958cffe4562357104271c23228139e5a77933f0d4795f52ca7b715353"->Address.unsafeFromString
              ,
              "0xd7fce11644efb7a878e99229e9ee2f6de93ebec23647a0e3fb67cfbf03233264"->Address.unsafeFromString
              ,
              "0xc20ae74bfb15fb05652d911c156767051aa0c9ee918668cc3db45094106c8388"->Address.unsafeFromString
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
        let chain = ChainMap.Chain.makeUnsafe(~chainId=9889)
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
              let endpointUrl = "https://fuel.hypersync.xyz"
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
                  name: "FPTStaking",
                  events: [
                    Types.FPTStaking.StakeEvent.register(),
                    Types.FPTStaking.UnstakeEvent.register(),
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
                  name: "USDF",
                  events: [
                    Types.USDF.TotalSupplyEvent.register(),
                    Types.USDF.Mint.register(),
                    Types.USDF.Burn.register(),
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
        module(Entities.FPTStaking_StakeEvent),
        module(Entities.FPTStaking_UnstakeEvent),
        module(Entities.StabilityPool_ProvideToStabilityPoolEvent),
        module(Entities.StabilityPool_StabilityPoolLiquidationEvent),
        module(Entities.StabilityPool_WithdrawFromStabilityPoolEvent),
        module(Entities.TroveManager_RedemptionEvent),
        module(Entities.TroveManager_TroveFullLiquidationEvent),
        module(Entities.TroveManager_TrovePartialLiquidationEvent),
        module(Entities.USDF_Burn),
        module(Entities.USDF_Mint),
        module(Entities.USDF_TotalSupplyEvent),
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
    ~contractName="FPTStaking",
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
    ~contractName="USDF",
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
