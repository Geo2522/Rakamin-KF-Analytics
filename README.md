# Rakamin-KF-Analytics 
dibuat oleh Georgious Valentino Hendrik

## Deskripsi
Proyek analisis data Kimia Farma menggunakan **Google BigQuery** untuk data cleaning dan transformasi, serta **Google Looker Studio** untuk visualisasi dashboard.  
Semua query SQL dikerjakan di BigQuery Console, lalu disimpan di repo ini untuk dokumentasi dan version control.

## Struktur File
- `sql/cleaning/` → Query untuk membersihkan data (inventory, transaksi, cabang, produk).
- `sql/analysis/` → Query untuk analisis.
- `dashboard/` → Catatan atau link ke Looker Studio dashboard.
- `README.md` → Dokumentasi proyek.

## Tools
- Google BigQuery
- Google Looker Studio
- GitHub

## Dashboard
Link: *()*

## Catatan
- Semua query menggunakan `CREATE OR REPLACE TABLE` agar hasil selalu update.
- Penamaan tabel : `kf_<nama_tabel>_clean` untuk hasil cleaning.
