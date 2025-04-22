import 'package:flutter/material.dart';

class SavedWorkoutPage extends StatelessWidget {
  final List<String> savedWorkouts;

  const SavedWorkoutPage({super.key, required this.savedWorkouts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Workouts"),
        backgroundColor: Colors.redAccent,
      ),
      body: savedWorkouts.isEmpty
          ? const Center(
              child: Text(
                "Belum ada latihan yang disimpan.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: savedWorkouts.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.fitness_center, color: Colors.white),
                    ),
                    title: Text(
                      savedWorkouts[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    onTap: () {
                      // Arahkan ke halaman latihan yang sesuai jika diinginkan
                    },
                  ),
                );
              },
            ),
    );
  }
}
