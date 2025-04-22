import 'package:flutter/material.dart';
import 'package:project/ProfilPage.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9F6CA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit, size: 18),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Pre-filled fields
            _buildProfileCard(
              icon: Icons.person_outline,
              title: 'Username',
              hint: '',
              initialValue: 'Groupie',
            ),
            _buildProfileCard(
              icon: Icons.email_outlined,
              title: 'Email',
              hint: '',
              initialValue: 'groupie@gmail.com',
            ),
            _buildProfileCard(
              icon: Icons.lock_outline,
              title: 'Password',
              hint: '',
              initialValue: '12345678',
              isPassword: true,
            ),
            _buildProfileCard(
              icon: Icons.phone_outlined,
              title: 'Phone Number',
              hint: '',
              initialValue: '0812 3456 7890',
            ),
            _buildProfileCard(
              icon: Icons.female,
              title: 'Gender',
              hint: '',
              initialValue: 'Female',
            ),
            _buildProfileCard(
              icon: Icons.monitor_weight_outlined,
              title: 'Weight',
              hint: '',
              initialValue: '89 kg',
            ),
            _buildProfileCard(
              icon: Icons.height_outlined,
              title: 'Height',
              hint: '',
              initialValue: '160 cm',
            ),
            _buildProfileCard(
              icon: Icons.bloodtype_outlined,
              title: 'Blood Type',
              hint: '',
              initialValue: 'O',
            ),

            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
                // Simpan data di sini
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: const Text(
                'Save Profile',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard({
    required IconData icon,
    required String title,
    required String hint,
    String initialValue = '',
    bool isPassword = false,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextFormField(
          obscureText: isPassword,
          initialValue: initialValue,
          decoration: InputDecoration(
            icon: Icon(icon),
            labelText: title,
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
