import 'package:flutter/material.dart';
import 'package:project/main_page.dart';
// import 'package:project/notification.dart';
import 'package:project/artikel.dart';
import 'package:project/ProfilPage.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          MenuItem(title: 'Depression Test'),
          MenuItem(title: 'Anxiety Test'),
          MenuItem(title: 'Bipolar Test'),
          MenuItem(title: 'PTSD Test'),
          MenuItem(title: 'Addiction Test'),
          MenuItem(title: 'ADHD Test'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1B5E20),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0, // Sesuaikan ini jika kamu ingin aktifkan tab lain
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Article'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;

  const MenuItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigasi ke halaman tes tertentu dapat ditambahkan di sini.
        },
      ),
    );
  }
}
