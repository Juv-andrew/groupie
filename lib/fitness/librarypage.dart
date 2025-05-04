import 'package:flutter/material.dart';
import 'package:project/fitness/saved_workout_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.menu, color: Colors.white), // Ganti ikon jadi garis-garis
            SizedBox(width: 8),
            Text('LIBRARY', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topLeft, // Tombol di kiri atas
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.bookmark, color: Colors.white),
            label: const Text(
              'Saved Workout',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      SavedWorkoutPage(savedWorkouts: ['Fat Burn', 'Yoga']),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
