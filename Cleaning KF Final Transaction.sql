CREATE OR REPLACE TABLE `ornate-ray-485912-e8.clean.kf_final_transaction_clean` AS
SELECT
  transaction_id,
  date,
  branch_id,
  LOWER(TRIM(customer_name)) AS customer_name,
  product_id,
  SAFE_CAST(price AS FLOAT64) AS price,
  SAFE_CAST(discount_percentage AS FLOAT64) AS discount_percentage,
  rating
FROM `ornate-ray-485912-e8.kf_final_transaction.kf_final_transaction`
WHERE price IS NOT NULL;
