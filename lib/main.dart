import 'package:flutter/material.dart';

void main() {
  runApp(const InventoryPresentationApp());
}

// Warna utama presentasi.
const navy = Color(0xFF102B56);
const ink = Color(0xFF152E50);
const blue = Color(0xFF245FDD);
const muted = Color(0xFF64748B);
const green = Color(0xFF14865F);
const orange = Color(0xFFC66B20);
const light = Color(0xFFF7F9FD);
const line = Color(0xFFE2E8F0);
const paleBlue = Color(0xFFEAF0FF);
const paleGreen = Color(0xFFE7F5EF);
const paleOrange = Color(0xFFFFF1E5);
const softWhite = Color(0xFFBCD0EC);

class InventoryPresentationApp extends StatelessWidget {
  const InventoryPresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input & Output Barang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        scaffoldBackgroundColor: const Color(0xFFDFE6F0),
        fontFamily: 'Arial',
      ),
      home: const PresentationScreen(),
    );
  }
}

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  static const List<Widget> _slides = [
    IntroductionSlide(),
    ProcessSlide(),
    SummarySlide(),
  ];

  void _goTo(int page) {
    if (page < 0 || page >= _slides.length) return;

    _controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input & Output Barang'),
        backgroundColor: navy,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (page) {
                  setState(() => _currentPage = page);
                },
                children: [
                  for (final slide in _slides) SlideViewport(child: slide),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filledTonal(
                    tooltip: 'Slide sebelumnya',
                    onPressed: _currentPage == 0
                        ? null
                        : () => _goTo(_currentPage - 1),
                    icon: const Icon(Icons.chevron_left),
                  ),
                  const SizedBox(width: 20),
                  for (int i = 0; i < _slides.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Semantics(
                        label: 'Buka slide ${i + 1}',
                        selected: i == _currentPage,
                        button: true,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => _goTo(i),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: i == _currentPage ? 28 : 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: i == _currentPage
                                  ? blue
                                  : const Color(0xFFB2BFD2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(width: 20),
                  IconButton.filledTonal(
                    tooltip: 'Slide berikutnya',
                    onPressed: _currentPage == _slides.length - 1
                        ? null
                        : () => _goTo(_currentPage + 1),
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Seluruh slide menggunakan kanvas 1600 × 900.
// FittedBox mempertahankan rasio tanpa memotong isi slide.
class SlideViewport extends StatelessWidget {
  final Widget child;

  const SlideViewport({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox(
            width: 1600,
            height: 900,
            child: child,
          ),
        ),
      ),
    );
  }
}

Widget copy(
  String value, {
  double size = 20,
  Color color = ink,
  FontWeight weight = FontWeight.w400,
}) {
  return Text(
    value,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight,
      height: 1.3,
    ),
  );
}

class SlideShell extends StatelessWidget {
  final int number;
  final String section;
  final bool dark;
  final Widget child;

  const SlideShell({
    super.key,
    required this.number,
    required this.section,
    required this.child,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = dark ? Colors.white : ink;
    final secondary = dark ? softWhite : muted;

    return Container(
      color: dark ? navy : light,
      padding: const EdgeInsets.fromLTRB(72, 40, 72, 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: dark ? const Color(0xFF193A66) : paleBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.inventory_2_outlined,
                  color: dark ? softWhite : blue,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              copy(
                'OPERASIONAL GUDANG',
                size: 16,
                color: foreground,
                weight: FontWeight.bold,
              ),
              const Spacer(),
              copy(
                '${number.toString().padLeft(2, '0')} — $section',
                size: 16,
                color: secondary,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Expanded(child: child),
          const SizedBox(height: 24),
          Row(
            children: [
              copy(
                'Pengelolaan persediaan • Barang masuk & barang keluar',
                size: 15,
                color: secondary,
              ),
              const Spacer(),
              Container(width: 36, height: 3, color: blue),
              const SizedBox(width: 18),
              copy(
                '${number.toString().padLeft(2, '0')} / 03',
                size: 16,
                color: foreground,
                weight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────── SLIDE 1 ───────────────────

class IntroductionSlide extends StatelessWidget {
  const IntroductionSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideShell(
      number: 1,
      section: 'Dasar pengelolaan',
      dark: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      copy(
                        'INPUT & OUTPUT BARANG',
                        size: 17,
                        color: const Color(0xFF82B3FF),
                      ),
                      const SizedBox(height: 28),
                      copy(
                        'Barang masuk.\nBarang keluar.\nStok terkendali.',
                        size: 72,
                        color: Colors.white,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 650,
                        child: copy(
                          'Kelola setiap pergerakan barang agar jumlah fisik '
                          'di gudang selalu sesuai dengan catatan.',
                          size: 24,
                          color: softWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 72),
                const SizedBox(
                  width: 648,
                  child: StockDiagram(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          copy(
            'MENGAPA STOK PERLU DICATAT?',
            size: 16,
            color: softWhite,
          ),
          const SizedBox(height: 18),
          const Row(
            children: [
              Expanded(
                child: BenefitCard(
                  icon: Icons.center_focus_strong,
                  title: 'Jumlah stok jelas',
                  description: 'Ketahui barang yang tersedia dan '
                      'lokasi penyimpanannya.',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: BenefitCard(
                  icon: Icons.verified_user_outlined,
                  title: 'Selisih mudah dilacak',
                  description: 'Telusuri transaksi untuk mencegah '
                      'kehilangan dan kesalahan.',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: BenefitCard(
                  icon: Icons.trending_up,
                  title: 'Keputusan lebih tepat',
                  description: 'Rencanakan pembelian dan pengiriman '
                      'sesuai kebutuhan.',
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}

class StockDiagram extends StatelessWidget {
  const StockDiagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          copy('SATU STOK, DUA ARAH', size: 18, weight: FontWeight.bold),
          const SizedBox(height: 34),
          const Row(
            children: [
              Expanded(
                child: DirectionBox(
                  title: 'MASUK',
                  description: 'Stok bertambah',
                  icon: Icons.add_box_outlined,
                  color: green,
                  background: paleGreen,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Icon(Icons.arrow_forward, color: green, size: 22),
              ),
              Expanded(
                flex: 14,
                child: DirectionBox(
                  title: 'GUDANG',
                  description: 'Persediaan tercatat',
                  icon: Icons.warehouse_outlined,
                  color: blue,
                  background: paleBlue,
                  large: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Icon(Icons.arrow_forward, color: orange, size: 22),
              ),
              Expanded(
                flex: 10,
                child: DirectionBox(
                  title: 'KELUAR',
                  description: 'Stok berkurang',
                  icon: Icons.outbox_outlined,
                  color: orange,
                  background: paleOrange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Divider(color: line),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.assignment_turned_in_outlined,
                  color: blue, size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: copy(
                  'Setiap pergerakan harus memiliki bukti transaksi.',
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DirectionBox extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Color background;
  final bool large;

  const DirectionBox({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.background,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: large ? 210 : 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: large ? 60 : 32, color: color),
          const SizedBox(height: 14),
          copy(
            title,
            size: large ? 23 : 18,
            color: large ? ink : color,
            weight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: large ? blue : muted,
            ),
          ),
        ],
      ),
    );
  }
}

class BenefitCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const BenefitCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF193A66),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF82B3FF), size: 28),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                copy(
                  title,
                  size: 23,
                  color: Colors.white,
                  weight: FontWeight.w600,
                ),
                const SizedBox(height: 10),
                copy(description, size: 18, color: softWhite),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────── SLIDE 2 ───────────────────

class ProcessStep {
  final String title;
  final String description;

  const ProcessStep(this.title, this.description);
}

class ProcessSlide extends StatelessWidget {
  const ProcessSlide({super.key});

  static const incoming = [
    ProcessStep(
      'Penerimaan barang',
      'Terima barang dari pemasok beserta surat jalan.',
    ),
    ProcessStep(
      'Pemeriksaan',
      'Cocokkan kode, jumlah, dan kondisi dengan pesanan.',
    ),
    ProcessStep(
      'Pencatatan barang masuk',
      'Catat tanggal, kode barang, jumlah, dan nomor bukti.',
    ),
    ProcessStep(
      'Pembaruan stok',
      'Tambahkan jumlah diterima, lalu simpan di lokasi rak.',
    ),
  ];

  static const outgoing = [
    ProcessStep(
      'Permintaan / pengeluaran',
      'Siapkan barang sesuai permintaan yang disetujui.',
    ),
    ProcessStep(
      'Pemeriksaan',
      'Pastikan kode, jumlah, kondisi, dan tujuan sudah benar.',
    ),
    ProcessStep(
      'Pencatatan barang keluar',
      'Catat tanggal, kode barang, jumlah, dan penerima.',
    ),
    ProcessStep(
      'Pembaruan stok',
      'Kurangi jumlah dikeluarkan setelah serah terima.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SlideShell(
      number: 2,
      section: 'Alur operasional',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          copy(
            'Dua alur, satu disiplin pencatatan.',
            size: 54,
            weight: FontWeight.bold,
          ),
          const SizedBox(height: 14),
          copy(
            'Periksa sebelum mencatat. Perbarui stok setiap kali '
            'transaksi selesai.',
            size: 23,
            color: muted,
          ),
          const SizedBox(height: 30),
          const Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ProcessCard(
                    title: 'Barang masuk',
                    subtitle: 'INPUT / + menambah stok',
                    tag: 'IN',
                    color: green,
                    background: paleGreen,
                    icon: Icons.add_box_outlined,
                    steps: incoming,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: ProcessCard(
                    title: 'Barang keluar',
                    subtitle: 'OUTPUT / − mengurangi stok',
                    tag: 'OUT',
                    color: orange,
                    background: paleOrange,
                    icon: Icons.outbox_outlined,
                    steps: outgoing,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: paleBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.fact_check_outlined, color: blue, size: 24),
                const SizedBox(width: 16),
                Expanded(
                  child: copy(
                    'Kontrol wajib: bukti transaksi lengkap • jumlah '
                    'terverifikasi • petugas penanggung jawab tercatat',
                    size: 19,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProcessCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String tag;
  final Color color;
  final Color background;
  final IconData icon;
  final List<ProcessStep> steps;

  const ProcessCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.color,
    required this.background,
    required this.icon,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: line),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    copy(title, size: 28, weight: FontWeight.bold),
                    const SizedBox(height: 4),
                    copy(subtitle, size: 17, color: color),
                  ],
                ),
              ),
              copy(tag, size: 15, color: color, weight: FontWeight.bold),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: line),
          const SizedBox(height: 14),
          Expanded(
            child: Column(
              children: [
                for (int i = 0; i < steps.length; i++)
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: background,
                            shape: BoxShape.circle,
                          ),
                          child: copy(
                            (i + 1).toString().padLeft(2, '0'),
                            size: 18,
                            color: color,
                            weight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              copy(
                                steps[i].title,
                                size: 22,
                                weight: FontWeight.w600,
                              ),
                              const SizedBox(height: 5),
                              copy(
                                steps[i].description,
                                size: 18,
                                color: muted,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────── SLIDE 3 ───────────────────

class InventoryItem {
  final String name;
  final String code;
  final int initial;
  final int incoming;
  final int outgoing;

  const InventoryItem({
    required this.name,
    required this.code,
    required this.initial,
    required this.incoming,
    required this.outgoing,
  });

  int get ending => initial + incoming - outgoing;
}

const inventoryItems = [
  InventoryItem(
    name: 'Kardus kemasan',
    code: 'KDS-001',
    initial: 120,
    incoming: 40,
    outgoing: 35,
  ),
  InventoryItem(
    name: 'Pita perekat',
    code: 'PPT-002',
    initial: 80,
    incoming: 25,
    outgoing: 30,
  ),
  InventoryItem(
    name: 'Label pengiriman',
    code: 'LBL-003',
    initial: 200,
    incoming: 100,
    outgoing: 90,
  ),
  InventoryItem(
    name: 'Sarung tangan',
    code: 'STG-004',
    initial: 60,
    incoming: 20,
    outgoing: 15,
  ),
];

class SummarySlide extends StatelessWidget {
  const SummarySlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideShell(
      number: 3,
      section: 'Ringkasan & kontrol',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          copy(
            'Stok akhir harus bisa dijelaskan.',
            size: 54,
            weight: FontWeight.bold,
          ),
          const SizedBox(height: 14),
          copy(
            'Ringkasan persediaan menghubungkan saldo awal dengan '
            'setiap barang yang masuk dan keluar.',
            size: 23,
            color: muted,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: paleBlue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: copy('ILUSTRASI', size: 15, color: blue),
              ),
              const SizedBox(width: 12),
              copy(
                'Contoh transaksi harian • satuan: pcs',
                size: 18,
                color: muted,
              ),
              const Spacer(),
              copy(
                'Stok akhir = Stok awal + Masuk − Keluar',
                size: 21,
                color: blue,
              ),
            ],
          ),
          const SizedBox(height: 22),
          const InventoryTable(),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: navy,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.verified_user_outlined,
                  color: softWhite,
                  size: 34,
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 12,
                  child: copy(
                    'Stok akurat dimulai\ndari catatan akurat.',
                    size: 28,
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 24),
                const Expanded(
                  flex: 10,
                  child: Principle(
                    title: 'Catat segera',
                    description: 'Jangan menunda input setelah '
                        'transaksi selesai.',
                  ),
                ),
                const SizedBox(width: 24),
                const Expanded(
                  flex: 10,
                  child: Principle(
                    title: 'Cocokkan bukti',
                    description: 'Pastikan kode, jumlah, dan tanggal '
                        'sudah sesuai.',
                  ),
                ),
                const SizedBox(width: 24),
                const Expanded(
                  flex: 10,
                  child: Principle(
                    title: 'Verifikasi fisik',
                    description: 'Lakukan stok opname dan telusuri '
                        'setiap selisih.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Principle extends StatelessWidget {
  final String title;
  final String description;

  const Principle({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        copy(
          title,
          size: 21,
          color: Colors.white,
          weight: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        copy(description, size: 17, color: softWhite),
      ],
    );
  }
}

class InventoryTable extends StatelessWidget {
  const InventoryTable({super.key});

  Widget cell(
    String value, {
    bool header = false,
    bool bold = false,
    Color? color,
    Color? background,
    bool left = false,
    double height = 58,
  }) {
    return Container(
      height: height,
      alignment: left ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: background,
      child: copy(
        value,
        size: header ? 18 : 23,
        color: color ?? (header ? Colors.white : ink),
        weight: header || bold ? FontWeight.bold : FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalInitial =
        inventoryItems.fold<int>(0, (sum, item) => sum + item.initial);
    final totalIncoming =
        inventoryItems.fold<int>(0, (sum, item) => sum + item.incoming);
    final totalOutgoing =
        inventoryItems.fold<int>(0, (sum, item) => sum + item.outgoing);
    final totalEnding =
        inventoryItems.fold<int>(0, (sum, item) => sum + item.ending);

    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(3.5),
          1: FlexColumnWidth(1.1),
          2: FlexColumnWidth(1.4),
          3: FlexColumnWidth(1.4),
          4: FlexColumnWidth(1.4),
          5: FlexColumnWidth(1.4),
        },
        border: const TableBorder(
          horizontalInside: BorderSide(color: line),
        ),
        children: [
          TableRow(
            decoration: const BoxDecoration(color: navy),
            children: [
              cell('Barang / kode', header: true, left: true),
              cell('Satuan', header: true),
              cell('Stok awal', header: true),
              cell(
                'Masuk (+)',
                header: true,
                color: const Color(0xFF8EDBBC),
              ),
              cell(
                'Keluar (−)',
                header: true,
                color: const Color(0xFFFFD0A8),
              ),
              cell('Stok akhir', header: true),
            ],
          ),
          for (final item in inventoryItems)
            TableRow(
              decoration: const BoxDecoration(color: Colors.white),
              children: [
                Container(
                  height: 58,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: copy(
                          item.name,
                          size: 22,
                          weight: FontWeight.w600,
                        ),
                      ),
                      copy(item.code, size: 15, color: muted),
                    ],
                  ),
                ),
                cell('pcs', color: muted),
                cell('${item.initial}'),
                cell(
                  '+${item.incoming}',
                  color: green,
                  background: paleGreen,
                ),
                cell(
                  '−${item.outgoing}',
                  color: orange,
                  background: paleOrange,
                ),
                cell('${item.ending}', color: blue, bold: true),
              ],
            ),
          TableRow(
            decoration: const BoxDecoration(color: paleBlue),
            children: [
              cell('Total unit', bold: true, left: true),
              cell('pcs', color: muted),
              cell('$totalInitial', bold: true),
              cell('+$totalIncoming', color: green, bold: true),
              cell('−$totalOutgoing', color: orange, bold: true),
              cell('$totalEnding', color: blue, bold: true),
            ],
          ),
        ],
      ),
    );
  }
}
