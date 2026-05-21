SELECT
  order_id,
  customer_id,
  order_status,

  -- TODO #1: Converta as colunas de data abaixo para o tipo TIMESTAMP
  order_purchase_timestamp,
  order_approved_at,
  order_delivered_customer_date,
  order_estimated_delivery_date

  -- TODO #2: Adicione uma coluna booleana chamada `entregue_no_prazo`
  --          que seja TRUE quando order_delivered_customer_date <=
  --          order_estimated_delivery_date, e FALSE caso contrário.

FROM {{ ref('orders') }}
