import 'package:flutter/material.dart';
import 'package:project/consultation.dart';
import 'package:provider/provider.dart';
import 'package:project/editprofile.dart';
import 'package:project/main_page.dart';
import 'package:project/notification.dart';
import 'package:project/artikel.dart';
import 'package:project/onboarding.dart'; // Pastikan ini sesuai dengan lokasi ThemeProvider kamu

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
<<<<<<< HEAD
  String username = 'Groupie';
=======
  String username = 'Groupie'; // <- gnti sini kalau mau ganti nama default nya
>>>>>>> de58742767bc03a8ff098bd422113c6ea55432d0

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
<<<<<<< HEAD
      backgroundColor: isDarkMode ? Colors.black : const Color(0xFFDFFFE1),
=======
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : const Color(0xFFDFFFE1),
>>>>>>> de58742767bc03a8ff098bd422113c6ea55432d0
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Icon(Icons.person_outline, color: Colors.blue),
          SizedBox(width: 16),
          Icon(Icons.menu, color: Colors.blue),
          SizedBox(width: 16),
        ],
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            username,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  final newUsername = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(builder: (_) => const EditProfilePage()),
                  );
                  if (newUsername != null && newUsername.isNotEmpty) {
                    setState(() {
                      username = newUsername;
                    });
                  }
                },
                icon: const Icon(Icons.edit, color: Colors.black),
                label: const Text(
                  'edit profile',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.9),
                  elevation: 0,
<<<<<<< HEAD
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
=======
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
>>>>>>> de58742767bc03a8ff098bd422113c6ea55432d0
                ),
              ),
              const SizedBox(width: 10),
              _buildMiniButton(Icons.settings, 'settings'),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) => themeProvider.toggleTheme(value),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildProfileOption(Icons.receipt, 'Save receipts'),
                _buildProfileOption(Icons.favorite_border, 'Favorites'),
                _buildProfileOption(Icons.language, 'Language'),
                _buildProfileOption(Icons.location_on_outlined, 'Location'),
                _buildProfileOption(Icons.history, 'History Activity'),
                _buildProfileOption(Icons.logout, 'Logout', onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1B5E20),
        selectedItemColor: const Color(0xFFB9F6CA),
        unselectedItemColor: Colors.white,
        currentIndex: 3,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MainMenuPage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsPage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ArticlePage()),
              );
              break;
            case 3:
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

  Widget _buildMiniButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.black),
<<<<<<< HEAD
      label: Text(label, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
=======
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
>>>>>>> de58742767bc03a8ff098bd422113c6ea55432d0
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {VoidCallback? onTap}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right),
<<<<<<< HEAD
        onTap: onTap,
=======
        onTap: () {},
>>>>>>> de58742767bc03a8ff098bd422113c6ea55432d0
      ),
    );
  }
}
