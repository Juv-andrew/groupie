import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/ProfilPage.dart';
import 'package:project/artikel.dart';
import 'package:project/consultation/consultation.dart';
import 'package:project/fitness.dart';
import 'package:project/health_food/healthy_food.dart';
import 'package:project/mental_health/self_awareness_page.dart';
import 'notification.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  String userName = 'Guest';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? 'Guest';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : const Color(0xFFDFFFE1),

      // ✅ Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFFB9F6CA)),
              child: Row(
                children: [
                  const Icon(Icons.account_circle, size: 48, color: Colors.black),
                  const SizedBox(width: 12),
                  Text(
                    userName,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.mail),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfilePage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
              },
            ),
          ],
        ),
      ),

      // ✅ AppBar dengan hamburger
      appBar: AppBar(
        backgroundColor: const Color(0xFFB9F6CA),
        elevation: 0,
        title: const Text(
          "Main Menu",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      // ✅ Konten Menu Card
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildMenuCard('Fitness', 'img-project/fitness.jpeg', onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => FitnessHomePage()));
              }),
              _buildMenuCard('Healthy Food', 'img-project/healthy food.jpeg', onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const FoodMenuPage()));
              }),
              _buildMenuCard('Mental Health', 'img-project/mental health.jpeg', onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SelfAwarenessPage()));
              }),
              _buildMenuCard('Consultation', 'img-project/consultation-1.jpeg', onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => KonsultasiPage()));
              }),
            ],
          ),
        ),
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1B5E20),
        selectedItemColor: const Color(0xFFB9F6CA),
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainMenuPage()));
              break;
            case 1:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const NotificationsPage()));
              break;
            case 2:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ArticlePage()));
              break;
            case 3:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
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

  // ✅ Menu Card Builder
  Widget _buildMenuCard(String title, String imagePath, {VoidCallback? onTap}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [Shadow(blurRadius: 6, color: Colors.black)],
                ),
              ),
              const Positioned(
                right: 12,
                top: 12,
                child: Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
