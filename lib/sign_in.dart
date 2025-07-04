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
    String? savedUsername = prefs.getString('name')?.trim();
    String? savedPassword = prefs.getString('password');
    String? savedName = prefs.getString('name');

    String inputEmail = _emailController.text.trim();
    String inputPassword = _passwordController.text;

    if (inputEmail.isEmpty || inputPassword.isEmpty) {
      _showSnackbar("Mohon isi semua field");
      return;
    }

    if ((inputEmail == savedEmail || inputEmail == savedName) &&
        inputPassword == savedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ProfilePage()),
      );
    } else {
      _showSnackbar("Email/Username atau password salah");
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xff0D273D),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool obscure = false,
    TextInputAction inputAction = TextInputAction.next,
    void Function(String)? onSubmitted,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      textInputAction: inputAction,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        filled: true,
        fillColor: Colors.white,
        border: const UnderlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc1e8ff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top part with icon and title
            Container(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  Image.asset(
                    'img-project/logo.png', // Path to your image
                    width: 300, // Adjust the size as needed
                    height: 300, // Adjust the size as needed
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),

            // Main content with input fields and button
            Container(
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
                    hint: "enter your email or username",
                    icon: Icons.email,
                    controller: _emailController,
                    inputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    hint: "enter your password",
                    icon: Icons.lock,
                    controller: _passwordController,
                    obscure: true,
                    inputAction: TextInputAction.done,
                    onSubmitted: (_) => _handleSignIn(),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Tambahkan fungsi lupa password di sini
                      },
                      child: const Text(
                        "Forget password?",
                        style: TextStyle(color: const Color(0XFF031716)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _handleSignIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 202, 231, 255),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 16,
                      ),
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
                            color: const Color(0XFF031716),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
