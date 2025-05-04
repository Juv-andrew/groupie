import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String selectedGender = 'Female';
  String selectedBloodType = 'O';

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
      ? Colors.black
      : const Color(0xFFDFFFE1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
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

              _buildTextField(
                controller: usernameController,
                icon: Icons.person_outline,
                label: 'Username',
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Username wajib diisi';
                  return null;
                },
              ),

              _buildTextField(
                controller: emailController,
                icon: Icons.email_outlined,
                label: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Email wajib diisi';
                  if (!value.contains('@') || !value.contains('.'))
                    return 'Format email tidak valid';
                  return null;
                },
              ),

              _buildTextField(
                controller: passwordController,
                icon: Icons.lock_outline,
                label: 'Password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Password wajib diisi';
                  if (value.length < 8) return 'Password minimal 8 karakter';
                  return null;
                },
              ),

              _buildTextField(
                controller: phoneController,
                icon: Icons.phone_outlined,
                label: 'Phone Number',
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Nomor telepon wajib diisi';
                  if (!RegExp(r'^[0-9]+$').hasMatch(value))
                    return 'Nomor telepon hanya boleh angka';
                  return null;
                },
              ),

              _buildDropdown(
                icon: Icons.female,
                label: 'Gender',
                value: selectedGender,
                items: ['Male', 'Female', 'Other'],
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),

              _buildTextField(
                controller: weightController,
                icon: Icons.monitor_weight_outlined,
                label: 'Weight (kg)',
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Berat badan wajib diisi';
                  return null;
                },
              ),

              _buildTextField(
                controller: heightController,
                icon: Icons.height_outlined,
                label: 'Height (cm)',
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Tinggi badan wajib diisi';
                  return null;
                },
              ),

              _buildDropdown(
                icon: Icons.bloodtype_outlined,
                label: 'Blood Type',
                value: selectedBloodType,
                items: ['A', 'B', 'AB', 'O'],
                onChanged: (value) {
                  setState(() {
                    selectedBloodType = value!;
                  });
                },
              ),

              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profile berhasil disimpan!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context, usernameController.text);
                  }
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
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          decoration: InputDecoration(
            icon: Icon(icon),
            labelText: label,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required IconData icon,
    required String label,
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            icon: Icon(icon),
            labelText: label,
            border: InputBorder.none,
          ),
          onChanged: onChanged,
          items: items.map((String item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
        ),
      ),
    );
  }
}