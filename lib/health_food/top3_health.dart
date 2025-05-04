import 'package:flutter/material.dart';
import 'package:project/health_food/recipe_page.dart';

class Top3Health extends StatelessWidget {
  const Top3Health({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBF5EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B5E20),
        title: const Text(
          'Top 3 Health Menus',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Today\'s Top 3 Healthy Menus!',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'img-project/fruit.png',
                    height: 80,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.broken_image, size: 80),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Menu Items
            buildMenuItem(
              context,
              imagePath: 'img-project/Es buah yogurt.jpeg',
              title: 'Es Buah with Yogurt',
              shortDescription:
                  'A fruity, refreshing dessert with mixed fruits and tangy yogurt.',
              fullDescription: '''
Kolak pisang dengan rendah lemak yang disarankan menggunakan santan encer agar lebih sehat.

Bahan:
- 2 buah pisang kepok, potong serong
- 200ml santan encer
- 1 sdt gula merah
- 1 lembar daun pandan

Cara Membuat:
1. Rebus santan dengan gula merah dan pandan hingga mendidih.
2. Masukkan pisang, masak 5 menit.''',
              rating: '5',
            ),
            buildMenuItem(
              context,
              imagePath: 'img-project/pepes ikan kembung.jpg',
              title: 'Pepes Ikan Kembung',
              shortDescription:
                  'A traditional dish of mackerel wrapped in banana leaves with spices.',
              fullDescription: '''
Pepes ikan kembung yang dikukus tanpa minyak, kaya akan omega-3.

Bahan:
- 1 ekor ikan kembung, bersihkan
- 1 batang serai, memarkan
- 2 lembar daun salam
- 1 buah tomat, iris
- 1/2 sdt garam
- 1/2 sdt lada
- 1 sdm air jeruk nipis

Cara Membuat:
1. Lumuri ikan dengan garam, lada, dan air jeruk nipis, diamkan 15 menit.
2. Bungkus dengan daun salam, serai, dan tomat.
3. Kukus selama 30 menit hingga matang.''',
              rating: '5',
            ),
            buildMenuItem(
              context,
              imagePath: 'img-project/kolak pisang.jpeg',
              title: 'Kolak Pisang',
              shortDescription:
                  'A sweet dessert of bananas in coconut milk and palm sugar.',
              fullDescription: '''
Kolak pisang dengan rendah lemak yang disarankan menggunakan santan encer agar lebih sehat.

Bahan:
- 2 buah pisang kepok, potong serong
- 200ml santan encer
- 1 sdt gula merah
- 1 lembar daun pandan

Cara Membuat:
1. Rebus santan dengan gula merah dan pandan hingga mendidih.
2. Masukkan pisang, masak 5 menit.''',
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipePage(
              title: title,
              image: imagePath,
              description: fullDescription,
              rating: rating,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    shortDescription,
                    style: const TextStyle(fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
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
