import 'package:flutter/material.dart';
import 'package:project/ProfilPage.dart';
import 'package:project/artikel.dart';
import 'package:project/fitness/fat_burn_page.dart';
import 'package:project/fitness/home_workout_page.dart';
import 'package:project/fitness/subscriptionpage.dart';
import 'package:project/fitness/weight_training_page.dart';
import 'package:project/fitness/yoga_page.dart';
import 'package:project/main_page.dart';
import 'package:project/notification.dart';

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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 196, 36, 36),
  centerTitle: true,
  title: Row(
    mainAxisSize: MainAxisSize.min,
    children: const [
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
      icon: const Icon(Icons.account_circle, color: Colors.white),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProfilePage()),
        );
      },
    ),
  ],
),
drawer: Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.red.shade700,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Icon(Icons.fitness_center, size: 48, color: Colors.white),
            SizedBox(height: 10),
            Text(
              'Fitness Menu',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
      ListTile(
        leading: const Icon(Icons.fitness_center),
        title: const Text('Home Workout'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomeWorkoutPage()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.fitness_center),
        title: const Text('Weight Training'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const weight_training_page()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.local_fire_department),
        title: const Text('Fat Burn'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const FatBurnPage()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.self_improvement),
        title: const Text('Yoga'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const YogaPage()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.subscriptions),
        title: const Text('Subscription'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SubscriptionPage()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.notifications),
        title: const Text('Notification'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NotificationsPage()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.article),
        title: const Text('Artikel'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ArticlePage()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.account_circle),
        title: const Text('Profil'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProfilePage()),
          );
        },
      ),
    ],
  ),
),

      body: Stack(
        children: [
          Positioned.fill(child: Container(color: Colors.grey[200])),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.5,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'img-project/fitness_test1.jpg',
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                const SubscriptionPage(),
                                      ),
                                    );
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
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: latihanCard(
                                'home workout',
                                'img-project/home_workout.jpg',
                                "Latihan untuk melatih otot dengan berat badan sendiri",
                                context,
                              ),
                            ),
                            Expanded(
                              child: latihanCard(
                                'weight training',
                                'img-project/weight_training.jpg',
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
                                'img-project/fat_burn.jpg',
                                "Latihan untuk menurunkan berat badan dan membakar lemak",
                                context,
                              ),
                            ),
                            Expanded(
                              child: latihanCard(
                                'Yoga',
                                'img-project/yoga.jpg',
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 228, 4, 4),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainMenuPage()),
              );;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsPage(),
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ArticlePage()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Article'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
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
        if (nama.toLowerCase() == 'home workout') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomeWorkoutPage()),
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
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                imageAsset,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
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
                  const SizedBox(height: 4),
                  Text(
                    deskripsi,
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
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
