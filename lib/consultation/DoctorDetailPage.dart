// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project/notification_data.dart';
import 'package:project/notification_helper.dart';

class DoctorDetailPage extends StatefulWidget {
  final Map<String, String> doctor;
  const DoctorDetailPage({super.key, required this.doctor});
  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 231, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 280,
                  width: double.infinity,
                  color: const Color(0xff0D273D),
                ),
                Positioned(
                  top: 50,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(widget.doctor['image']!),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Dr. ${widget.doctor['name']!}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "${widget.doctor['specialist']} • ${widget.doctor['hospital']}",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: Colors.white,
                          ),
                          SizedBox(width: 4), // Jarak antara ikon dan teks
                          Text(
                            "Medan, Indonesia",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Informasi Ringkas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                infoCard("PATIENTS", "380+"),
                infoCard("Experience", "4 Yrs."),
                infoCard("Rating", "4.5"),
              ],
            ),

            const SizedBox(height: 16),

            // Tentang Dokter
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(thickness: 1),
                  const SizedBox(height: 12), // Jarak sebelum bagian pertama
                  section(
                    "Tentang Dokter",
                    "Dokter berpengalaman dalam bidang ${widget.doctor['specialist']}. Ramah, komunikatif, dan terpercaya.",
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 1),
                  const SizedBox(height: 12),
                  section("Jam Praktik", "Senin – Jumat: 07.00 – 16.30"),
                  const SizedBox(height: 16),
                  const Divider(thickness: 1),
                  const SizedBox(height: 12),
                  section("Ulasan", "⭐⭐⭐⭐☆ 4.5 (150+ reviews)"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tombol Booking
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0D273D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    builder: (context) {
                      String selectedDay = '';
                      return StatefulBuilder(
                        builder: (context, setModalState) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    width: 40,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffCDD7DF),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Center(
                                  child: Text(
                                    "Konfirmasi Jadwal",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff0D273D),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Nama Dokter: Dr. ${widget.doctor['name']}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Spesialis: ${widget.doctor['specialist']}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Rumah Sakit: ${widget.doctor['hospital']}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "Pilih Hari:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 8,
                                  children:
                                      [
                                            'Senin',
                                            'Selasa',
                                            'Rabu',
                                            'Kamis',
                                            'Jumat',
                                          ]
                                          .map(
                                            (day) => ChoiceChip(
                                              label: Text(day),
                                              selected: selectedDay == day,
                                              selectedColor: const Color(
                                                0xffA6BED1,
                                              ),
                                              onSelected: (selected) {
                                                setModalState(() {
                                                  selectedDay =
                                                      selected ? day : '';
                                                });
                                              },
                                            ),
                                          )
                                          .toList(),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff0D273D),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    minimumSize: const Size(
                                      double.infinity,
                                      50,
                                    ),
                                  ),
                                  onPressed:
                                      selectedDay.isNotEmpty
                                          ? () {
                                            Navigator.pop(context);

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Jadwal pada hari $selectedDay berhasil dikonfirmasi!',
                                                  style: const TextStyle(
                                                    color: Color(0XFF031716),
                                                  ),
                                                ),
                                                backgroundColor: const Color(
                                                  0xffCDD7DF),
                                              ),
                                            );

                                            // Tambahkan notifikasi ke daftar
                                            customNotifications.insert(0, {
                                              'emoji': '💬',
                                              'title': 'Booking Berhasil',
                                              'time': 'Baru saja',
                                              'description':
                                                  'Jadwal dengan Dr. ${widget.doctor['name']} telah dikonfirmasi untuk hari $selectedDay.',
                                              'action1': 'Lihat',
                                            });

                                            Future.delayed(
                                              const Duration(seconds: 8),
                                              () {
                                                showCustomNotification(
                                                  title: "Pesan Baru",
                                                  message:
                                                      "Jadwal konsultasi kamu telah dikonfirmasi.",
                                                );
                                              },
                                            );
                                          }
                                          : null,

                                  child: const Text(
                                    "Konfirmasi Jadwal",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
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
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(color: const Color(0xff0D273D))),
        ],
      ),
    );
  }

  Widget section(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          content,
          style: const TextStyle(color: Color(0xff0D273D), fontSize: 14),
        ),
      ],
    );
  }
}
