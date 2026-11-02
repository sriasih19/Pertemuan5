import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Profil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Variabel nama, sekarang tidak lagi di-hardcode di widget
  String userName = 'Sri Asih Agustina';

  // Data dummy pengalaman
  static const List<Map<String, dynamic>> _experiences = [
    {
      'title': 'Host Live TikTok Shop',
      'subtitle': 'Live jualan fashion & skincare • 2024 - Sekarang',
      'icon': Icons.live_tv,
    },
    {
      'title': 'Host Live Shopee Live',
      'subtitle': 'Host flash sale dan promo harian • 2023 - 2024',
      'icon': Icons.shopping_bag,
    },
    {
      'title': 'MC & Host Event Brand Lokal',
      'subtitle': 'Pembawa acara launching produk • 2022 - 2023',
      'icon': Icons.mic,
    },
    {
      'title': 'Content Creator Instagram Reels',
      'subtitle': 'Konten promosi & review produk • 2022 - 2023',
      'icon': Icons.camera_alt,
    },
    {
      'title': 'Talent Live Streaming Agency',
      'subtitle': 'Talent live di beberapa brand • 2021 - 2022',
      'icon': Icons.groups,
    },
    {
      'title': 'Brand Ambassador Skincare',
      'subtitle': 'Perwakilan brand di event & sosmed • 2021',
      'icon': Icons.star,
    },
  ];

  void _showNotActiveSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fitur Edit Profil belum aktif'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ProfileHeader(
            name: userName,
            role: 'Host Live',
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _showNotActiveSnackBar,
            icon: const Icon(Icons.edit, size: 18),
            label: const Text('Edit Profil'),
          ),
          const SizedBox(height: 20),
          const ProfileStats(),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Pengalaman',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _experiences.length,
              itemBuilder: (context, index) {
                final item = _experiences[index];
                return ExperienceCard(
                  title: item['title'] as String,
                  subtitle: item['subtitle'] as String,
                  icon: item['icon'] as IconData,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String name;
  final String role;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 24),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          StatItem(value: '15', label: 'Proyek'),
          StatItem(value: '1.2K', label: 'Followers'),
          StatItem(value: '42', label: 'Following'),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String value;
  final String label;

  const StatItem({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}