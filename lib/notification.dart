import 'package:flutter/material.dart';
import 'package:project/ProfilPage.dart';
import 'package:project/artikel.dart';
import 'package:project/main_page.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : const Color(0xFFDFFFE1),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  NotificationCard(
                    emoji: "🟢",
                    title: "Reminder!",
                    time: "23 min",
                    description:
                        "Doctor appointment today at 6:30pm, need to pick up files on the way.",
                    action1: "Mark as done",
                    action2: "Update",
                  ),
                  NotificationCard(
                    emoji: "❤️",
                    title: "Your weekly health tip is ready!",
                    time: "2 hr",
                    description:
                        "We've prepared your weekly health tip to help you improve your mood.",
                    action1: "Open weekly tips",
                  ),
                  NotificationCard(
                    emoji: "⚖️",
                    title: "It’s time to enter your weight",
                    time: "1 d",
                    description:
                        "Track your weight and help us customize your weekly health tip for you.",
                    action1: "Add weight entry",
                  ),
                  NotificationCard(
                    emoji: "📅",
                    title: "Moment remainder!",
                    time: "1 wk",
                    description:
                        "Doctor appointment today at 6:30pm, need to pick up files on the way.",
                    action1: "View",
                    action2: "Update",
                  ),
                  NotificationCard(
                    emoji: "⚖️",
                    title: "It’s time to enter your weight",
                    time: "1 yr",
                    description:
                        "We’ve prepared your weekly health tip to help you improve your mood.",
                    action1: "Add weight entry",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1B5E20),
        selectedItemColor: Color(0xFFB9F6CA),
        unselectedItemColor: Colors.white,
        currentIndex: 1, // karena sedang di halaman Inbox/Notifikasi
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainMenuPage()),
              );
              break;
            case 1:
              // Jangan navigasi ulang ke halaman ini sendiri
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
}

class NotificationCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String time;
  final String description;
  final String action1;
  final String? action2;

  const NotificationCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.time,
    required this.description,
    required this.action1,
    this.action2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: TextStyle(fontSize: 20)),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Text(time, style: TextStyle(color: Colors.black, fontSize: 12)),
            ],
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  action1,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              if (action2 != null)
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    action2!,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
