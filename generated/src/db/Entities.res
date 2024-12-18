open Table
open Enums.EntityType
type id = string

type internalEntity
module type Entity = {
  type t
  let name: Enums.EntityType.t
  let schema: S.t<t>
  let rowsSchema: S.t<array<t>>
  let table: Table.table
  let entityHistory: EntityHistory.t<t>
}
module type InternalEntity = Entity with type t = internalEntity
external entityModToInternal: module(Entity with type t = 'a) => module(InternalEntity) = "%identity"
external entityModsToInternal: array<module(Entity)> => array<module(InternalEntity)> = "%identity"

@get
external getEntityId: internalEntity => string = "id"

exception UnexpectedIdNotDefinedOnEntity
let getEntityIdUnsafe = (entity: 'entity): id =>
  switch Utils.magic(entity)["id"] {
  | Some(id) => id
  | None =>
    UnexpectedIdNotDefinedOnEntity->ErrorHandling.mkLogAndRaise(
      ~msg="Property 'id' does not exist on expected entity object",
    )
  }

//shorthand for punning
let isPrimaryKey = true
let isNullable = true
let isArray = true
let isIndex = true

@genType
type whereOperations<'entity, 'fieldType> = {eq: 'fieldType => promise<array<'entity>>}

module BorrowOperations_AdjustTroveEvent = {
  let name = BorrowOperations_AdjustTroveEvent
  @genType
  type t = {
    asset: string,
    collateral: bigint,
    collateralChange: bigint,
    debt: bigint,
    debtChange: bigint,
    id: id,
    identity: string,
    isCollateralIncrease: bool,
    isDebtIncrease: bool,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    asset: s.field("asset", S.string),
    collateral: s.field("collateral", BigInt.schema),
    collateralChange: s.field("collateralChange", BigInt.schema),
    debt: s.field("debt", BigInt.schema),
    debtChange: s.field("debtChange", BigInt.schema),
    id: s.field("id", S.string),
    identity: s.field("identity", S.string),
    isCollateralIncrease: s.field("isCollateralIncrease", S.bool),
    isDebtIncrease: s.field("isDebtIncrease", S.bool),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("asset") asset: whereOperations<t, string>,
    
      @as("identity") identity: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "asset", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "collateral", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "collateralChange", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "debt", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "debtChange", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "identity", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "isCollateralIncrease", 
      Boolean,
      
      
      
      
      
      ),
      mkField(
      "isDebtIncrease", 
      Boolean,
      
      
      
      
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module BorrowOperations_CloseTroveEvent = {
  let name = BorrowOperations_CloseTroveEvent
  @genType
  type t = {
    asset: string,
    collateral: bigint,
    debt: bigint,
    id: id,
    identity: string,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    asset: s.field("asset", S.string),
    collateral: s.field("collateral", BigInt.schema),
    debt: s.field("debt", BigInt.schema),
    id: s.field("id", S.string),
    identity: s.field("identity", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("asset") asset: whereOperations<t, string>,
    
      @as("identity") identity: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "asset", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "collateral", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "debt", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "identity", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module BorrowOperations_OpenTroveEvent = {
  let name = BorrowOperations_OpenTroveEvent
  @genType
  type t = {
    asset: string,
    collateral: bigint,
    debt: bigint,
    id: id,
    identity: string,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    asset: s.field("asset", S.string),
    collateral: s.field("collateral", BigInt.schema),
    debt: s.field("debt", BigInt.schema),
    id: s.field("id", S.string),
    identity: s.field("identity", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("asset") asset: whereOperations<t, string>,
    
      @as("identity") identity: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "asset", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "collateral", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "debt", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "identity", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FPTStaking_StakeEvent = {
  let name = FPTStaking_StakeEvent
  @genType
  type t = {
    amount: bigint,
    id: id,
    identity: string,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    amount: s.field("amount", BigInt.schema),
    id: s.field("id", S.string),
    identity: s.field("identity", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("identity") identity: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "identity", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module FPTStaking_UnstakeEvent = {
  let name = FPTStaking_UnstakeEvent
  @genType
  type t = {
    amount: bigint,
    id: id,
    identity: string,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    amount: s.field("amount", BigInt.schema),
    id: s.field("id", S.string),
    identity: s.field("identity", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("identity") identity: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "identity", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module StabilityPool_ProvideToStabilityPoolEvent = {
  let name = StabilityPool_ProvideToStabilityPoolEvent
  @genType
  type t = {
    amount: bigint,
    compounded_amount: bigint,
    id: id,
    identity: string,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    amount: s.field("amount", BigInt.schema),
    compounded_amount: s.field("compounded_amount", BigInt.schema),
    id: s.field("id", S.string),
    identity: s.field("identity", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("identity") identity: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "compounded_amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "identity", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module StabilityPool_StabilityPoolLiquidationEvent = {
  let name = StabilityPool_StabilityPoolLiquidationEvent
  @genType
  type t = {
    asset: string,
    collateral_to_offset: bigint,
    debt_to_offset: bigint,
    id: id,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    asset: s.field("asset", S.string),
    collateral_to_offset: s.field("collateral_to_offset", BigInt.schema),
    debt_to_offset: s.field("debt_to_offset", BigInt.schema),
    id: s.field("id", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("asset") asset: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "asset", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "collateral_to_offset", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "debt_to_offset", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module StabilityPool_WithdrawFromStabilityPoolEvent = {
  let name = StabilityPool_WithdrawFromStabilityPoolEvent
  @genType
  type t = {
    amount: bigint,
    compounded_amount: bigint,
    id: id,
    identity: string,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    amount: s.field("amount", BigInt.schema),
    compounded_amount: s.field("compounded_amount", BigInt.schema),
    id: s.field("id", S.string),
    identity: s.field("identity", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("identity") identity: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "compounded_amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "identity", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module TroveManager_RedemptionEvent = {
  let name = TroveManager_RedemptionEvent
  @genType
  type t = {
    asset: string,
    collateral_amount: bigint,
    collateral_price: bigint,
    id: id,
    identity: string,
    timestamp: int,
    txHash: string,
    usdf_amount: bigint,
  }

  let schema = S.object((s): t => {
    asset: s.field("asset", S.string),
    collateral_amount: s.field("collateral_amount", BigInt.schema),
    collateral_price: s.field("collateral_price", BigInt.schema),
    id: s.field("id", S.string),
    identity: s.field("identity", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
    usdf_amount: s.field("usdf_amount", BigInt.schema),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("asset") asset: whereOperations<t, string>,
    
      @as("identity") identity: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "asset", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "collateral_amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "collateral_price", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "identity", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField(
      "usdf_amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module TroveManager_TroveFullLiquidationEvent = {
  let name = TroveManager_TroveFullLiquidationEvent
  @genType
  type t = {
    asset: string,
    collateral: bigint,
    debt: bigint,
    id: id,
    identity: string,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    asset: s.field("asset", S.string),
    collateral: s.field("collateral", BigInt.schema),
    debt: s.field("debt", BigInt.schema),
    id: s.field("id", S.string),
    identity: s.field("identity", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("asset") asset: whereOperations<t, string>,
    
      @as("identity") identity: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "asset", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "collateral", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "debt", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "identity", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module TroveManager_TrovePartialLiquidationEvent = {
  let name = TroveManager_TrovePartialLiquidationEvent
  @genType
  type t = {
    asset: string,
    id: id,
    identity: string,
    remaining_collateral: bigint,
    remaining_debt: bigint,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    asset: s.field("asset", S.string),
    id: s.field("id", S.string),
    identity: s.field("identity", S.string),
    remaining_collateral: s.field("remaining_collateral", BigInt.schema),
    remaining_debt: s.field("remaining_debt", BigInt.schema),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
      @as("asset") asset: whereOperations<t, string>,
    
      @as("identity") identity: whereOperations<t, string>,
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "asset", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "identity", 
      Text,
      
      
      
      ~isIndex,
      
      ),
      mkField(
      "remaining_collateral", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "remaining_debt", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module USDF_Burn = {
  let name = USDF_Burn
  @genType
  type t = {
    amount: bigint,
    id: id,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    amount: s.field("amount", BigInt.schema),
    id: s.field("id", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module USDF_Mint = {
  let name = USDF_Mint
  @genType
  type t = {
    amount: bigint,
    id: id,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    amount: s.field("amount", BigInt.schema),
    id: s.field("id", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

module USDF_TotalSupplyEvent = {
  let name = USDF_TotalSupplyEvent
  @genType
  type t = {
    amount: bigint,
    id: id,
    timestamp: int,
    txHash: string,
  }

  let schema = S.object((s): t => {
    amount: s.field("amount", BigInt.schema),
    id: s.field("id", S.string),
    timestamp: s.field("timestamp", GqlDbCustomTypes.Int.schema),
    txHash: s.field("txHash", S.string),
  })

  let rowsSchema = S.array(schema)

  @genType
  type indexedFieldOperations = {
    
  }

  let table = mkTable(
     (name :> string),
    ~fields=[
      mkField(
      "amount", 
      Numeric,
      
      
      
      
      
      ),
      mkField(
      "id", 
      Text,
      ~isPrimaryKey,
      
      
      
      
      ),
      mkField(
      "timestamp", 
      Integer,
      
      
      
      
      
      ),
      mkField(
      "txHash", 
      Text,
      
      
      
      
      
      ),
      mkField("db_write_timestamp", TimestampWithoutTimezone, ~default="CURRENT_TIMESTAMP"),
    ],
  )

  let entityHistory = table->EntityHistory.fromTable(~schema)
}

let allEntities = [
  module(BorrowOperations_AdjustTroveEvent),
  module(BorrowOperations_CloseTroveEvent),
  module(BorrowOperations_OpenTroveEvent),
  module(FPTStaking_StakeEvent),
  module(FPTStaking_UnstakeEvent),
  module(StabilityPool_ProvideToStabilityPoolEvent),
  module(StabilityPool_StabilityPoolLiquidationEvent),
  module(StabilityPool_WithdrawFromStabilityPoolEvent),
  module(TroveManager_RedemptionEvent),
  module(TroveManager_TroveFullLiquidationEvent),
  module(TroveManager_TrovePartialLiquidationEvent),
  module(USDF_Burn),
  module(USDF_Mint),
  module(USDF_TotalSupplyEvent),
  module(TablesStatic.DynamicContractRegistry),
]->entityModsToInternal
