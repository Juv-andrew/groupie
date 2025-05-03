import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ProfilPage.dart';
import 'sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _handleSignIn() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email')?.trim();
    String? savedPassword = prefs.getString('password');
    String? savedName = prefs.getString('name');

    String inputEmail = _emailController.text.trim();
    String inputPassword = _passwordController.text;

    if (inputEmail.isEmpty || inputPassword.isEmpty) {
      _showSnackbar("Mohon isi semua field");
      return;
    }

    if (inputEmail == savedEmail && inputPassword == savedPassword) {
      prefs.setString('name', savedName ?? 'User');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ProfilePage()),
      );
    } else {
      _showSnackbar("Email atau password salah");
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildTextField(
      {required String hint,
      required IconData icon,
      required TextEditingController controller,
      bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        filled: true,
        fillColor: Colors.white,
        border: const UnderlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9F6CA),
      body: Stack(
        children: [
          // Top part with icon and title
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Replace Icon with Image
                Image.asset(
                  'img-project/logo.png', // Path to your image
                  width: 200,  // Adjust the size as needed
                  height: 200, // Adjust the size as needed
                ),
                const SizedBox(height: 12),
                const Text(
                  'Lively',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // Main content with input fields and button
          Positioned(
            top: 350,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  _buildTextField(
                      hint: "enter your email",
                      icon: Icons.email,
                      controller: _emailController),
                  const SizedBox(height: 16),
                  _buildTextField(
                      hint: "enter your password",
                      icon: Icons.lock,
                      controller: _passwordController,
                      obscure: true),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Tambahkan fungsi lupa password di sini
                      },
                      child: const Text(
                        "Forget password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _handleSignIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB9F6CA),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    child: const Text("SIGN IN"),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("no account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const SignUp()),
                          );
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
