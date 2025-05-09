import 'package:flutter/material.dart';
import 'package:project/fitness/fitness_provider.dart';
import 'package:provider/provider.dart';

class SavedWorkoutPage extends StatelessWidget {
  const SavedWorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FitnessProvider>(context);
    final albums = provider.customAlbums;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Row(
          children: [
            Icon(Icons.bookmark, color: Colors.white),
            SizedBox(width: 8),
            Text('SAVED WORKOUT', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body:
          albums.isEmpty
              ? const Center(
                child: Text(
                  "Belum ada album dibuat.",
                  style: TextStyle(fontSize: 16),
                ),
              )
              : ListView(
                padding: const EdgeInsets.all(12),
                children:
                    albums.entries.map((entry) {
                      final albumName = entry.key;
                      final workouts = entry.value;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ExpansionTile(
                          title: Text(
                            albumName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children:
                              workouts.map((workout) {
                                final workoutName =
                                    workout["name"] ?? "Tanpa Nama";
                                final description =
                                    workout["description"] ??
                                    "Tidak ada deskripsi.";

                                return ListTile(
                                  leading: const Icon(Icons.fitness_center),
                                  title: Text(workoutName),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder:
                                          (_) => AlertDialog(
                                            title: Text(workoutName),
                                            content: Text(description),
                                            actions: [
                                              TextButton(
                                                onPressed:
                                                    () =>
                                                        Navigator.pop(context),
                                                child: const Text("Tutup"),
                                              ),
                                            ],
                                          ),
                                    );
                                  },
                                );
                              }).toList(),
                        ),
                      );
                    }).toList(),
              ),
    );
  }
}
