import 'package:flutter/material.dart';
import 'feature_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('01 - Dasar Pencatatan', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Barang masuk.\nBarang keluar.\nStok terkendali.',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Kelola setiap pergerakan barang agar jumlah fisik di gudang selalu sesuai dengan catatan.',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            const SizedBox(height: 20),

            // Kartu Ilustrasi Alur
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('MASUK\nStok bertambah', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
                        Icon(Icons.arrow_forward, color: Colors.grey),
                        Text('GUDANG\nPersediaan tercatat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        Icon(Icons.arrow_forward, color: Colors.grey),
                        Text('KELUAR\nStok berkurang', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Divider(),
                    Text('📄 Setiap pergerakan harus memiliki bukti transaksi.', style: TextStyle(fontSize: 12, color: Colors.black87))
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'MENGAPA STOK PERLU DICATAT?',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white60),
            ),
            const SizedBox(height: 10),

            // Poin-poin Mengapa Stok Perlu Dicatat
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: const Color(0xFF1E293B),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.inventory_2, color: Colors.blueAccent),
                          SizedBox(height: 8),
                          Text('Jumlah stok jelas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('Kenali barang yang tersedia dan lokasi penyimpanannya.', style: TextStyle(color: Colors.white60, fontSize: 11)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: const Color(0xFF1E293B),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.search, color: Colors.blueAccent),
                          SizedBox(height: 8),
                          Text('Selisih mudah dilacak', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text('Telusuri transaksi untuk mencegah kehilangan dan kesalahan.', style: TextStyle(color: Colors.white60, fontSize: 11)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Tombol Navigasi
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const FeaturePage(),
                  ),
                );
              },
              child: const Text('Buka Alur Operasional (02)'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: const Text('Buka Ringkasan & Kontrol (03)'),
            ),
          ],
        ),
      ),
    );
  }
}