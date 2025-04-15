import 'package:flutter/material.dart';

class weight_training_page extends StatefulWidget {
  const weight_training_page({super.key});

  @override
  State<weight_training_page> createState() => _weight_training_pageState();
}

class _weight_training_pageState extends State<weight_training_page> {
  String searchQuery = '';
  String selectedCategory = 'All';

  final List<Map<String, String>> weighttraininglist = [
    {
      'name': 'bench press',
      'image': 'resource2/benchpress.jpg',
      'desc':
          'tempatkan tangan di bench press selebar bahu , angkat beban ke atas hingga lengan lurus, turunkan beban hingga mendekati dada, angkat kembali ke posisi awal',
      'category': 'chest',
    },
    {
      'name': 'squat',
      'image': 'resource2/squat.jpg',
      'desc':
          'berdiri tegak dengan kaki selebar bahu, turunkan tubuh seperti duduk di kursi, pastikan lutut tidak melewati jari kaki, angkat kembali ke posisi awal',
      'category': 'legs',
    },
    {
      'name': 'deadlift',
      'image': 'resource2/deadlift.jpg',
      'desc':
          'berdiri dengan kaki selebar bahu, pegang barbell dengan kedua tangan, angkat barbell hingga tubuh tegak, turunkan kembali ke posisi awal',
      'category': 'back',
    },
    {
      'name': 'shoulder press',
      'image': 'resource2/shoulder_press.jpg',
      'desc':
          'duduk di bangku dengan punggung tegak, pegang dumbbell di kedua tangan, angkat dumbbell ke atas hingga lengan lurus, turunkan kembali ke posisi awal',
      'category': 'shoulder',
    },
    {
      'name': 'bicep curl',
      'image': 'resource2/bicepcurl.jpg',
      'desc':
          'berdiri tegak dengan dumbbell di kedua tangan, angkat dumbbell ke arah bahu, turunkan kembali ke posisi awal',
      'category': 'biceps',
    },
    {
      'name': 'tricep dip',
      'image': 'resource2/tricepsdip.jpg',
      'desc':
          'duduk di bangku dengan tangan di samping tubuh, turunkan tubuh hingga siku membentuk sudut 90 derajat, angkat kembali ke posisi awal',
      'category': 'tricep',
    },
    {
      'name': 'leg press',
      'image': 'resource2/legpress.jpg',
      'desc':
          'duduk di mesin leg press dengan punggung tegak, letakkan kaki di platform, dorong platform hingga kaki lurus, turunkan kembali ke posisi awal',
      'category': 'legs',
    },
    {
      'name': 'lat pulldown',
      'image': 'resource2/latpulldown.jpg',
      'desc':
          'duduk di mesin lat pulldown dengan punggung tegak, pegang bar dengan kedua tangan, tarik bar ke arah dada, kembalikan ke posisi awal',
      'category': 'back',
    },
    {
      'name': 'dumbbell fly',
      'image': 'resource2/dumbbellfly.jpg',
      'desc':
          'berbaring di bangku datar dengan dumbbell di kedua tangan, buka lengan ke samping hingga membentuk sudut 90 derajat, angkat kembali ke posisi awal',
      'category': 'chest',
    },
    {
      'name': 'lateral raise',
      'image': 'resource2/lateralraise.jpg',
      'desc':
          'berdiri tegak dengan dumbbell di kedua tangan, angkat dumbbell ke samping hingga sejajar bahu, turunkan kembali ke posisi awal',
      'category': 'shoulder',
    },
    {
      'name': 'leg curl',
      'image': 'resource2/legcurl.jpg',
      'desc':
          'duduk di mesin leg curl dengan punggung tegak, letakkan kaki di platform, dorong platform hingga kaki lurus, turunkan kembali ke posisi awal',
      'category': 'legs',
    },
    {
      'name': 'tricep extension',
      'image': 'resource2/tricepextension.jpg',
      'desc':
          'berdiri tegak dengan dumbbell di kedua tangan, angkat dumbbell ke atas kepala, turunkan dumbbell ke belakang kepala, angkat kembali ke posisi awal',
      'category': 'tricep',
    },
    {
      'name': 'dumbbell row',
      'image': 'resource2/dumbbellrow.jpg',
      'desc':
          'berdiri tegak dengan dumbbell di satu tangan, tekuk tubuh ke depan, tarik dumbbell ke arah dada, turunkan kembali ke posisi awal',
      'category': 'back',
    },
    {
      'name': 'calf raise',
      'image': 'resource2/calfraise.jpg',
      'desc':
          'berdiri tegak dengan kaki selebar bahu, angkat tumit hingga berdiri di atas jari kaki, turunkan kembali ke posisi awal',
      'category': 'legs',
    },
    {
      'name': 'dumbbell shoulder press',
      'image': 'resource2/dumbbellshoulderpress.jpg',
      'desc':
          'duduk di bangku dengan punggung tegak, pegang dumbbell di kedua tangan, angkat dumbbell ke atas hingga lengan lurus, turunkan kembali ke posisi awal',
      'category': 'shoulder',
    },
    {
      'name': 'dumbbell tricep kickback',
      'image': 'resource2/dumbbelltricepkickback.jpg',
      'desc':
          'berdiri tegak dengan dumbbell di satu tangan, tekuk tubuh ke depan, dorong dumbbell ke belakang hingga lengan lurus, kembalikan ke posisi awal',
      'category': 'tricep',
    },
    {
      'name': 'oblique twist',
      'image': 'resource2/obliquetwist.jpg',
      'desc':
          'duduk di lantai dengan kaki lurus, pegang dumbbell di kedua tangan, putar tubuh ke samping hingga dumbbell menyentuh lantai, kembalikan ke posisi awal',
      'category': 'Abs',
    },
    {
      'name': 'dumbbell chest press',
      'image': 'resource2/dumbbell_chest_press.jpg',
      'desc':
          'berbaring di bangku datar dengan dumbbell di kedua tangan, tekan dumbbell ke atas hingga lengan lurus, turunkan kembali ke posisi awal',
      'category': 'chest',
    },
    {
      'name': 'cable fly',
      'image': 'resource2/cablefly.jpg',
      'desc':
          'berdiri di antara dua mesin kabel, pegang pegangan kabel dengan kedua tangan, tarik kabel ke depan hingga lengan lurus, kembalikan ke posisi awal',
      'category': 'chest',
    },
    {
      'name': 'romanian deadlift',
      'image': 'resource2/romanian_deadlift.jpg',
      'desc':
          'berdiri dengan kaki selebar bahu, pegang barbell dengan kedua tangan, turunkan barbell hingga sejajar dengan lutut, angkat kembali ke posisi awal',
      'category': 'back',
    },
    {
      'name': 'wrist curl',
      'image': 'resource2/wristcurl.jpg',
      'desc':
          'duduk di bangku dengan lengan di atas paha, pegang dumbbell dengan telapak tangan menghadap ke atas, angkat dumbbell hingga pergelangan tangan lurus, turunkan kembali ke posisi awal',
      'category': 'forearm',
    },
    {
      'name': 'reverse curl',
      'image': 'resource2/reversecurl.jpg',
      'desc':
          'berdiri tegak dengan dumbbell di kedua tangan, angkat dumbbell ke arah bahu dengan telapak tangan menghadap ke bawah, turunkan kembali ke posisi awal',
      'category': 'forearm',
    },
    {
      'name': 'dumbbell shrugs',
      'image': 'resource2/dumbbellshrugs.jpg',
      'desc':
          'berdiri tegak dengan dumbbell di kedua tangan, angkat bahu ke arah telinga, turunkan kembali ke posisi awal',
      'category': 'traps',
    },
    {
      'name': 'dumbbell bent over raise',
      'image': 'resource2/dumbbellbentoverraise.jpg',
      'desc':
          'berdiri tegak dengan dumbbell di kedua tangan, tekuk tubuh ke depan, angkat dumbbell ke samping hingga sejajar bahu, turunkan kembali ke posisi awal',
      'category': 'traps',
    },
  ];

  final List<String> categories = [
    'All',
    'Abs',
    'chest',
    'shoulder',
    'back',
    'legs',
    'traps',
    'forearm',
    'biceps',
    'tricep',
  ];

  List<Map<String, String>> get filteredList {
    return weighttraininglist.where((pose) {
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
              Icons.fitness_center, // icon yoga bawaan Flutter
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            const Text(
              'Weight Training',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 110, 103, 95),
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
            child: Image.asset('resource2/bg_w.jpg', fit: BoxFit.cover),
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
                            selectedColor: Colors.green,
                            backgroundColor: const Color.fromARGB(179, 0, 0, 0),
                            labelStyle: TextStyle(
                              color:
                                  isSelected
                                      ? Colors.white
                                      : const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
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
                            color: const Color.fromARGB(255, 56, 50, 42),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name']!,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item['desc']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
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
