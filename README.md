# OEE (Overall Equipment Effectiveness) System

Sistem manajemen dan pelaporan efektivitas peralatan untuk industri manufaktur.

## Struktur Folder

```
oee/
├── app/                    # Aplikasi utama
│   ├── config/            # Konfigurasi aplikasi
│   ├── controllers/       # Controller untuk logika bisnis
│   ├── models/           # Model untuk interaksi database
│   ├── services/         # Service layer untuk logika bisnis kompleks
│   ├── utils/            # Utility functions
│   └── views/            # Template dan file tampilan
├── assets/               # Asset statis
│   ├── css/             # File CSS
│   ├── js/              # File JavaScript
│   │   ├── modules/     # JavaScript modules
│   │   └── vendors/     # Third-party libraries
│   └── images/          # Gambar dan icon
├── public/              # Public files (entry point)
└── api/                 # API endpoints
    └── v1/             # API version 1

```

## Teknologi yang Digunakan

- Frontend: HTML5, CSS3, JavaScript (ES6+)
- Backend: PHP 7.4+
- Database: MySQL/MariaDB
- Server: Apache/XAMPP

## Fitur Utama

1. Manajemen Produksi
   - Pelaporan produksi per jam
   - Perhitungan target otomatis
   - Tracking produk NG (Non-Good)
   - Monitoring stoploss

2. Manajemen Personel
   - Penugasan Sub Leader
   - Tracking Operator
   - Pergantian personel dengan logging

3. Analisis Performa
   - Perhitungan efisiensi real-time
   - Tracking kumulatif target dan aktual
   - Analisis NG dan stoploss

## Instalasi

1. Clone repository ini ke folder htdocs XAMPP Anda
2. Import database dari file `database/oee.sql`
3. Sesuaikan konfigurasi database di `app/config/database.php`
4. Akses aplikasi melalui `http://localhost/oee`

## Pengembangan

Untuk berkontribusi pada pengembangan:

1. Fork repository
2. Buat branch fitur baru
3. Commit perubahan
4. Push ke branch
5. Buat Pull Request

## Lisensi

Hak Cipta © 2024 PT. CHAO LONG 