import 'package:flutter/material.dart';
import 'package:project/main_page.dart';

class ProfileSetupPage extends StatelessWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc1e8ff),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              const Text(
                'Welcome new user!\nPlease set up your profile!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: Color(0xff0D273D),
                ),
              ),
              const SizedBox(height: 30),
              _buildInput(Icons.person, 'username'),
              _buildInput(Icons.calendar_today, 'date of birth'),
              _buildInput(Icons.accessibility, 'age'),
              _buildInput(Icons.transgender, 'gender'),
              _buildInput(Icons.monitor_weight, 'weight'),
              _buildInput(Icons.height, 'height'),
              _buildInput(Icons.bloodtype, 'blood type'),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MainMenuPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.black),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff0D273D),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black, size: 30),
          title: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: label,
              border: InputBorder.none,
              hintStyle: const TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
