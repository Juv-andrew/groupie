// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:konsultasi/DoctorDetailPage.dart';
import 'package:konsultasi/notification.dart'; // pastikan file ini ada
import 'package:konsultasi/ProfilPage.dart';
import 'artikel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MedanDoctorApp(),
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MedanDoctorApp extends StatelessWidget {
  const MedanDoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFFDFFFE1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    KonsultasiPage(),
    NotificationsPage(),
    ArticlePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : const Color(0xFFDFFFE1),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Article',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class KonsultasiPage extends StatelessWidget {
  final List<Map<String, String>> doctorList = [
    {
      'name': 'Clarrisa',
      'specialist': 'Gizi',
      'hospital': 'RS. Asia Medica',
      'image': 'https://randomuser.me/api/portraits/women/44.jpg',
    },
    {
      'name': 'Giselle',
      'specialist': 'Nutrisi',
      'hospital': 'RS. Colombia',
      'image': 'https://randomuser.me/api/portraits/women/65.jpg',
    },
    {
      'name': 'Andre',
      'specialist': 'Mental Health',
      'hospital': 'RS. Deli',
      'image': 'https://randomuser.me/api/portraits/men/45.jpg',
    },
    {
      'name': 'Yasmin',
      'specialist': 'Anak',
      'hospital': 'RS. Mitra Keluarga',
      'image': 'https://randomuser.me/api/portraits/women/68.jpg',
    },
    {
      'name': 'Dr. Rizal',
      'specialist': 'Jantung',
      'hospital': 'RS. Harapan Bangsa',
      'image': 'https://randomuser.me/api/portraits/men/32.jpg',
    },
    {
      'name': 'Dr. Linda',
      'specialist': 'Kulit & Kelamin',
      'hospital': 'RS. Estetika Medan',
      'image': 'https://randomuser.me/api/portraits/women/25.jpg',
    },
    {
      'name': 'Dr. Samuel',
      'specialist': 'Saraf',
      'hospital': 'RS. Kasih Ibu',
      'image': 'https://randomuser.me/api/portraits/men/41.jpg',
    },
  ];

  KonsultasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : const Color(0xFFDFFFE1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(Icons.person_outline, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Icon(Icons.favorite, color: Colors.green[800], size: 50),
          Text(
            'medan doctor',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Doctor...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.green[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: doctorList.length,
              itemBuilder: (context, index) {
                var doctor = doctorList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Color(0xFFE9FFED)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(doctor['image']!),
                        radius: 30,
                      ),
                      title: Text(
                        doctor['name']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor['specialist']!,
                            style: TextStyle(color: Colors.green[900]),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 16,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(doctor['hospital']!),
                            ],
                          ),
                          SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            DoctorDetailPage(doctor: doctor),
                                  ),
                                );
                              },
                              child: Text(
                                'selengkapnya',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
