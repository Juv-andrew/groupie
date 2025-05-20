import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/fitness/fitness_provider.dart';

class FatBurnPage extends StatelessWidget {
  const FatBurnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FitnessProvider>(context);

    // Contoh data workout
    final List<Map<String, String>> workouts = [
      {
        "name": "Jumping Jacks",
        "description": "Latihan kardio untuk pemanasan dan membakar kalori."
      },
      {
        "name": "Mountain Climbers",
        "description": "Latihan intensitas tinggi untuk membakar lemak perut."
      },
      {
        "name": "Burpees",
        "description": "Latihan seluruh tubuh untuk meningkatkan daya tahan."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fat Burn Workout',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          final name = workout["name"] ?? "Tanpa Nama";
          final description = workout["description"] ?? "Tidak ada deskripsi.";

          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(description),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.save_alt),
                        label: const Text("Save"),
                        onPressed: () {
                          _showSaveDialog(context, name, description);
                        },
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.share),
                        label: const Text("Share"),
                        onPressed: () {
                          // Implementasi fungsi share sesuai kebutuhan
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSaveDialog(
      BuildContext context, String name, String description) {
    final provider = Provider.of<FitnessProvider>(context, listen: false);
    String selectedAlbum = provider.customAlbums.keys.first;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Simpan ke Album"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Simpan workout: $name"),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: selectedAlbum,
                onChanged: (value) {
                  if (value != null) {
                    selectedAlbum = value;
                  }
                },
                items: provider.customAlbums.keys
                    .map((album) => DropdownMenuItem(
                          value: album,
                          child: Text(album),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text("Simpan"),
            onPressed: () {
              provider.addWorkoutToAlbum(selectedAlbum, {
                "name": name,
                "description": description,
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
