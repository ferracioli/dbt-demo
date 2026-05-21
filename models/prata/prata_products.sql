{{ 
  config(
    materialized = 'table'
  ) 
}}

SELECT
  product_id,
  category,
  product_name, 
  price_brl,
  current_localtimestamp() AS ingestion_timestamp

FROM 
  {{ ref('products') }}
