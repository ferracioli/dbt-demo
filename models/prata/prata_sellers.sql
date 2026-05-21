SELECT
  seller_id,

  -- TODO #1: Padronize o zip_code para sempre ter 8 dígitos com zeros à esquerda.
  zip_code,

  -- TODO #2: Converta city para UPPER CASE.
  city,

  state

FROM {{ ref('sellers') }}
