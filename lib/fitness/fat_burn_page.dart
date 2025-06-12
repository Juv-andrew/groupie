import 'package:flutter/material.dart';

class FatBurnPage extends StatelessWidget {
  const FatBurnPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data workout
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
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFB9F6CA),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.white, 
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            final workout = workouts[index];
            final name = workout["name"] ?? "Tanpa Nama";
            final description = workout["description"] ?? "Tidak ada deskripsi.";

            return GestureDetector(
              onTap: () {
                // Tampilkan deskripsi saat card diklik
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(name),
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
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
