# Input & Output Barang

## Deskripsi

Input & Output Barang adalah prototipe aplikasi berbasis Flutter yang memberi tahu tentang cara mengelola persediaan barang di gudang. Aplikasi menampilkan penjelasan barang masuk, barang keluar, prosedur pencatatan, dan ringkasan perhitungan stok lewat tiga slide presentasi interaktif.

## Milestone Saat Ini

UI Blueprint

## Versi

UI Blueprint - Design Milestone BAB 4

## Ringkasan UI Blueprint

- **Slide 1 – Dasar Pengelolaan:** Menjelaskan kenapa pencatatan persediaan penting, manfaat mengelola stok, dan alur barang masuk serta keluar.

- **Slide 2 – Alur Operasional:** Menampilkan tahapan penerimaan, pemeriksaan, pencatatan, dan pembaruan stok barang masuk maupun barang keluar.

- **Slide 3 – Ringkasan & Kontrol:** Menampilkan tabel persediaan yang memuat stok awal, barang masuk, barang keluar, dan stok akhir.

## Style Guide Singkat

- **Warna utama:** Biru (`#245FDD`).

- **Warna utama gelap:** Navy (`#102B56`).

- **Warna teks:** Navy gelap (`#152E50`).

- **Warna pendukung:** Hijau (`#14865F`), oranye (`#C66B20`), biru muda (`#EAF0FF`), putih, dan abu‑abu terang (`#F7F9FD`).

- **Font:** Arial.

- **Komponen utama:** `MaterialApp`, `Scaffold`, `AppBar`, `PageView`, `Container`, dan `Table`.

- **Navigasi:** `IconButton.filledTonal` untuk tombol slide sebelumnya dan berikutnya serta indikator slide interaktif.

- **Ukuran kanvas:** 1600 × 900 logical pixels per slide.

- **Animasi navigasi:** `animateToPage` dengan durasi 300 milidetik.

- **Penyesuaian tampilan:** `FittedBox` dengan `BoxFit.contain`.

## Accessibility Dasar

- Tombol navigasi memiliki tooltip yang menjelaskan fungsinya.

- Indikator slide dilengkapi label semantik.

- Tombol sebelumnya dinonaktifkan pada slide pertama.

- Tombol berikutnya dinonaktifkan pada slide terakhir.

- Informasi barang masuk dan keluar dibedakan menggunakan warna, ikon, dan label.

- Tata letak slide mempertahankan rasio desain agar konten tidak terpotong.

## Artefak Desain

Wireframe, mockup, dan style guide direncanakan disimpan pada folder `docs/ui-blueprint/`. Artefak tersebut perlu dibuat sesuai dengan tampilan tiga slide pada implementasi Flutter.

## Catatan Penggunaan AI

AI digunakan untuk membantu menyusun dokumentasi UI Blueprint dan meninjau konsistensi deskripsi, komponen UI, navigasi, style guide, serta accessibility berdasarkan kode Flutter yang tersedia.