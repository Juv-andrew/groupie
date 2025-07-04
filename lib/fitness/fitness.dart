import 'package:flutter/material.dart';
import 'package:project/ProfilPage.dart';
import 'package:project/artikel.dart';
import 'package:project/fitness/fat_burn_page.dart';
import 'package:project/fitness/home_workout_page.dart';
import 'package:project/fitness/progress_page.dart';
import 'package:project/fitness/subscriptionpage.dart';
import 'package:project/fitness/weight_training_page.dart';
import 'package:project/fitness/yoga_page.dart';
import 'package:project/main_page.dart';
import 'package:project/notification.dart';
import 'package:pie_chart/pie_chart.dart';

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

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 8),
        Flexible(child: Text(text, style: const TextStyle(fontSize: 14))),
      ],
    );
  }
}

class FitnessHomePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  final Map<String, double> dataMap = {
    "Weight Training": 30,
    "Flexibility Training": 40,
    "Fat Burn": 30,
  };

  FitnessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 231, 255),
        title: const Text(
          'Fitness Page',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 202, 231, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 10),
                  Text(
                    'Fitness Menu',
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
                  MaterialPageRoute(
                    builder: (_) => const weight_training_page(),
                  ),
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
          ],
        ),
      ),

      body: Container(
        color: const Color.fromARGB(255, 202, 231, 255),
        child: SafeArea(
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
                                      MediaQuery.of(context).size.width * 0.08,
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
                                          (context) => const SubscriptionPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff0D273D),
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width * 0.1,
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
                  InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ProgressPage(),
      ),
    );
  },
  child: Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 4,
    margin: const EdgeInsets.only(bottom: 20),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 800),
              chartRadius: MediaQuery.of(context).size.width * 0.3,
              colorList: [
                Colors.blueAccent,
                Colors.orangeAccent,
                Colors.redAccent,
              ],
              chartType: ChartType.disc,
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
                showChartValueBackground: false,
                decimalPlaces: 0,
              ),
              legendOptions: const LegendOptions(
                showLegends: false,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  LegendItem(
                    color: Colors.blueAccent,
                    text: 'Weight Training',
                  ),
                  SizedBox(height: 15),
                  LegendItem(
                    color: Colors.orangeAccent,
                    text: 'Flexibility Training',
                  ),
                  SizedBox(height: 15),
                  LegendItem(
                    color: Colors.redAccent,
                    text: 'Fat Burn',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
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
      ),
      bottomNavigationBar: BottomNavigationBar(
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
                MaterialPageRoute(builder: (context) => const MainMenuPage()),
              );
              {}
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
