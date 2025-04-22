import 'package:flutter/material.dart';
import 'package:project/profile_setup.dart';
import 'package:project/sign_in.dart';
import 'profile_setup.dart' show ProfileSetupPage;
class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9F6CA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Hijau + Logo
            Container(
              width: double.infinity,
              height: 360,
              color: const Color(0xFFB9F6CA),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 5),
                        Image.asset(
                          'img-project/logo.png', // Ganti sesuai path gambar logo
                          height: 210, // Logo lebih besar
                        ), 
                        const SizedBox(height: 0.10),// Jarak teks dan logo lebih rapat
                        const Text(
                          'Lively',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1B5E20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Body Form Putih Full Height
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 230,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 38),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),

                  // Email
                  const Row(
                    children: [
                      Icon(Icons.email, size: 28),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'enter your email',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Password
                  const Row(
                    children: [
                      Icon(Icons.lock, size: 28),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'enter your password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Row(
                    children: [
                      Icon(Icons.lock, size: 28),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'confirm your password',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  
                 
                  const SizedBox(height: 10),

                  // Tombol Sign In
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => const ProfileSetupPage()),
                      );
                      // Navigasi ke halaman berikutnya
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB9F6CA),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => const SignIn()),
                          );
                        },
                        child: const Text(
                          "Login now",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
