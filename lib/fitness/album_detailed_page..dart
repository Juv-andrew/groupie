import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  final String albumName;
  final List<Map<String, String>> workouts;

  const AlbumDetailPage({
    super.key,
    required this.albumName,
    required this.workouts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(albumName, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: workouts.isEmpty
          ? const Center(
              child: Text(
                "Belum ada workout di album ini.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                final workout = workouts[index];
                final workoutName = workout["name"] ?? "Tanpa Nama";
                final description = workout["description"] ?? "Tidak ada deskripsi.";

                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.fitness_center),
                    title: Text(workoutName),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(workoutName),
                          content: Text(description),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Tutup"),
                            ),
                          ],
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
