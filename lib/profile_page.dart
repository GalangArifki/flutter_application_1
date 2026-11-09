import 'package:flutter/material.dart';

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
              'Ringkasan persediaan menghubungkan saldo awal dengan setiap barang yang masuk dan keluar.',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 12),
            const Text(
              'Rumus: Stok akhir = Stok awal + Masuk - Keluar',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 16),

            // Tabel Data Persediaan
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
                    DataCell(Text('Kardus kemasan\n(KDS-001)')),
                    DataCell(Text('pcs')),
                    DataCell(Text('120')),
                    DataCell(Text('+40', style: TextStyle(color: Colors.green))),
                    DataCell(Text('-35', style: TextStyle(color: Colors.orange))),
                    DataCell(Text('125', style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Pita perekat\n(PPT-002)')),
                    DataCell(Text('pcs')),
                    DataCell(Text('80')),
                    DataCell(Text('+25', style: TextStyle(color: Colors.green))),
                    DataCell(Text('-30', style: TextStyle(color: Colors.orange))),
                    DataCell(Text('75', style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Label pengiriman\n(LBL-003)')),
                    DataCell(Text('pcs')),
                    DataCell(Text('200')),
                    DataCell(Text('+100', style: TextStyle(color: Colors.green))),
                    DataCell(Text('-90', style: TextStyle(color: Colors.orange))),
                    DataCell(Text('210', style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Sarung tangan\n(STG-004)')),
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