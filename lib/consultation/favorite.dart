import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'DoctorDetailPage.dart';
import '../provider/favorite_provider.dart';


class FavoriteDoctorsPage extends StatelessWidget {
  const FavoriteDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteDoctors = Provider.of<FavoriteProvider>(context).favoriteDoctors;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Doctors"),
        backgroundColor: Colors.green[700],
      ),
      backgroundColor: const Color(0xFFDFFFE1),
      body: favoriteDoctors.isEmpty
          ? const Center(child: Text("Belum ada dokter yang disukai."))
          : ListView.builder(
              itemCount: favoriteDoctors.length,
              itemBuilder: (context, index) {
                final doctor = favoriteDoctors[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(doctor['image']!),
                      radius: 30,
                    ),
                    title: Text(doctor['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(doctor['specialist']!),
                        Row(
                          children: [
                            const Icon(Icons.location_pin, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(doctor['hospital']!),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DoctorDetailPage(doctor: doctor),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
