# Input & Output Barang

## Deskripsi

Input & Output Barang adalah aplikasi prototipe yang dibuat menggunakan Flutter. Aplikasi ini bertujuan untuk menampilkan informasi tentang pengelolaan barang di gudang. Aplikasi ini menjelaskan cara mengelola barang yang masuk, barang yang keluar, serta cara menghitung dan mengontrol stok. Tampilan aplikasi berupa presentasi interaktif yang bisa diakses dengan tombol sebelumnya, tombol berikutnya, dan indikator slide.

## Milestone Saat Ini

UI Blueprint

## Versi

UI Blueprint - Desain Milestone BAB 4

## Ringkasan UI Blueprint

- **Dasar Pengelolaan:** Menjelaskan mengapa penting untuk mencatat stok, manfaat dari pengelolaan barang, serta bagaimana barang masuk dan keluar.

- **Alur Operasional:** Menampilkan langkah-langkah penerimaan, pemeriksaan, pencatatan, dan pembaruan stok untuk barang masuk dan barang keluar.

- **Ringkasan & Kontrol:** Menampilkan tabel yang menunjukkan stok awal, barang masuk, barang keluar, dan stok akhir beserta cara mengendalikan stok.

## Style Guide Singkat

- **Warna utama:** Biru (`#245FDD`).

- **Warna latar utama:** Navy (`#102B56`) dan abu-abu kebiruan (`#F7F9FD`).

- **Warna pendukung:** Hijau (`#14865F`) untuk barang masuk, oranye (`#C66B20`) untuk barang keluar, biru muda (`#EAF0FF`), dan putih.

- **Warna teks:** Navy gelap (`#152E50`) dan abu-abu (`#64748B`).

- **Font:** Arial.

- **Komponen utama:** `MaterialApp`, `Scaffold`, `AppBar`, `PageView`, `IconButton.filledTonal`, `Container`, dan `Table`.

- **Navigasi:** Tombol panah kiri dan kanan serta indikator slide interaktif.

- **Ukuran kanvas desain:** 1600 × 900 logical pixels untuk setiap slide.

- **Animasi navigasi:** Perpindahan slide menggunakan `animateToPage` dengan durasi 300 milidetik.

## Accessibility Dasar

- Teks dan elemen visual disusun dengan jelas dan mudah diikuti.

- Warna berbeda digunakan untuk membedakan barang masuk dan barang keluar, lengkap dengan label dan ikon.

- Tombol navigasi memiliki tooltip agar pengguna tahu fungsinya.

- Indikator slide menggunakan label yang jelas agar bisa dikenali oleh teknologi bantu.

- Tombol sebelumnya tidak bisa digunakan pada slide pertama dan tombol berikutnya tidak bisa digunakan pada slide terakhir.

- Tampilan slide menggunakan `FittedBox` dengan `BoxFit.contain` untuk menjaga rasio desain.

## Artefak Desain

Wireframe, mockup, dan style guide akan disimpan di folder `docs/ui-blueprint/`. Folder tersebut harus dibuat dan diisi dengan artefak desain yang sesuai dengan aplikasi yang dibuat.

## Catatan Penggunaan AI

AI digunakan untuk membantu menyusun dan meninjau dokumentasi UI Blueprint berdasarkan struktur kode Flutter. Dokumentasi mencakup deskripsi aplikasi, identifikasi layar, style guide, navigasi, serta accessibility dasar. Namun, implementasi akhir tetap perlu diperiksa dan disesuaikan dengan kebutuhan proyek.