SELECT
  customer_id,
  customer_unique_id,

  -- TODO #1: Padronize o zip_code para sempre ter 8 dígitos com zeros à esquerda.
  --          Dica: LPAD
  zip_code,

  -- TODO #2: Converta city para UPPER CASE.
  city,

  state

FROM {{ ref('customers') }}
