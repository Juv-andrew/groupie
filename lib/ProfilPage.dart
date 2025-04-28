// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project/artikel.dart';
import 'package:project/editprofile.dart';
import 'package:project/main_page.dart';
import 'package:project/notification.dart';
import 'package:project/onboarding.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = 'Groupie'; // <- Awalnya default Groupie

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3EDB3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          const Icon(Icons.person_outline, color: Colors.black),
          const SizedBox(width: 16),
          const Icon(Icons.menu, color: Colors.black),
          const SizedBox(width: 16),
        ],
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
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
            username, // <- Menampilkan username dinamis!
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
                    MaterialPageRoute(
                      builder: (context) => const EditProfilePage(),
                    ),
                  );

                  if (newUsername != null && newUsername.isNotEmpty) {
                    setState(() {
                      username = newUsername; // <- Update username di sini
                    });
                  }
                },
                icon: const Icon(Icons.edit, color: Colors.black),
                label: const Text(
                  'edit profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.9),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
              const SizedBox(width: 10),
              _buildMiniButton(Icons.settings, 'settings'),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildProfileOption(Icons.receipt, 'Save receipts'),
                _buildProfileOption(Icons.favorite_border, 'Favorites'),
                _buildProfileOption(Icons.language, 'Language'),
                _buildProfileOption(Icons.location_on_outlined, 'Location'),
                _buildProfileOption(Icons.history, 'History Activity'),
                _buildProfileOption(Icons.logout, 'Logout'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniButton(IconData icon, String label) {
    return ElevatedButton.icon(
      onPressed: () {
        // Aksi tambahan
      },
      icon: Icon(icon, color: Colors.black),
      label: Text(
        label,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Tambah aksi navigasi jika perlu
        },
      ),
    );
  }
}

