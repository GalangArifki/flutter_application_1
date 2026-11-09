import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operasional Gudang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F172A),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// ===============================
// HALAMAN 1: HOME PAGE (01 - Dasar Pencatatan)
// ===============================
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

            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('MASUK\nStok bertambah', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 11)),
                        Icon(Icons.arrow_forward, color: Colors.grey, size: 16),
                        Text('GUDANG\nPersediaan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                        Icon(Icons.arrow_forward, color: Colors.grey, size: 16),
                        Text('KELUAR\nStok berkurang', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 11)),
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
                          Text('Telusuri transaksi untuk mencegah kehilangan.', style: TextStyle(color: Colors.white60, fontSize: 11)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const FeaturePage(),
                  ),
                );
              },
              child: const Text('Buka Alur Operasional (Fitur Utama)'),
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
              child: const Text('Buka Ringkasan & Kontrol (Profil)'),
            ),
          ],
        ),
      ),
    );
  }
}

// ===============================
// HALAMAN 2: FEATURE PAGE (02 - Alur Operasional)
// ===============================
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

// ===============================
// HALAMAN 3: PROFILE PAGE (03 - Ringkasan & Kontrol)
// ===============================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('03 - Ringkasan & Kontrol'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Stok akhir harus bisa dijelaskan.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Rumus: Stok akhir = Stok awal + Masuk - Keluar',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 16),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Barang / kode')),
                  DataColumn(label: Text('Satuan')),
                  DataColumn(label: Text('Stok awal')),
                  DataColumn(label: Text('Masuk (+)')),
                  DataColumn(label: Text('Keluar (-)')),
                  DataColumn(label: Text('Stok akhir')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('Kardus kemasan (KDS-001)')),
                    DataCell(Text('pcs')),
                    DataCell(Text('120')),
                    DataCell(Text('+40', style: TextStyle(color: Colors.green))),
                    DataCell(Text('-35', style: TextStyle(color: Colors.orange))),
                    DataCell(Text('125', style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Pita perekat (PPT-002)')),
                    DataCell(Text('pcs')),
                    DataCell(Text('80')),
                    DataCell(Text('+25', style: TextStyle(color: Colors.green))),
                    DataCell(Text('-30', style: TextStyle(color: Colors.orange))),
                    DataCell(Text('75', style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Label pengiriman (LBL-003)')),
                    DataCell(Text('pcs')),
                    DataCell(Text('200')),
                    DataCell(Text('+100', style: TextStyle(color: Colors.green))),
                    DataCell(Text('-90', style: TextStyle(color: Colors.orange))),
                    DataCell(Text('210', style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Sarung tangan (STG-004)')),
                    DataCell(Text('pcs')),
                    DataCell(Text('60')),
                    DataCell(Text('+20', style: TextStyle(color: Colors.green))),
                    DataCell(Text('-15', style: TextStyle(color: Colors.orange))),
                    DataCell(Text('65', style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Total unit', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataCell(Text('pcs')),
                    DataCell(Text('460', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataCell(Text('+185', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green))),
                    DataCell(Text('-170', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange))),
                    DataCell(Text('475', style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                ],
              ),
            ),

            const SizedBox(height: 20),
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