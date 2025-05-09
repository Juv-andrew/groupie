import 'package:flutter/material.dart';
import 'package:project/fitness/fitness_provider.dart';
import 'package:provider/provider.dart';

class HomeWorkoutPage extends StatefulWidget {
  const HomeWorkoutPage({super.key});

  @override
  State<HomeWorkoutPage> createState() => _HomeWorkoutPageState();
}

class _HomeWorkoutPageState extends State<HomeWorkoutPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = "All";

  final List<Map<String, String>> workouts = [
    {
      "name": "Push Up",
      "image": "img-project/pushup.jpg",
      "description":
          "posisi awal dengan posisi telungkup kemudian angkat badan dengan bertumpu pada telapak tangan dan jari kaki.",
      "category": "Strength",
    },
    {
      "name": "Sit Up",
      "image": "img-project/situp.jpg",
      "description":
          "gerakan olahraga yang mengangkat badan dari posisi berbaring telentang ke posisi duduk, dengan tujuan menguatkan otot perut",
      "category": "Core",
    },

    {
      "name": "Squat",
      "image": "img-project/squat_2.jpg",
      "description":
          "posisi berdiri kemudian tekuk lutut hingga paha sejajar dengan lantai.",
      "category": "Legs",
    },
    {
      "name": "Burpee",
      "image": "img-project/burpees.jpg",
      "description": "latihan yang menggabungkan squat, push-up, dan lompatan.",
      "category": "Cardio",
    },
    {
      "name": "Plank",
      "image": "img-project/plank.jpg",
      "description":
          "mulai dari posisi push up kemudian tahan posisi tersebut selama mungkin.",
      "category": "Core",
    },
    {
      "name": "Lunges",
      "image": "img-project/lunges.jpg",
      "description":
          "mulai dari posisi berdiri kemudian langkah satu kaki kedepan dan tekuk hingga membentuk sudut 90° lakukan secara bergantian .",
      "category": "Legs",
    },
    {
      "name": "Jumping Jacks",
      "image": "img-project/jumpingjacks.jpg",
      "description":
          "posisi berdiri kemudian melompat dengan kedua kaki terbuka dan tangan diangkat ke atas.",
      "category": "Cardio",
    },
    {
      "name": "Mountain Climbers",
      "image": "img-project/mountain_climbers.jpg",
      "description":
          "mulai dari posisi plank dengan tangan lurus , kemudian kaki diangkat mendekati perut.",
      "category": "Core",
    },
    {
      "name": "Bicycle Crunches",
      "image": "img-project/bicycle_crunch.jpg",
      "description":
          "posisi awal dengan posisi terlentang kemudian angkat kedua kaki sehingga posisi kaki tegak lurus seperti mengayuh sepeda.",
      "category": "Core",
    },
    {
      "name": "High Knees",
      "image": "img-project/high_knees.jpg",
      "description":
          "posisi berdiri kemudian kaki diangkat sampe ke perut secara bergantian.",
      "category": "Cardio",
    },
    {
      "name": "leg raises",
      "image": "img-project/leg_raise.jpg",
      "description":
          "posisi awal dengan posisi terlentang kemudian angkat kedua kaki sehingga posisi kaki tegak lurus.",
      "category": "core",
    },
  ];

  final List<String> categories = ["All", "Strength", "Core", "Legs", "Cardio"];

  List<Map<String, String>> get filteredWorkouts {
    final searchQuery = _searchController.text.toLowerCase();
    return workouts.where((workout) {
      final matchesCategory =
          _selectedCategory == "All" ||
          workout["category"] == _selectedCategory;
      final matchesSearch = workout["name"]!.toLowerCase().contains(
        searchQuery,
      );
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void _showWorkoutDetail(Map<String, String> workout) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  workout["image"]!,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                workout["name"]!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                workout["description"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share),
                label: const Text("Share Exercise"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {
                  final provider = Provider.of<FitnessProvider>(
                    context,
                    listen: false,
                  );
                  final albums = provider.customAlbums.keys.toList();

                  showDialog(
                    context: context,
                    builder: (context) {
                      String? selectedAlbum;

                      return AlertDialog(
                        title: const Text("Pilih Album"),
                        content: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: "Album",
                            border: OutlineInputBorder(),
                          ),
                          items:
                              albums.map((album) {
                                return DropdownMenuItem(
                                  value: album,
                                  child: Text(album),
                                );
                              }).toList(),
                          onChanged: (value) {
                            selectedAlbum = value;
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Batal"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (selectedAlbum != null) {
                                provider.addWorkoutToAlbum(
                                  selectedAlbum!,
                                  workout,
                                );
                                Navigator.of(context).pop(); // Tutup dialog
                                Navigator.of(
                                  context,
                                ).pop(); // Tutup bottom sheet
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Disimpan ke '$selectedAlbum'",
                                    ),
                                  ),
                                );
                              }
                            },
                            child: const Text("Simpan"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.bookmark_border),
                label: const Text("Save to Album"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // 🎨 Background dark
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.home_rounded, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Home Workout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              print("Profile ditekan");
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 87, 77, 77),
      ),
      body: Container(
        color: const Color(0xFF121212), // 🎨 Background untuk
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Cari latihan...",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              onChanged: (_) {
                setState(() {});
              },
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final selected = _selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: selected,
                      onSelected: (_) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      selectedColor: const Color.fromARGB(255, 65, 223, 44),
                      backgroundColor: Colors.grey.shade700,
                      labelStyle: TextStyle(
                        color:
                            selected
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: filteredWorkouts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final workout = filteredWorkouts[index];
                  return GestureDetector(
                    onTap: () => _showWorkoutDetail(workout),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 148, 148, 148),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                workout["image"]!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              workout["name"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
