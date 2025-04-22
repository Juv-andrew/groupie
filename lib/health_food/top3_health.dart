import 'package:flutter/material.dart';
import 'package:project/health_food/recipe_page.dart';

class Top3Health extends StatelessWidget {
  const Top3Health({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9F6CA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Arahkan ke profil
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Arahkan ke menu drawer
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                        ),
                        children: [
                          TextSpan(
                            text: 'Top 3 ',
                            style: TextStyle(color: Color(0xFF1B5E20), fontSize: 24), // hijau
                          ),
                          TextSpan(
                            text: 'favorite menu Today !!!',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset('img-project/fruit.png', height: 130),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Menu 1
            // Menu 1
            buildMenuItem(
              context,
              imagePath: 'img-project/Es Buah yogurt.jpeg',
              title: 'Es Buah with Yogurt ',
              shortDescription:
                  'Es buah yogurt is a fruity, refreshing dessert with mixed fruits and tangy yogurt.',
              fullDescription:
                  '''
Kolak pisang dengan rendah lemak yang disarankan menggunakan santan encer agar lebih sehat.

Bahan
- 2 buah pisang kepok, potong serong
- 200ml santan encer
- 1 sdt gula merah
- 1 lembar daun pandan

Cara Membuat
1. Rebus santan dengan gula merah dan pandan hingga mendidih.
2. Masukkan pisang, masak 5 menit. ''',
              rating: '5',
            ),

            const SizedBox(height: 16),

            // Menu 2
            buildMenuItem(
              context,
              imagePath: 'img-project/pepes ikan kembung.jpg',
              title: 'Pepes Ikan Kembung',
              shortDescription:
                  'Pepes ikan kembung is an Indonesian dish of mackerel with aromatic spices, wrapped in banana leaves.',
              fullDescription: '''
Pepes ikan kembung yang dikukus tanpa minyak , kaya akan omega-3

Bahan
- 1 ekor ikan kembung, bersihkan
- 1 batang serai, memarkan
- 2 lembar daun salam
- 1 buah tomat, iris
- 1/2 sdt garam
- 1/2 sdt lada
- 1 sdm air jeruk nipis

Cara Membuat
1. Lumuri ikan dengan garam, lada, dan air jeruk nipis, diamkan 15 menit.
2. Bungkus dengan daun salam, serai, dan tomat.
3. Kukus selama 30 menit hingga matang.''',
              rating: '5',
            ),

            const SizedBox(height: 16),

            // Menu 3
            buildMenuItem(
              context,
              imagePath: 'img-project/kolak pisang.jpeg',
              title: 'Kolak Pisang',
              shortDescription:
                  'Kolak pisang is an Indonesian dessert made of bananas in coconut milk and palm sugar — sweet and creamy!',
              fullDescription: '''
Kolak pisang dengan rendah lemak yang disarankan menggunakan santan encer agar lebih sehat.

Bahan
- 2 buah pisang kepok, potong serong
- 200ml santan encer
- 1 sdt gula merah
- 1 lembar daun pandan

Cara Membuat
1. Rebus santan dengan gula merah dan pandan hingga mendidih.
2. Masukkan pisang, masak 5 menit. ''',
              rating: '5',
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String shortDescription,
    required String fullDescription,
    required String rating,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 150,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  shortDescription,
                  style: const TextStyle(fontSize: 8),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: List.generate(
                    5,
                    (index) =>
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => RecipePage(
                                title: title,
                                image: imagePath,
                                description: fullDescription,
                                rating: rating,
                              ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B5E20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Recipe', style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 253, 255, 253))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
