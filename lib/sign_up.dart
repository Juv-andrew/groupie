import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  Future<void> _handleSignUp() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showSnackbar("Semua field harus diisi!");
      return;
    }

    if (!isEmailValid(email)) {
      _showSnackbar("Format email tidak valid!");
      return;
    }

    if (password != confirmPassword) {
      _showSnackbar("Password dan konfirmasi tidak cocok!");
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('name', name);

    _showSnackbar("Pendaftaran berhasil!");

    // Menunggu 2 detik untuk memberikan waktu kepada pengguna untuk membaca pesan
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {  // Pastikan widget masih terpasang
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignIn()),
        );
      }
    });
  }

  void _showSnackbar(String message) {
    if (mounted) {  // Pastikan widget masih terpasang
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
        ),
      );
    }
  }

  Widget _buildInput(String hint, TextEditingController controller, {bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9F6CA),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildInput("Name", nameController),
                const SizedBox(height: 12),
                _buildInput("Email", emailController),
                const SizedBox(height: 12),
                _buildInput("Password", passwordController, obscure: true),
                const SizedBox(height: 12),
                _buildInput("Confirm Password", confirmPasswordController, obscure: true),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _handleSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C853),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: const Text("SIGN UP"),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignIn()));
                  },
                  child: const Text("Sudah punya akun? Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}