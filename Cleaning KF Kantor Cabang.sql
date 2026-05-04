CREATE OR REPLACE TABLE `ornate-ray-485912-e8.clean.kf_kantor_cabang_clean` AS
SELECT DISTINCT
  branch_id,
  LOWER(TRIM(branch_name)) AS branch_name,
  LOWER(TRIM(kota)) AS kota,
  LOWER(TRIM(provinsi)) AS provinsi,
  rating
FROM `ornate-ray-485912-e8.kf_kantor_cabang.kf_kantor_cabang`
WHERE rating IS NOT NULL;