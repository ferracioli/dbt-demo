{{ 
  config(
    materialized = 'table'
  ) 
}}

-- ---------------------------------------------------------------
-- DICA: perceba o modelo resultante com esta query
-- import duckdb
-- con = duckdb.connect("dev.duckdb")
-- con.execute(
--     "SELECT * FROM main_prata.prata_order_items LIMIT 10"
-- ).fetchdf()
-- ---------------------------------------------------------------

select 
  order_id AS order_id,
  order_item_id AS order_item_id,
  product_id AS product_id,
  seller_id AS seller_id,
  price AS price,
  freight_value AS freight_value,
  current_localtimestamp() AS ingestion_timestamp
from 
  {{ ref('order_items') }}
