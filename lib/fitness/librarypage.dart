import 'package:flutter/material.dart';
import 'package:project/fitness.dart';
import 'package:project/fitness/album_detailed_page..dart';
import 'package:project/fitness/fitness_provider.dart';
import 'package:project/fitness/saved_workout_page.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FitnessProvider>(context);
    final albums = provider.albums;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 8),
            Text('LIBRARY', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const FitnessApp()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
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
                  MaterialPageRoute(builder: (_) => const SavedWorkoutPage()),
                );
              },
            ),
            const SizedBox(height: 24),
            ...albums.map(
              (album) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                    elevation: 3,
                  shadowColor: Colors.black54,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => AlbumDetailPage(
                              albumName: album.name,
                              workouts: provider.getWorkoutsForAlbum(
                                album.name,
                              ),
                            ),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          album.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                          onPressed: () {
                            provider.deleteAlbum(album.name);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateAlbumDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateAlbumDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Create New Album"),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: "Album name"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  final name = controller.text.trim();
                  if (name.isNotEmpty) {
                    Provider.of<FitnessProvider>(
                      context,
                      listen: false,
                    ).createAlbum(name);
                  }
                  Navigator.pop(context);
                },
                child: const Text("Create"),
              ),
            ],
          ),
    );
  }
}
