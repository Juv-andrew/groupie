import 'package:flutter/material.dart';

class FitnessProvider extends ChangeNotifier {
  final Map<String, List<Map<String, String>>> _customAlbums = {
    "Saved Workout": [], // Album default
  };

  Map<String, List<Map<String, String>>> get customAlbums => _customAlbums;

  List<Album> get albums {
    return _customAlbums.entries.map((entry) {
      return Album(name: entry.key, workouts: entry.value);
    }).toList();
  }

  /// Buat album baru
  void createAlbum(String albumName) {
    if (!_customAlbums.containsKey(albumName)) {
      _customAlbums[albumName] = [];
      notifyListeners();
    }
  }

  /// Hapus album (kecuali album default)
  void deleteAlbum(String albumName) {
    if (_customAlbums.containsKey(albumName) && albumName != "Saved Workout") {
      _customAlbums.remove(albumName);
      notifyListeners();
    }
  }

  /// Tambahkan workout ke album
void addWorkoutToAlbum(String albumName, Map<String, String> workout) {
  if (_customAlbums.containsKey(albumName)) {
    if (workout["name"] == null || workout["name"]!.isEmpty) {
      debugPrint("Workout tidak memiliki nama!");
      return;
    }
    _customAlbums[albumName]!.add(workout);
    notifyListeners();
  } else {
    debugPrint("Album '$albumName' tidak ditemukan!");
  }
}


  /// Hapus workout dari album
  void removeWorkoutFromAlbum(String albumName, Map<String, String> workout) {
    if (_customAlbums.containsKey(albumName)) {
      _customAlbums[albumName]!
          .removeWhere((w) => w["name"] == workout["name"]);
      notifyListeners();
    }
  }


  /// ✅ Ambil workout dari album tertentu
   List<Map<String, String>> getWorkoutsForAlbum(String albumName) {
    return _customAlbums[albumName] ?? [];
  }
}

/// Model Album
class Album {
  final String name;
  final List<Map<String, String>> workouts;

  Album({required this.name, required this.workouts});
}
