{{
    config(
        schema = 'gammaswap_arbitrum',
        alias = 'base_trades',
        materialized = 'incremental',
        file_format = 'delta',
        incremental_strategy = 'merge',
        unique_key = ['tx_hash', 'evt_index'],
        incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
    )
}}
-- dbt model 
-- ci-stamp: 1 (seed version fixed so the check_seed test is no longer filtered to zero rows)
{{
    uniswap_compatible_v2_trades(
        blockchain = 'arbitrum',
        project = 'gammaswap',
        version = '1',
        Pair_evt_Swap = source('gammaswap_arbitrum', 'deltaswappair_evt_swap'),
        Factory_evt_PairCreated = source('gammaswap_arbitrum', 'deltaswapfactory_evt_paircreated')
    )
}}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           