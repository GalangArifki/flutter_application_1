import 'package:flutter/material.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('02 - Alur Operasional'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Dua alur, satu disiplin pencatatan.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Periksa sebelum mencatat. Perbarui stok setiap kali transaksi selesai.',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 16),

            // Kartu Barang Masuk
            Card(
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('📦 Barang masuk (INPUT / + menambah stok)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                    Divider(),
                    Text('01. Penerimaan barang\nTerima barang dari pemasok beserta surat jalan.'),
                    SizedBox(height: 6),
                    Text('02. Pemeriksaan\nCocokkan kode, jumlah, dan kondisi dengan pesanan.'),
                    SizedBox(height: 6),
                    Text('03. Pencatatan barang masuk\nCatat tanggal, kode barang, jumlah, dan nomor bukti.'),
                    SizedBox(height: 6),
                    Text('04. Pembaruan stok\nTambahkan jumlah diterima, lalu simpan di lokasi rak.'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Kartu Barang Keluar
            Card(
              color: Colors.orange.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('📤 Barang keluar (OUTPUT / - mengurangi stok)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                    Divider(),
                    Text('01. Permintaan / pengeluaran\nSiapkan barang sesuai permintaan yang disetujui.'),
                    SizedBox(height: 6),
                    Text('02. Pemeriksaan\nPastikan kode, jumlah, kondisi, dan tujuan sudah benar.'),
                    SizedBox(height: 6),
                    Text('03. Pencatatan barang keluar\nCatat tanggal, kode barang, jumlah, dan penerima.'),
                    SizedBox(height: 6),
                    Text('04. Pembaruan stok\nKurangi jumlah dikeluarkan setelah serah terima.'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Text(
              '🔒 Kontrol wajib: bukti transaksi lengkap • jumlah terverifikasi • petugas penanggung jawab tercatat',
              style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}