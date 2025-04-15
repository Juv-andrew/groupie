import 'package:flutter/material.dart';
import 'home_workout_page.dart';
import 'weight_training_page.dart';
import 'fat_burn_page.dart';
import 'yoga_page.dart';

void main() {
  runApp(FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      home: FitnessHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FitnessHomePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  FitnessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 196, 36, 36),
        centerTitle: true,
        leading: PopupMenuButton<String>(
          icon: Icon(Icons.menu, color: Colors.white),
          onSelected: (value) {
            print('Kamu memilih: $value');
          },
          itemBuilder:
              (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(value: 'Home', child: Text('Home')),
                PopupMenuItem<String>(value: 'menu 2', child: Text('menu 2')),
                PopupMenuItem<String>(value: 'menu 3', child: Text('Menu 3')),
                PopupMenuItem<String>(value: 'Menu 4', child: Text('Menu 4')),
                PopupMenuItem<String>(value: 'menu 5', child: Text('Menu 5')),
              ],
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.fitness_center, color: Colors.white, size: 28.0),
            SizedBox(width: 8),
            Text(
              'Fitness Journey',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              print('Profile ditekan');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'resource/main_bg.jpg', // Ganti dengan path image kamu
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Banner Promo
                    Container(
                      height: MediaQuery.of(context).size.width * 0.5,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'resource/fitness_test1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(102),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Promo Coaching Online!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                        0.08,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    print('Click Me!');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      255,
                                      69,
                                      69,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                          0.1,
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                          0.02,
                                    ),
                                  ),
                                  child: Text(
                                    'TRY IT NOW!!',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                          0.04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Progress Container
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Progress bar
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Progress Latihan',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: 0.7,
                                  backgroundColor: Colors.grey[300],
                                  color: const Color.fromARGB(255, 255, 95, 21),
                                  minHeight: 8,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            children: [
                              Text(
                                'Streak',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '5 Hari',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    // Grid Latihan
                    // Ganti GridView.count dengan Column + Row
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: latihanCard(
                                'home workout',
                                'resource/home_workout.jpg',
                                "Latihan untuk melatih otot dengan berat badan sendiri",
                                context,
                              ),
                            ),
                            Expanded(
                              child: latihanCard(
                                'weight training',
                                'resource/weight_training.jpg',
                                "Latihan untuk meningkatkan kekuatan otot dan massa otot",
                                context,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: latihanCard(
                                'fat burn',
                                'resource/fat_burn.jpg',
                                "Latihan untuk menurunkan berat badan dan membakar lemak",
                                context,
                              ),
                            ),
                            Expanded(
                              child: latihanCard(
                                'Yoga',
                                'resource/yoga.jpg',
                                "Latihan untuk flexibilitas dan pernafasan serta keseimbangan",
                                context,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Latihan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.red,
        onTap: (index) {
          // Handle navigation here
        },
      ),
    );
  }

  Widget latihanCard(
    String nama,
    String imageAsset,
    String deskripsi,
    BuildContext context,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth > 600 ? 150 : 120;

    return InkWell(
      onTap: () {
        // Arahkan ke halaman sesuai nama
        if (nama.toLowerCase() == 'home workout') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const home_workout_Page()),
          );
        } else if (nama.toLowerCase() == 'weight training') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const weight_training_page()),
          );
        } else if (nama.toLowerCase() == 'fat burn') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FatBurnPage()),
          );
        } else if (nama.toLowerCase() == 'yoga') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const YogaPage()),
          );
        }
      },
      child: Card(
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min, // ini penting
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imageAsset,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    deskripsi,
                    style: TextStyle(
                      fontSize: screenWidth * 0.02,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
