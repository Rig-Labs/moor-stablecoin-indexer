/* TypeScript file generated from Handlers.res by genType. */

/* eslint-disable */
/* tslint:disable */

const HandlersJS = require('./Handlers.bs.js');

import type {BorrowOperations_AdjustTroveEvent_contractRegister as Types_BorrowOperations_AdjustTroveEvent_contractRegister} from './Types.gen';

import type {BorrowOperations_AdjustTroveEvent_eventFilter as Types_BorrowOperations_AdjustTroveEvent_eventFilter} from './Types.gen';

import type {BorrowOperations_AdjustTroveEvent_handler as Types_BorrowOperations_AdjustTroveEvent_handler} from './Types.gen';

import type {BorrowOperations_AdjustTroveEvent_loader as Types_BorrowOperations_AdjustTroveEvent_loader} from './Types.gen';

import type {BorrowOperations_CloseTroveEvent_contractRegister as Types_BorrowOperations_CloseTroveEvent_contractRegister} from './Types.gen';

import type {BorrowOperations_CloseTroveEvent_eventFilter as Types_BorrowOperations_CloseTroveEvent_eventFilter} from './Types.gen';

import type {BorrowOperations_CloseTroveEvent_handler as Types_BorrowOperations_CloseTroveEvent_handler} from './Types.gen';

import type {BorrowOperations_CloseTroveEvent_loader as Types_BorrowOperations_CloseTroveEvent_loader} from './Types.gen';

import type {BorrowOperations_OpenTroveEvent_contractRegister as Types_BorrowOperations_OpenTroveEvent_contractRegister} from './Types.gen';

import type {BorrowOperations_OpenTroveEvent_eventFilter as Types_BorrowOperations_OpenTroveEvent_eventFilter} from './Types.gen';

import type {BorrowOperations_OpenTroveEvent_handler as Types_BorrowOperations_OpenTroveEvent_handler} from './Types.gen';

import type {BorrowOperations_OpenTroveEvent_loader as Types_BorrowOperations_OpenTroveEvent_loader} from './Types.gen';

import type {HandlerTypes_eventConfig as Types_HandlerTypes_eventConfig} from './Types.gen';

import type {SingleOrMultiple_t as Types_SingleOrMultiple_t} from './Types.gen';

import type {StabilityPool_ProvideToStabilityPoolEvent_contractRegister as Types_StabilityPool_ProvideToStabilityPoolEvent_contractRegister} from './Types.gen';

import type {StabilityPool_ProvideToStabilityPoolEvent_eventFilter as Types_StabilityPool_ProvideToStabilityPoolEvent_eventFilter} from './Types.gen';

import type {StabilityPool_ProvideToStabilityPoolEvent_handler as Types_StabilityPool_ProvideToStabilityPoolEvent_handler} from './Types.gen';

import type {StabilityPool_ProvideToStabilityPoolEvent_loader as Types_StabilityPool_ProvideToStabilityPoolEvent_loader} from './Types.gen';

import type {StabilityPool_StabilityPoolLiquidationEvent_contractRegister as Types_StabilityPool_StabilityPoolLiquidationEvent_contractRegister} from './Types.gen';

import type {StabilityPool_StabilityPoolLiquidationEvent_eventFilter as Types_StabilityPool_StabilityPoolLiquidationEvent_eventFilter} from './Types.gen';

import type {StabilityPool_StabilityPoolLiquidationEvent_handler as Types_StabilityPool_StabilityPoolLiquidationEvent_handler} from './Types.gen';

import type {StabilityPool_StabilityPoolLiquidationEvent_loader as Types_StabilityPool_StabilityPoolLiquidationEvent_loader} from './Types.gen';

import type {StabilityPool_WithdrawFromStabilityPoolEvent_contractRegister as Types_StabilityPool_WithdrawFromStabilityPoolEvent_contractRegister} from './Types.gen';

import type {StabilityPool_WithdrawFromStabilityPoolEvent_eventFilter as Types_StabilityPool_WithdrawFromStabilityPoolEvent_eventFilter} from './Types.gen';

import type {StabilityPool_WithdrawFromStabilityPoolEvent_handler as Types_StabilityPool_WithdrawFromStabilityPoolEvent_handler} from './Types.gen';

import type {StabilityPool_WithdrawFromStabilityPoolEvent_loader as Types_StabilityPool_WithdrawFromStabilityPoolEvent_loader} from './Types.gen';

import type {TroveManager_RedemptionEvent_contractRegister as Types_TroveManager_RedemptionEvent_contractRegister} from './Types.gen';

import type {TroveManager_RedemptionEvent_eventFilter as Types_TroveManager_RedemptionEvent_eventFilter} from './Types.gen';

import type {TroveManager_RedemptionEvent_handler as Types_TroveManager_RedemptionEvent_handler} from './Types.gen';

import type {TroveManager_RedemptionEvent_loader as Types_TroveManager_RedemptionEvent_loader} from './Types.gen';

import type {TroveManager_TroveFullLiquidationEvent_contractRegister as Types_TroveManager_TroveFullLiquidationEvent_contractRegister} from './Types.gen';

import type {TroveManager_TroveFullLiquidationEvent_eventFilter as Types_TroveManager_TroveFullLiquidationEvent_eventFilter} from './Types.gen';

import type {TroveManager_TroveFullLiquidationEvent_handler as Types_TroveManager_TroveFullLiquidationEvent_handler} from './Types.gen';

import type {TroveManager_TroveFullLiquidationEvent_loader as Types_TroveManager_TroveFullLiquidationEvent_loader} from './Types.gen';

import type {TroveManager_TrovePartialLiquidationEvent_contractRegister as Types_TroveManager_TrovePartialLiquidationEvent_contractRegister} from './Types.gen';

import type {TroveManager_TrovePartialLiquidationEvent_eventFilter as Types_TroveManager_TrovePartialLiquidationEvent_eventFilter} from './Types.gen';

import type {TroveManager_TrovePartialLiquidationEvent_handler as Types_TroveManager_TrovePartialLiquidationEvent_handler} from './Types.gen';

import type {TroveManager_TrovePartialLiquidationEvent_loader as Types_TroveManager_TrovePartialLiquidationEvent_loader} from './Types.gen';

import type {USDM_Burn_contractRegister as Types_USDM_Burn_contractRegister} from './Types.gen';

import type {USDM_Burn_eventFilter as Types_USDM_Burn_eventFilter} from './Types.gen';

import type {USDM_Burn_handler as Types_USDM_Burn_handler} from './Types.gen';

import type {USDM_Burn_loader as Types_USDM_Burn_loader} from './Types.gen';

import type {USDM_Mint_contractRegister as Types_USDM_Mint_contractRegister} from './Types.gen';

import type {USDM_Mint_eventFilter as Types_USDM_Mint_eventFilter} from './Types.gen';

import type {USDM_Mint_handler as Types_USDM_Mint_handler} from './Types.gen';

import type {USDM_Mint_loader as Types_USDM_Mint_loader} from './Types.gen';

import type {USDM_TotalSupplyEvent_contractRegister as Types_USDM_TotalSupplyEvent_contractRegister} from './Types.gen';

import type {USDM_TotalSupplyEvent_eventFilter as Types_USDM_TotalSupplyEvent_eventFilter} from './Types.gen';

import type {USDM_TotalSupplyEvent_handler as Types_USDM_TotalSupplyEvent_handler} from './Types.gen';

import type {USDM_TotalSupplyEvent_loader as Types_USDM_TotalSupplyEvent_loader} from './Types.gen';

import type {fnWithEventConfig as Types_fnWithEventConfig} from './Types.gen';

import type {genericHandlerWithLoader as Internal_genericHandlerWithLoader} from 'envio/src/Internal.gen';

export const BorrowOperations_OpenTroveEvent_handler: Types_fnWithEventConfig<Types_BorrowOperations_OpenTroveEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_BorrowOperations_OpenTroveEvent_eventFilter>> = HandlersJS.BorrowOperations.OpenTroveEvent.handler as any;

export const BorrowOperations_OpenTroveEvent_contractRegister: Types_fnWithEventConfig<Types_BorrowOperations_OpenTroveEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_BorrowOperations_OpenTroveEvent_eventFilter>> = HandlersJS.BorrowOperations.OpenTroveEvent.contractRegister as any;

export const BorrowOperations_OpenTroveEvent_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_BorrowOperations_OpenTroveEvent_loader<loaderReturn>,Types_BorrowOperations_OpenTroveEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_BorrowOperations_OpenTroveEvent_eventFilter>>) => void = HandlersJS.BorrowOperations.OpenTroveEvent.handlerWithLoader as any;

export const BorrowOperations_CloseTroveEvent_handler: Types_fnWithEventConfig<Types_BorrowOperations_CloseTroveEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_BorrowOperations_CloseTroveEvent_eventFilter>> = HandlersJS.BorrowOperations.CloseTroveEvent.handler as any;

export const BorrowOperations_CloseTroveEvent_contractRegister: Types_fnWithEventConfig<Types_BorrowOperations_CloseTroveEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_BorrowOperations_CloseTroveEvent_eventFilter>> = HandlersJS.BorrowOperations.CloseTroveEvent.contractRegister as any;

export const BorrowOperations_CloseTroveEvent_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_BorrowOperations_CloseTroveEvent_loader<loaderReturn>,Types_BorrowOperations_CloseTroveEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_BorrowOperations_CloseTroveEvent_eventFilter>>) => void = HandlersJS.BorrowOperations.CloseTroveEvent.handlerWithLoader as any;

export const BorrowOperations_AdjustTroveEvent_handler: Types_fnWithEventConfig<Types_BorrowOperations_AdjustTroveEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_BorrowOperations_AdjustTroveEvent_eventFilter>> = HandlersJS.BorrowOperations.AdjustTroveEvent.handler as any;

export const BorrowOperations_AdjustTroveEvent_contractRegister: Types_fnWithEventConfig<Types_BorrowOperations_AdjustTroveEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_BorrowOperations_AdjustTroveEvent_eventFilter>> = HandlersJS.BorrowOperations.AdjustTroveEvent.contractRegister as any;

export const BorrowOperations_AdjustTroveEvent_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_BorrowOperations_AdjustTroveEvent_loader<loaderReturn>,Types_BorrowOperations_AdjustTroveEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_BorrowOperations_AdjustTroveEvent_eventFilter>>) => void = HandlersJS.BorrowOperations.AdjustTroveEvent.handlerWithLoader as any;

export const StabilityPool_StabilityPoolLiquidationEvent_handler: Types_fnWithEventConfig<Types_StabilityPool_StabilityPoolLiquidationEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_StabilityPool_StabilityPoolLiquidationEvent_eventFilter>> = HandlersJS.StabilityPool.StabilityPoolLiquidationEvent.handler as any;

export const StabilityPool_StabilityPoolLiquidationEvent_contractRegister: Types_fnWithEventConfig<Types_StabilityPool_StabilityPoolLiquidationEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_StabilityPool_StabilityPoolLiquidationEvent_eventFilter>> = HandlersJS.StabilityPool.StabilityPoolLiquidationEvent.contractRegister as any;

export const StabilityPool_StabilityPoolLiquidationEvent_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_StabilityPool_StabilityPoolLiquidationEvent_loader<loaderReturn>,Types_StabilityPool_StabilityPoolLiquidationEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_StabilityPool_StabilityPoolLiquidationEvent_eventFilter>>) => void = HandlersJS.StabilityPool.StabilityPoolLiquidationEvent.handlerWithLoader as any;

export const StabilityPool_ProvideToStabilityPoolEvent_handler: Types_fnWithEventConfig<Types_StabilityPool_ProvideToStabilityPoolEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_StabilityPool_ProvideToStabilityPoolEvent_eventFilter>> = HandlersJS.StabilityPool.ProvideToStabilityPoolEvent.handler as any;

export const StabilityPool_ProvideToStabilityPoolEvent_contractRegister: Types_fnWithEventConfig<Types_StabilityPool_ProvideToStabilityPoolEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_StabilityPool_ProvideToStabilityPoolEvent_eventFilter>> = HandlersJS.StabilityPool.ProvideToStabilityPoolEvent.contractRegister as any;

export const StabilityPool_ProvideToStabilityPoolEvent_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_StabilityPool_ProvideToStabilityPoolEvent_loader<loaderReturn>,Types_StabilityPool_ProvideToStabilityPoolEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_StabilityPool_ProvideToStabilityPoolEvent_eventFilter>>) => void = HandlersJS.StabilityPool.ProvideToStabilityPoolEvent.handlerWithLoader as any;

export const StabilityPool_WithdrawFromStabilityPoolEvent_handler: Types_fnWithEventConfig<Types_StabilityPool_WithdrawFromStabilityPoolEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_StabilityPool_WithdrawFromStabilityPoolEvent_eventFilter>> = HandlersJS.StabilityPool.WithdrawFromStabilityPoolEvent.handler as any;

export const StabilityPool_WithdrawFromStabilityPoolEvent_contractRegister: Types_fnWithEventConfig<Types_StabilityPool_WithdrawFromStabilityPoolEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_StabilityPool_WithdrawFromStabilityPoolEvent_eventFilter>> = HandlersJS.StabilityPool.WithdrawFromStabilityPoolEvent.contractRegister as any;

export const StabilityPool_WithdrawFromStabilityPoolEvent_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_StabilityPool_WithdrawFromStabilityPoolEvent_loader<loaderReturn>,Types_StabilityPool_WithdrawFromStabilityPoolEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_StabilityPool_WithdrawFromStabilityPoolEvent_eventFilter>>) => void = HandlersJS.StabilityPool.WithdrawFromStabilityPoolEvent.handlerWithLoader as any;

export const TroveManager_TrovePartialLiquidationEvent_handler: Types_fnWithEventConfig<Types_TroveManager_TrovePartialLiquidationEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_TroveManager_TrovePartialLiquidationEvent_eventFilter>> = HandlersJS.TroveManager.TrovePartialLiquidationEvent.handler as any;

export const TroveManager_TrovePartialLiquidationEvent_contractRegister: Types_fnWithEventConfig<Types_TroveManager_TrovePartialLiquidationEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_TroveManager_TrovePartialLiquidationEvent_eventFilter>> = HandlersJS.TroveManager.TrovePartialLiquidationEvent.contractRegister as any;

export const TroveManager_TrovePartialLiquidationEvent_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_TroveManager_TrovePartialLiquidationEvent_loader<loaderReturn>,Types_TroveManager_TrovePartialLiquidationEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_TroveManager_TrovePartialLiquidationEvent_eventFilter>>) => void = HandlersJS.TroveManager.TrovePartialLiquidationEvent.handlerWithLoader as any;

export const TroveManager_TroveFullLiquidationEvent_handler: Types_fnWithEventConfig<Types_TroveManager_TroveFullLiquidationEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_TroveManager_TroveFullLiquidationEvent_eventFilter>> = HandlersJS.TroveManager.TroveFullLiquidationEvent.handler as any;

export const TroveManager_TroveFullLiquidationEvent_contractRegister: Types_fnWithEventConfig<Types_TroveManager_TroveFullLiquidationEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_TroveManager_TroveFullLiquidationEvent_eventFilter>> = HandlersJS.TroveManager.TroveFullLiquidationEvent.contractRegister as any;

export const TroveManager_TroveFullLiquidationEvent_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_TroveManager_TroveFullLiquidationEvent_loader<loaderReturn>,Types_TroveManager_TroveFullLiquidationEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_TroveManager_TroveFullLiquidationEvent_eventFilter>>) => void = HandlersJS.TroveManager.TroveFullLiquidationEvent.handlerWithLoader as any;

export const TroveManager_RedemptionEvent_handler: Types_fnWithEventConfig<Types_TroveManager_RedemptionEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_TroveManager_RedemptionEvent_eventFilter>> = HandlersJS.TroveManager.RedemptionEvent.handler as any;

export const TroveManager_RedemptionEvent_contractRegister: Types_fnWithEventConfig<Types_TroveManager_RedemptionEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_TroveManager_RedemptionEvent_eventFilter>> = HandlersJS.TroveManager.RedemptionEvent.contractRegister as any;

export const TroveManager_RedemptionEvent_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_TroveManager_RedemptionEvent_loader<loaderReturn>,Types_TroveManager_RedemptionEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_TroveManager_RedemptionEvent_eventFilter>>) => void = HandlersJS.TroveManager.RedemptionEvent.handlerWithLoader as any;

export const USDM_TotalSupplyEvent_handler: Types_fnWithEventConfig<Types_USDM_TotalSupplyEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_USDM_TotalSupplyEvent_eventFilter>> = HandlersJS.USDM.TotalSupplyEvent.handler as any;

export const USDM_TotalSupplyEvent_contractRegister: Types_fnWithEventConfig<Types_USDM_TotalSupplyEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_USDM_TotalSupplyEvent_eventFilter>> = HandlersJS.USDM.TotalSupplyEvent.contractRegister as any;

export const USDM_TotalSupplyEvent_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_USDM_TotalSupplyEvent_loader<loaderReturn>,Types_USDM_TotalSupplyEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_USDM_TotalSupplyEvent_eventFilter>>) => void = HandlersJS.USDM.TotalSupplyEvent.handlerWithLoader as any;

export const USDM_Mint_handler: Types_fnWithEventConfig<Types_USDM_Mint_handler<void>,Types_HandlerTypes_eventConfig<Types_USDM_Mint_eventFilter>> = HandlersJS.USDM.Mint.handler as any;

export const USDM_Mint_contractRegister: Types_fnWithEventConfig<Types_USDM_Mint_contractRegister,Types_HandlerTypes_eventConfig<Types_USDM_Mint_eventFilter>> = HandlersJS.USDM.Mint.contractRegister as any;

export const USDM_Mint_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_USDM_Mint_loader<loaderReturn>,Types_USDM_Mint_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_USDM_Mint_eventFilter>>) => void = HandlersJS.USDM.Mint.handlerWithLoader as any;

export const USDM_Burn_handler: Types_fnWithEventConfig<Types_USDM_Burn_handler<void>,Types_HandlerTypes_eventConfig<Types_USDM_Burn_eventFilter>> = HandlersJS.USDM.Burn.handler as any;

export const USDM_Burn_contractRegister: Types_fnWithEventConfig<Types_USDM_Burn_contractRegister,Types_HandlerTypes_eventConfig<Types_USDM_Burn_eventFilter>> = HandlersJS.USDM.Burn.contractRegister as any;

export const USDM_Burn_handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_USDM_Burn_loader<loaderReturn>,Types_USDM_Burn_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_USDM_Burn_eventFilter>>) => void = HandlersJS.USDM.Burn.handlerWithLoader as any;

export const TroveManager: {
  TroveFullLiquidationEvent: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_TroveManager_TroveFullLiquidationEvent_loader<loaderReturn>,Types_TroveManager_TroveFullLiquidationEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_TroveManager_TroveFullLiquidationEvent_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_TroveManager_TroveFullLiquidationEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_TroveManager_TroveFullLiquidationEvent_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_TroveManager_TroveFullLiquidationEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_TroveManager_TroveFullLiquidationEvent_eventFilter>>
  }; 
  RedemptionEvent: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_TroveManager_RedemptionEvent_loader<loaderReturn>,Types_TroveManager_RedemptionEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_TroveManager_RedemptionEvent_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_TroveManager_RedemptionEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_TroveManager_RedemptionEvent_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_TroveManager_RedemptionEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_TroveManager_RedemptionEvent_eventFilter>>
  }; 
  TrovePartialLiquidationEvent: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_TroveManager_TrovePartialLiquidationEvent_loader<loaderReturn>,Types_TroveManager_TrovePartialLiquidationEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_TroveManager_TrovePartialLiquidationEvent_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_TroveManager_TrovePartialLiquidationEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_TroveManager_TrovePartialLiquidationEvent_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_TroveManager_TrovePartialLiquidationEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_TroveManager_TrovePartialLiquidationEvent_eventFilter>>
  }
} = HandlersJS.TroveManager as any;

export const USDM: {
  TotalSupplyEvent: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_USDM_TotalSupplyEvent_loader<loaderReturn>,Types_USDM_TotalSupplyEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_USDM_TotalSupplyEvent_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_USDM_TotalSupplyEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_USDM_TotalSupplyEvent_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_USDM_TotalSupplyEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_USDM_TotalSupplyEvent_eventFilter>>
  }; 
  Mint: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_USDM_Mint_loader<loaderReturn>,Types_USDM_Mint_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_USDM_Mint_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_USDM_Mint_handler<void>,Types_HandlerTypes_eventConfig<Types_USDM_Mint_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_USDM_Mint_contractRegister,Types_HandlerTypes_eventConfig<Types_USDM_Mint_eventFilter>>
  }; 
  Burn: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_USDM_Burn_loader<loaderReturn>,Types_USDM_Burn_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_USDM_Burn_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_USDM_Burn_handler<void>,Types_HandlerTypes_eventConfig<Types_USDM_Burn_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_USDM_Burn_contractRegister,Types_HandlerTypes_eventConfig<Types_USDM_Burn_eventFilter>>
  }
} = HandlersJS.USDM as any;

export const BorrowOperations: {
  OpenTroveEvent: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_BorrowOperations_OpenTroveEvent_loader<loaderReturn>,Types_BorrowOperations_OpenTroveEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_BorrowOperations_OpenTroveEvent_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_BorrowOperations_OpenTroveEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_BorrowOperations_OpenTroveEvent_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_BorrowOperations_OpenTroveEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_BorrowOperations_OpenTroveEvent_eventFilter>>
  }; 
  CloseTroveEvent: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_BorrowOperations_CloseTroveEvent_loader<loaderReturn>,Types_BorrowOperations_CloseTroveEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_BorrowOperations_CloseTroveEvent_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_BorrowOperations_CloseTroveEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_BorrowOperations_CloseTroveEvent_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_BorrowOperations_CloseTroveEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_BorrowOperations_CloseTroveEvent_eventFilter>>
  }; 
  AdjustTroveEvent: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_BorrowOperations_AdjustTroveEvent_loader<loaderReturn>,Types_BorrowOperations_AdjustTroveEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_BorrowOperations_AdjustTroveEvent_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_BorrowOperations_AdjustTroveEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_BorrowOperations_AdjustTroveEvent_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_BorrowOperations_AdjustTroveEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_BorrowOperations_AdjustTroveEvent_eventFilter>>
  }
} = HandlersJS.BorrowOperations as any;

export const StabilityPool: {
  ProvideToStabilityPoolEvent: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_StabilityPool_ProvideToStabilityPoolEvent_loader<loaderReturn>,Types_StabilityPool_ProvideToStabilityPoolEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_StabilityPool_ProvideToStabilityPoolEvent_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_StabilityPool_ProvideToStabilityPoolEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_StabilityPool_ProvideToStabilityPoolEvent_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_StabilityPool_ProvideToStabilityPoolEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_StabilityPool_ProvideToStabilityPoolEvent_eventFilter>>
  }; 
  WithdrawFromStabilityPoolEvent: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_StabilityPool_WithdrawFromStabilityPoolEvent_loader<loaderReturn>,Types_StabilityPool_WithdrawFromStabilityPoolEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_StabilityPool_WithdrawFromStabilityPoolEvent_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_StabilityPool_WithdrawFromStabilityPoolEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_StabilityPool_WithdrawFromStabilityPoolEvent_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_StabilityPool_WithdrawFromStabilityPoolEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_StabilityPool_WithdrawFromStabilityPoolEvent_eventFilter>>
  }; 
  StabilityPoolLiquidationEvent: {
    handlerWithLoader: <loaderReturn>(_1:Internal_genericHandlerWithLoader<Types_StabilityPool_StabilityPoolLiquidationEvent_loader<loaderReturn>,Types_StabilityPool_StabilityPoolLiquidationEvent_handler<loaderReturn>,Types_SingleOrMultiple_t<Types_StabilityPool_StabilityPoolLiquidationEvent_eventFilter>>) => void; 
    handler: Types_fnWithEventConfig<Types_StabilityPool_StabilityPoolLiquidationEvent_handler<void>,Types_HandlerTypes_eventConfig<Types_StabilityPool_StabilityPoolLiquidationEvent_eventFilter>>; 
    contractRegister: Types_fnWithEventConfig<Types_StabilityPool_StabilityPoolLiquidationEvent_contractRegister,Types_HandlerTypes_eventConfig<Types_StabilityPool_StabilityPoolLiquidationEvent_eventFilter>>
  }
} = HandlersJS.StabilityPool as any;
