// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DoctorDetailPage extends StatelessWidget {
  final Map<String, String> doctor;

  const DoctorDetailPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  width: double.infinity,
                  color: Colors.green[100],
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(doctor['image']!),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Dr. ${doctor['name']!}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${doctor['specialist']} • ${doctor['hospital']}",
                        style: TextStyle(color: Colors.green[900]),
                      ),
                      const SizedBox(height: 6),
                      const Icon(Icons.location_on_outlined,
                          size: 16, color: Colors.grey),
                      const Text("Medan, Indonesia",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                infoCard("PATIENTS", "380+"),
                infoCard("Experience", "4 Yrs."),
                infoCard("Rating", "4.5"),
              ],
            ),
            section("Tentang Dokter",
                "Dokter berpengalaman dalam bidang ${doctor['specialist']}. Ramah, komunikatif, dan terpercaya."),
            section("Jam Praktik", "Senin – Jumat: 07.00 – 16.30"),
            section("Ulasan", "⭐⭐⭐⭐☆ 4.5 (150+ reviews)"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: const Text(
                  "Book an Appointment",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoCard(String title, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(color: Colors.green[900])),
        ],
      ),
    );
  }

  Widget section(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
          const SizedBox(height: 6),
          Text(content,
              style:
                  TextStyle(color: Colors.green[900], fontSize: 14)),
        ],
      ),
    );
  }
}
