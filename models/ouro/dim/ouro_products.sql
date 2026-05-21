{{ 
  config(
    materialized = 'table',
    alias = 'd_product'
  ) 
}}

select 
  hash(product_id) as product_key,
  product_id,
  category,
  product_name,
  price_brl,
  current_localtimestamp() as ingestion_timestamp
from {{ ref('prata_products') }}
