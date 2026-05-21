{{ 
  config(
    materialized = 'incremental'
  ) 
}}

-- =============================================================
-- ❌  MODELO NÃO-IDEMPOTENTE — apenas para fins didáticos
-- =============================================================
--
-- PROBLEMA: este modelo incremental não declara `unique_key`.
-- Sem ele, o dbt simplesmente faz APPEND de novos registros
-- na tabela a cada execução X.X
--
-- Verifique o comportamento rodando com dbt run 2 ou 3 vezes e consultando:
-- ---------------------------------------------------------------
-- import duckdb
-- con = duckdb.connect("dev.duckdb")
-- con.execute(
--     "SELECT COUNT(*) AS total FROM main_prata.prata_non_idempotente"
-- ).fetchone()
-- ---------------------------------------------------------------

SELECT
  order_id,
  order_item_id,
  product_id,
  seller_id,
  price,
  freight_value,
  CURRENT_TIMESTAMP AS inserted_at
FROM 
  {{ ref('order_items') }}
