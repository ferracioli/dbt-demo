{{ 
  config(
    materialized = 'table',
    alias = 'f_order_items'
  ) 
}}

-- Esta tabela possui um alias: o nome dentro do DB será o nome do alias
-- ---------------------------------------------------------------
-- DICA: perceba o modelo resultante com esta query
-- import duckdb
-- con = duckdb.connect("dev.duckdb")
-- con.execute(
--     "SELECT * FROM main_ouro.f_order_items LIMIT 10"
-- ).fetchdf()
-- ---------------------------------------------------------------

select 
  hash(oi.order_id, oi.order_item_id) as order_item_key,
  oi.order_id as order_id,
  oi.order_item_id as order_item_id,
  p.product_key,
  oi.seller_id as seller_id,
  oi.price as price,
  oi.freight_value as freight_value,
  current_localtimestamp() as ingestion_timestamp
from {{ ref('prata_order_items') }} as oi left join
    {{ ref('ouro_products') }} as p
        ON oi.product_id = p.product_id

-- TODO: crie as demais dimensões e ajuste a tabela fato :)