import 'package:flutter/material.dart';

class home_workout_page extends StatefulWidget {
  const home_workout_page({super.key});

  @override
  State<home_workout_page> createState() => _home_workout_pageState();
}

class _home_workout_pageState extends State<home_workout_page> {
  String searchQuery = '';
  String selectedCategory = 'All';

  final List<Map<String, String>> homeworkoutlist = [
    {
      'name': 'mountain climber',
      'desc': 'mulai posisi plank dengan tangan lurus, lalu angkat lutut ke arah dada secara bergantian.',
      'image': 'img-project/mountain_climbers.jpg',
      'category': 'Abs',
    },
    {
      'name': 'push up',
      'desc': 'mulai posisi plank dengan tangan lurus, lalu turunkan tubuh ke bawah dengan menekuk siku.',
      'image': 'img-project/pushup.jpg',
      'category': 'chest',
    },
    {
      'name': 'squat',
      'desc': 'mulai dari posisi berdiri, lalu turunkan tubuh ke bawah dengan menekuk lutut.',
      'image': 'img-project/squat_2.jpg',
      'category': 'legs',
    },
    {
      'name': 'plank',
      'desc': 'badan dalam posisi lurus seperti papan, dengan tangan dan kaki sebagai tumpuan, perut di tekan ke dalamza.',
      'image': 'img-project/plank.jpg',
      'category': 'Abs',
    },
    {
      'name': 'burpee',
      'desc': 'burpee adalah latihan yang menggabungkan squat, push-up, dan lompatan.',
      'image': 'img-project/burpees.jpg',
      'category': 'shoulder',
    },
    {
      'name': 'lunge',
      'desc': 'berdiri tegak, lalu langkah satu kaki ke depan dan turunkan tubuh hingga lutut hampir menyentuh lantai, kemudian kembali ke posisi awal.',
      'image': 'img-project/lunge.jpg',
      'category': 'legs',
    },
    {
      'name': 'tricep dip',
      'desc': 'dari posisi duduk, letakkan tangan di belakang tubuh dan turunkan tubuh ke bawah dengan menekuk siku.',
      'image': 'img-project/tricepsdip.jpg',
      'category': 'shoulder',
    },
    {
      'name': 'leg raise',
      'desc': 'berbaring telentang, angkat kaki lurus ke atas, lalu turunkan kembali tanpa menyentuh lantai.',
      'image': 'img-project/leg_raise.jpg',
      'category': 'Abs',
    },
    {
      'name': 'bicycle crunch',
      'desc': 'mulai dari posisi berbaring telentang, angkat kaki dan lutut ke arah dada, lalu putar tubuh ke samping sambil menggerakkan kaki seperti mengayuh sepeda.',
      'image': 'img-project/bicycle_crunch.jpg',
      'category': 'Abs',
    },
    {
      'name': 'shoulder taps',
      'desc': 'mulai dari posisi plank, angkat satu tangan untuk menyentuh bahu yang berlawanan, lalu ganti tangan.', 
      'image': 'img-project/shoulder_tap.jpg',
      'category': 'shoulder',
    },
    {
      'name': 'superman',
      'desc': 'berbaring telentang, angkat tangan dan kaki secara bersamaan, lalu turunkan kembali.',
      'image': 'img-project/superman.jpg',
      'category': 'back',
    }
  ];

  final List<String> categories = [
    'All',
    'Abs',
    'chest',
    'shoulder',
    'back',
    'legs',
  ];

  List<Map<String, String>> get filteredList {
    return homeworkoutlist.where((pose) {
      final matchCategory =
          selectedCategory == 'All' || pose['category'] == selectedCategory;
      final matchSearch = pose['name']!.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return matchCategory && matchSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.home, // icon yoga bawaan Flutter
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            const Text(
              'Home Workout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 0, 206, 110),
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
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('img-project/homeworkout_bg.png', fit: BoxFit.cover),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'cari nama latihan ...',
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children:
                      categories.map((category) {
                        final isSelected = category == selectedCategory;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ChoiceChip(
                            label: Text(category),
                            selected: isSelected,
                            onSelected: (_) {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            selectedColor: const Color.fromARGB(255, 16, 179, 57),
                            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                            labelStyle: TextStyle(
                              color:
                                  isSelected
                                      ? Colors.white
                                      : const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
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
                              item['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: const Color.fromARGB(238, 255, 255, 255),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name']!,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item['desc']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
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
