import 'package:flutter/material.dart';
import 'package:project/main_page.dart';
// import 'package:project/notification.dart';
import 'package:project/artikel.dart';
import 'package:project/ProfilPage.dart';
import 'package:project/mental_health/ADHDTestPage.dart';
import 'package:project/mental_health/AddictionTestPage.dart';
import 'package:project/mental_health/AnxietyTestPage.dart';
import 'package:project/mental_health/BipolarTestPage.dart';
import 'package:project/mental_health/DepressionTestPage.dart';
import 'package:project/mental_health/PTSDTestPage.dart';
import 'package:project/notification.dart';

class SelfCarePage extends StatelessWidget {
  const SelfCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA7ECEE),
      appBar: AppBar(
        title: const Text(
          'Self-Care',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFA7ECEE),
        elevation: 0,
        leading: Tooltip(
          message: 'Kembali ke halaman sebelumnya',
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children:  [
          MenuItem(
            title: 'Depression Test',
            tooltip:
                'Tes ini membantu menilai gejala depresi dan tingkat keparahannya.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DepressionTestPage()),
              );
            },
          ),

          MenuItem(
            title: 'Anxiety Test',
            tooltip:
                'Tes ini dirancang untuk mengevaluasi tingkat kecemasan yang Anda alami.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnxietyTestPage()),
              );
            },
          ),
          MenuItem(
            title: 'Bipolar Test',
            tooltip:
                'Tes ini mendeteksi gejala gangguan bipolar, termasuk episode mania dan depresi.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BipolarTestPage()),
              );
            },
          ),
          MenuItem(
            title: 'PTSD Test',
            tooltip:
                'Tes ini membantu mengenali tanda-tanda gangguan stres pasca trauma.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PTSDTestPage()),
              );
            },
          ),
          MenuItem(
            title: 'Addiction Test',
            tooltip:
                'Tes ini mengidentifikasi potensi kecanduan terhadap zat atau perilaku tertentu.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddictionTestPage()),
              );
            },
          ),
          MenuItem(
            title: 'ADHD Test',
            tooltip:
                'Tes ini membantu mengevaluasi kemungkinan Attention Deficit Hyperactivity Disorder.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ADHDTestPage()),
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1B5E20),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainMenuPage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsPage(),
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ArticlePage()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Tooltip(message: 'Beranda', child: Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(message: 'Notifikasi', child: Icon(Icons.mail)),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Artikel Kesehatan',
              child: Icon(Icons.article),
            ),
            label: 'Article',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Profil Pengguna',
              child: Icon(Icons.person),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final String tooltip;
  final VoidCallback? onTap;
  const MenuItem({
    super.key,
    required this.title,
    required this.tooltip,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      padding: const EdgeInsets.all(12),
      textStyle: const TextStyle(color: Colors.white),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
      ),
    );
  }
}
