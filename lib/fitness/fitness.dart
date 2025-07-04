import 'package:flutter/material.dart';
import 'package:project/ProfilPage.dart';
import 'package:project/artikel.dart';
import 'package:project/fitness/fat_burn_page.dart';
import 'package:project/fitness/home_workout_page.dart';
import 'package:project/fitness/subscriptionpage.dart';
import 'package:project/fitness/weight_training_page.dart';
import 'package:project/fitness/yoga_page.dart';
import 'package:project/global.dart';
import 'package:project/main_page.dart';
import 'package:project/notification.dart';

class FitnessHomePage extends StatefulWidget {
  const FitnessHomePage({super.key});

  @override
  State<FitnessHomePage> createState() => _FitnessHomePageState();
}

class _FitnessHomePageState extends State<FitnessHomePage> {
  @override
  void initState() {
    super.initState();
    // Trigger rebuild jika confirmedSchedule/confirmedPlan berubah
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {}); // force update
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 202, 231, 255)),
      drawer: _buildDrawer(context),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: const Color.fromARGB(255, 202, 231, 255)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPromoCard(context),
                    const SizedBox(height: 10),
                    _buildWorkoutSection(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildPromoCard(BuildContext context) {
    return Container(
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
                  confirmedSchedule != null
                      ? 'Jadwal Kamu:'
                      : 'Promo Coaching Online!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                if (confirmedSchedule != null) ...[
                  Text(
                    confirmedPlan ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Latihan: ${confirmedSchedule?.workoutType}",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "Hari: ${confirmedSchedule?.days.join(', ')}",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    "Waktu: ${confirmedSchedule?.timeSlot}",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ] else ...[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SubscriptionPage(),
                        ),
                      ).then(
                        (_) => setState(() {}),
                      ); // refresh if back from subscription
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0D273D),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ),
                    child: Text(
                      'TRY IT NOW!!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutSection(BuildContext context) {
    return Column(
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
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 202, 231, 255),
            ),
            child: Text('Fitness Menu', style: TextStyle(fontSize: 20)),
          ),
          _drawerItem(
            Icons.fitness_center,
            'Home Workout',
            const HomeWorkoutPage(),
          ),
          _drawerItem(
            Icons.fitness_center,
            'Weight Training',
            const weight_training_page(),
          ),
          _drawerItem(
            Icons.local_fire_department,
            'Fat Burn',
            const FatBurnPage(),
          ),
          _drawerItem(Icons.self_improvement, 'Yoga', const YogaPage()),
          _drawerItem(
            Icons.subscriptions,
            'Subscription',
            const SubscriptionPage(),
          ),
        ],
      ),
    );
  }

  ListTile _drawerItem(IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
    );
  }

  BottomNavigationBar _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xff0D273D),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MainMenuPage()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const NotificationsPage()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => ArticlePage()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
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
    );
  }

  Widget latihanCard(
    String nama,
    String imageAsset,
    String deskripsi,
    BuildContext context,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth > 600 ? 160 : 130;

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
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                imageAsset,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama.toUpperCase(),
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF222222),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    deskripsi,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.grey[600],
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
