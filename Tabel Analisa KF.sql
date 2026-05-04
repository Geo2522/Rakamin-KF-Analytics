CREATE OR REPLACE TABLE `ornate-ray-485912-e8.clean.tabel_analisa_clean` AS
SELECT
  t.transaction_id,
  DATE(t.date) AS date,
  
  -- Data cabang
  c.branch_id,
  c.branch_name,
  c.kota,
  c.provinsi,
  c.rating_cabang,
  
  -- Data customer
  LOWER(TRIM(t.customer_name)) AS customer_name,
  
  -- Data produk
  p.product_id,
  INITCAP(TRIM(p.product_name)) AS product_name,
  SAFE_CAST(p.price AS FLOAT64) AS actual_price,
  SAFE_CAST(t.discount_percentage AS FLOAT64) AS discount_percentage,
  
  -- Persentase gross laba sesuai aturan harga
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    WHEN p.price > 500000 THEN 0.30
  END AS persentase_gross_laba,
  
  -- Nett sales (harga setelah diskon)
  p.price * (1 - COALESCE(t.discount_percentage,0)/100) AS nett_sales,
  
  -- Nett profit (nett_sales * persentase laba)
  (p.price * (1 - COALESCE(t.discount_percentage,0)/100)) *
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    WHEN p.price > 500000 THEN 0.30
  END AS nett_profit,
  
  -- Rating transaksi
  t.rating_transaksi

FROM `ornate-ray-485912-e8.clean.kf_final_transaction_clean` t
JOIN `ornate-ray-485912-e8.clean.kf_kantor_cabang_clean` c
  ON t.branch_id = c.branch_id
JOIN `ornate-ray-485912-e8.clean.kf_product_clean` p
  ON t.product_id = p.product_id;
