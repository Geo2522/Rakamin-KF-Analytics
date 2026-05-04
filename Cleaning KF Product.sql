CREATE OR REPLACE TABLE `ornate-ray-485912-e8.clean.kf_product_clean` AS
SELECT DISTINCT
  product_id,
  LOWER(TRIM(product_name)) AS product_name,
  LOWER(TRIM(product_category)) AS product_category,
  SAFE_CAST(price AS FLOAT64) AS price
FROM `ornate-ray-485912-e8.kf_product.kf_product`
WHERE price IS NOT NULL;