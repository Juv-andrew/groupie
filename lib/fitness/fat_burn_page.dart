import 'dart:async';
import 'package:flutter/material.dart';

class fat_burn_page extends StatefulWidget { //Karena UI perlu diperbarui setiap detik (untuk timer dan kalori), kita pakai StatefulWidget
  const fat_burn_page({super.key});

  @override
  State<fat_burn_page> createState() => _fat_burn_pageState();
}

class _fat_burn_pageState extends State<fat_burn_page> {
  String searchQuery = '';
  double totalCalories = 0;

  final List<Map<String, dynamic>> homeworkoutlist = [
    {
      'name': 'Jogging',
      'desc': 'Lari santai di tempat selama 15 menit.',
      'image': 'img-project/jogging.jpg',
      'duration': 900, // detik
      'calories': 120.5,
    },
    {
      'name': 'High Knees',
      'desc': 'Lari di tempat dengan lutut diangkat tinggi.',
      'image': 'img-project/high_knees.jpg',
      'duration': 60,
      'calories': 30.5,
    },
    {
      'name': 'incline treadmill',
      'desc': 'Berjalan di treadmill dengan kemiringan 10% selama 15 menit.',
      'image': 'img-project/incline.jpg',
      'duration': 900,
      'calories': 120.5,
    },
    {
      'name': "Tuck Jumps",
      "desc": "Lompat tinggi sambil menarik lutut ke arah dada.",
      "image": "img-project/tuck_jump.jpg",
      "duration": 60,
      "calories": 50.0,
    },
    {
      'name': "rope jumping",
      "desc": "Lompat tali selama 15 menit.",
      "image": "img-project/skipping.jpg",
      "duration": 900,
      "calories": 120.5,
    },
  ];

  List<Map<String, dynamic>> get filteredList {
    return homeworkoutlist.where((pose) {
      final matchSearch =
          pose['name'].toLowerCase().contains(searchQuery.toLowerCase());
      return matchSearch;
    }).toList();
  }

  int? selectedIndex;
  int secondsLeft = 0;
  bool isRunning = false;
  bool isPaused = false;
  Timer? timer;

  void startTimer(int index) {
    if (selectedIndex != index) {
      timer?.cancel();
      secondsLeft = filteredList[index]['duration'];
    }

    selectedIndex = index;
    isRunning = true;
    isPaused = false;

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        if (secondsLeft > 0) {
          secondsLeft--;
        } else {
          t.cancel();
          isRunning = false;
          totalCalories += (filteredList[selectedIndex!]['calories'] as num).toDouble();
        }
      });
    });

    setState(() {});
  }

  void pauseTimer() {
    timer?.cancel();
    isPaused = true;
    isRunning = false;
    setState(() {});
  }

  void stopTimer() {
    timer?.cancel();
    if (selectedIndex != null) {
      secondsLeft = filteredList[selectedIndex!]['duration'];
    }
    isRunning = false;
    isPaused = false;
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.local_fire_department, color: Color.fromARGB(255, 0, 0, 0)),
            SizedBox(width: 8),
            Text(
              'Fat Burn Workout',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              print("Profile ditekan");
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('img-project/cardio_bg.jpg', fit: BoxFit.cover),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari nama latihan ...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.local_fire_department, color: Colors.red),
                    const SizedBox(width: 8),
                    Text(
                      "Kalori terbakar: $totalCalories kal",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    final isSelected = selectedIndex == index;

                    return Card(
                      margin: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.asset(
                              item['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: const Color.fromARGB(255, 165, 165, 165),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item['desc'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.timer, color: Color.fromARGB(255, 0, 0, 0)),
                                    const SizedBox(width: 4),
                                    Text(
                                      "${(item['duration'] / 60).floor()} min",
                                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                                    ),
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () => startTimer(index),
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                                      child: const Text("Start", style: TextStyle(color: Colors.black)),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: isRunning ? pauseTimer : null,
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                                      child: const Text("Pause", style: TextStyle(color: Colors.black)),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: (isRunning || isPaused) ? stopTimer : null,
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                                      child: const Text("Stop", style: TextStyle(color: Colors.black)),
                                    ),
                                  ],
                                ),
                                if (isSelected && (isRunning || isPaused)) ...[
                                  const SizedBox(height: 8),
                                  Text(
                                    "Sisa waktu: $secondsLeft detik",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
