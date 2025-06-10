import 'package:flutter/material.dart';

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
      "description": "Posisi awal dengan posisi telungkup kemudian angkat badan dengan bertumpu pada telapak tangan dan jari kaki.",
      "category": "Strength",
    },
    {
      "name": "Sit Up",
      "image": "img-project/situp.jpg",
      "description": "Gerakan mengangkat badan dari posisi telentang ke duduk, menguatkan otot perut.",
      "category": "Core",
    },
    {
      "name": "Squat",
      "image": "img-project/squat_2.jpg",
      "description": "Tekuk lutut hingga paha sejajar lantai dari posisi berdiri.",
      "category": "Legs",
    },
    {
      "name": "Burpee",
      "image": "img-project/burpees.jpg",
      "description": "Latihan gabungan squat, push-up, dan lompatan.",
      "category": "Cardio",
    },
    {
      "name": "Plank",
      "image": "img-project/plank.jpg",
      "description": "Tahan posisi push up selama mungkin.",
      "category": "Core",
    },
    {
      "name": "Lunges",
      "image": "img-project/lunges.jpg",
      "description": "Langkah ke depan, tekuk kaki hingga 90°, bergantian.",
      "category": "Legs",
    },
    {
      "name": "Jumping Jacks",
      "image": "img-project/jumpingjacks.jpg",
      "description": "Lompatan membuka kaki dan tangan diangkat.",
      "category": "Cardio",
    },
    {
      "name": "Mountain Climbers",
      "image": "img-project/mountain_climbers.jpg",
      "description": "Dari posisi plank, kaki diangkat mendekati perut.",
      "category": "Core",
    },
    {
      "name": "Bicycle Crunches",
      "image": "img-project/bicycle_crunch.jpg",
      "description": "Telentang lalu gerakan kaki seperti mengayuh sepeda.",
      "category": "Core",
    },
    {
      "name": "High Knees",
      "image": "img-project/high_knees.jpg",
      "description": "Angkat kaki tinggi secara bergantian dari posisi berdiri.",
      "category": "Cardio",
    },
    {
      "name": "Leg Raises",
      "image": "img-project/leg_raise.jpg",
      "description": "Telentang, angkat kedua kaki lurus ke atas.",
      "category": "Core",
    },
  ];

  final List<String> categories = ["All", "Strength", "Core", "Legs", "Cardio"];

  List<Map<String, String>> get filteredWorkouts {
    final searchQuery = _searchController.text.toLowerCase();
    return workouts.where((workout) {
      final matchesCategory = _selectedCategory == "All" || workout["category"] == _selectedCategory;
      final matchesSearch = workout["name"]!.toLowerCase().contains(searchQuery);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void _showWorkoutDetail(Map<String, String> workout) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                workout["description"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          'Home Workout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFB9F6CA),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("img-project/bg-dark.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Cari latihan...",
                  prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0)),
                  hintStyle: const TextStyle(color: Color.fromARGB(137, 65, 61, 61)),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                onChanged: (_) => setState(() {}),
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
                        selectedColor: Colors.green,
                        backgroundColor: const Color.fromARGB(255, 97, 97, 97),
                        labelStyle: TextStyle(
                          color: selected ? Colors.white : Colors.white70,
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
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final workout = filteredWorkouts[index];
                    return GestureDetector(
                      onTap: () => _showWorkoutDetail(workout),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFB9F6CA),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 6,
                              offset: const Offset(2, 2),
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
                                  color: Colors.white,
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
      ),
    );
  }
}
