CREATE OR REPLACE TABLE `ornate-ray-485912-e8.clean.kf_inventory_clean` AS
SELECT DISTINCT
  inventory_id,
  branch_id,
  product_id,
  SAFE_CAST(opname_stock AS INT64) AS opname_stock
FROM `ornate-ray-485912-e8.kf_inventory.kf_inventory`
WHERE opname_stock IS NOT NULL;
