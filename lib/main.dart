import 'package:flutter/material.dart';

void main() => runApp(const RatControlApp());

const bg = Color(0xFF030711);
const panel = Color(0xFF071426);
const cyan = Color(0xFF00E5FF);
const magenta = Color(0xFFDF35FF);
const mainText = Color(0xFFE8F7FF);
const muted = Color(0xFF83A8C5);

class RatControlApp extends StatelessWidget {
  const RatControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAT CONTROL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: const ColorScheme.dark(
          primary: cyan,
          secondary: magenta,
          surface: panel,
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedTab = 0;
  final codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  void openPairDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: panel,
        title: const Text('Hubungkan perangkat',
            style: TextStyle(color: cyan, fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Masukkan kode pasangan yang ditampilkan pada perangkat tujuan.',
              style: TextStyle(color: mainText),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: codeController,
              style: const TextStyle(color: mainText),
              decoration: const InputDecoration(
                labelText: 'Kode pasangan',
                labelStyle: TextStyle(color: muted),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: muted),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: cyan),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Prototipe UI: koneksi server belum diaktifkan.',
              style: TextStyle(color: magenta, fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('BATAL', style: TextStyle(color: muted)),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: cyan,
              foregroundColor: bg,
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('SELESAI'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF071326), bg, Color(0xFF10071C)],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('RAT',
                            style: TextStyle(
                              color: cyan,
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2,
                            )),
                        Text('CONTROL // REMOTE LINK',
                            style: TextStyle(
                              color: mainText,
                              fontSize: 11,
                              letterSpacing: 2,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 9),
                    decoration: BoxDecoration(
                      color: panel,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: magenta),
                    ),
                    child: const Text('● OFFLINE',
                        style: TextStyle(
                            color: magenta,
                            fontWeight: FontWeight.bold,
                            fontSize: 11)),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              const SectionLabel('PANEL KENDALI'),
              const SizedBox(height: 10),
              NeonPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('STATUS KONEKSI',
                        style: TextStyle(
                            color: muted, fontSize: 11, letterSpacing: 1.5)),
                    const SizedBox(height: 8),
                    const Text('Belum terhubung',
                        style: TextStyle(
                            color: mainText,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    const Text('Pasangkan perangkat untuk memulai sesi.',
                        style: TextStyle(color: muted, fontSize: 13)),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: openPairDialog,
                        icon: const Icon(Icons.add_link),
                        label: const Text('HUBUNGKAN PERANGKAT'),
                        style: FilledButton.styleFrom(
                          backgroundColor: cyan,
                          foregroundColor: bg,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w900, letterSpacing: .5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const SectionLabel('FITUR UTAMA'),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Expanded(
                    child: FeatureCard(
                        icon: Icons.screen_share_outlined,
                        title: 'Lihat Layar',
                        subtitle: 'Perlu persetujuan'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: FeatureCard(
                        icon: Icons.swap_horiz,
                        title: 'Transfer File',
                        subtitle: 'Kirim / terima'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Expanded(
                    child: FeatureCard(
                        icon: Icons.camera_alt_outlined,
                        title: 'Kamera',
                        subtitle: 'Akses dengan izin'),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: FeatureCard(
                        icon: Icons.notifications_none,
                        title: 'Notifikasi',
                        subtitle: 'Izin Android'),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const SectionLabel('KEAMANAN'),
              const SizedBox(height: 10),
              NeonPanel(
                child: const Column(
                  children: [
                    SecurityRow('Autentikasi perangkat', 'AKTIF'),
                    Divider(color: Color(0x3342DFFF), height: 22),
                    SecurityRow('Persetujuan pemilik', 'WAJIB'),
                    Divider(color: Color(0x3342DFFF), height: 22),
                    SecurityRow('Indikator sesi', 'AKTIF'),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  for (int i = 0; i < 4; i++) ...[
                    if (i > 0) const SizedBox(width: 6),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => setState(() => selectedTab = i),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: selectedTab == i ? cyan : muted,
                          side: BorderSide(
                              color: selectedTab == i
                                  ? cyan
                                  : muted.withOpacity(.35)),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: Text(
                          ['Beranda', 'Perangkat', 'Riwayat', 'Pengaturan'][i],
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 14),
              const Center(
                child: Text('RAT CONTROL • UI PROTOTYPE v1.0.0',
                    style: TextStyle(color: muted, fontSize: 10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
            color: muted,
            fontSize: 12,
            letterSpacing: 2,
            fontWeight: FontWeight.w600),
      );
}

class NeonPanel extends StatelessWidget {
  final Widget child;
  const NeonPanel({required this.child, super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: panel.withOpacity(.96),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cyan.withOpacity(.7)),
          boxShadow: [
            BoxShadow(
              color: cyan.withOpacity(.06),
              blurRadius: 18,
              spreadRadius: 1,
            )
          ],
        ),
        child: child,
      );
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: panel,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: cyan.withOpacity(.45)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: magenta, size: 29),
            const SizedBox(height: 7),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: mainText, fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 3),
            Text(subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: muted, fontSize: 10)),
          ],
        ),
      );
}

class SecurityRow extends StatelessWidget {
  final String label;
  final String status;

  const SecurityRow(this.label, this.status, {super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(label,
                style: const TextStyle(color: mainText, fontSize: 13)),
          ),
          Text(status,
              style: const TextStyle(
                  color: cyan, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      );
}
