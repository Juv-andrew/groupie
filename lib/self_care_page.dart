// import 'package:flutter/material.dart';

// class SelfCarePage extends StatelessWidget {
//   const SelfCarePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Self-Care',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 22, // Ukuran font sesuai desain
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: const Icon(Icons.arrow_back, color: Colors.black),
//         actions: [
//           const Icon(Icons.person, color: Colors.black),
//           const SizedBox(width: 16),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "IT'S OKAY TO ASK FOR HELP",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               children: [
//                 MenuItem(title: 'Depression Test'),
//                 MenuItem(title: 'Anxiety Test'),
//                 MenuItem(title: 'Bipolar Test'),
//                 MenuItem(title: 'PTSD Test'),
//                 MenuItem(title: 'Addiction Test'),
//                 MenuItem(title: 'ADHD Test'),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.message), label: 'Inbox'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.article), label: 'Article'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person), label: 'Profil'),
//         ],
//       ),
//     );
//   }
// }

// class MenuItem extends StatelessWidget {
//   final String title;
//   final String? subtitle;

//   const MenuItem({super.key, required this.title, this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xFF294A63), // Warna sesuai desain
//           borderRadius: BorderRadius.circular(8),
//         ),
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18, // Ukuran font sesuai desain
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             if (subtitle != null)
//               Text(
//                 subtitle!,
//                 style: const TextStyle(
//                   color: Colors.white70,
//                   fontSize: 14,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project/main_page.dart';
// import 'package:project/notification.dart';
import 'package:project/artikel.dart';
import 'package:project/ProfilPage.dart';

class SelfCarePage extends StatelessWidget {
  const SelfCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Self-Care',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Icon(Icons.person, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          MenuItem(title: 'Depression Test'),
          MenuItem(title: 'Anxiety Test'),
          MenuItem(title: 'Bipolar Test'),
          MenuItem(title: 'PTSD Test'),
          MenuItem(title: 'Addiction Test'),
          MenuItem(title: 'ADHD Test'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Sesuaikan indeks dengan halaman ini (1 untuk Self-Care).
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainMenuPage()),
              );
              break;
            case 1:
              // Tetap di halaman ini.
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ArticlePage()),
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
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Article'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;

  const MenuItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigasi ke halaman tes tertentu dapat ditambahkan di sini.
        },
      ),
    );
  }
}
