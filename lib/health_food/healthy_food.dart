// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project/ProfilPage.dart';
import 'package:project/artikel.dart';
import 'package:project/main_page.dart';
import 'package:project/notification.dart';
import 'package:project/health_food/recipe_page.dart' show RecipePage;
import 'package:project/health_food/top3_health.dart';
import 'package:project/favorite_page.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  final List<String> categories = [
    'All',
    'Appetizer',
    'Main Course',
    'Dessert',
  ];
  String selectedCategory = 'All';
  String searchQuery = ''; // Untuk pencarian

  final List<Map<String, String>> foods = [
    {
      'title': 'Gado-gado',
      'category': 'Appetizer',
      'image': 'img-project/gado gado.jpeg',
      'description': '''
Gado-gado adalah salad khas Indonesia dengan bumbu kacang.

Bahan-bahan:
- 100g tauge
- 50g bayam
- 50g kol, iris halus
- 1/2 buah timun, iris tipis
- 100g tahu, goreng sebentar dan potong kotak
- 100g tempe, goreng sebentar dan potong kotak
- 1 butir telur rebus, potong dua

Saus Kacang:
- 50g kacang tanah, sangrai dan haluskan
- 1 sdt air asam jawa
- 1 siung bawang putih
- 1/2 sdt garam
- 1/2 sdt gula merah
- 1/2 gelas air hangat

Cara Membuat:
1. Rebus semua sayuran hingga matang, tiriskan.
2. Haluskan bahan saus kacang lalu tambahkan air hangat hingga konsistensi yang diinginkan.
3. Susun sayuran, tahu, tempe, dan telur di piring, siram dengan saus kacang.
''',
      'rating': '4.5',
    },
    {
      'title': 'Es buah with yogurt',
      'category': 'Dessert',
      'image': 'img-project/Es Buah yogurt.jpeg',
      'description': '''
Es buah dengan Yogurt merupakan dessert sehat yang enak dan segar  dimakan saat cuaca sedang panas.

Bahan-bahan
- 50g pepaya, potong dadu
- 50g semangka, potong dadu
- 50g nanas, potong dadu
- 50g alpukat, potong dadu
- 100ml yogurt plain tanpa gula
- 1 sdt madu

Cara Membuat
1. Campurkan semua buah dalam mangkuk.
2. Tuang yogurt di atasnya.
3. Tambahkan madu, aduk rata.''',
      'rating': '5',
    },
    {
      'title': 'Sup jagung ayam',
      'category': 'Appetizer',
      'image': 'img-project/sup jagung ayam.jpg',
      'description': '''
Sup Jagung Ayam merupakan sup yang mudah di buat dan sangat sehat dan direkomendasikan untuk dimakan oleh anak-anak yang susah makan.

Bahan
- 100g dada ayam, suwir
- 1 bonggol jagung, pipil
- 1 buah wortel, potong dadu
- 500ml air
- 1 siung bawang putih, cincang
- 1 batang daun bawang, iris
- 1/2 sdt garam
- 1/2 sdt lada

Cara Membuat
1. Rebus ayam hingga matang, angkat dan suwir.
2. Tumis bawang putih hingga harum, masukkan jagung dan wortel.
3. Tambahkan air, garam, dan lada, masak hingga sayuran lunak.
4. Masukkan ayam suwir dan daun bawang, aduk rata, sajikan. ''',
      'rating': '4.5',
    },
    {
      'title': 'Pepes ikan kembung',
      'category': 'Main Course',
      'image': 'img-project/pepes ikan kembung.jpg',
      'description': '''
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
3. Kukus selama 30 menit hingga matang. ''',
      'rating': '5',
    },
    {
      'title': 'Kolak pisang dengan santan rendah lemak',
      'category': 'Dessert',
      'image': 'img-project/kolak pisang.jpeg',
      'description': '''
Kolak pisang dengan rendah lemak yang disarankan menggunakan santan encer agar lebih sehat.

Bahan
- 2 buah pisang kepok, potong serong
- 200ml santan encer
- 1 sdt gula merah
- 1 lembar daun pandan

Cara Membuat
1. Rebus santan dengan gula merah dan pandan hingga mendidih.
2. Masukkan pisang, masak 5 menit. ''',
      'rating': '5',
    },
    {
      'title': 'Perkedel tahu panggang',
      'category': 'Appetizer',
      'image': 'img-project/perkedel tahu panggang.jpg',
      'description': '''
Perkedel tahu panggang merupakan gorengan sehat yang terbuat dari tahu ini, sangat cocok dimakan bersama nasi.

Bahan
200g tahu putih, haluskan
1 butir telur
1 batang daun bawang, iris
1/2 sdt garam
1/2 sdt lada

Cara Membuat
Campur semua bahan hingga merata.
Bentuk bulatan kecil, panggang di oven 180°C selama 20 menit.
Sajikan hangat.''',
      'rating': '4.5',
    },
    {
      'title': 'Ikan kuah kuning (tanpa minyak)',
      'category': 'Main Course',
      'image': 'img-project/ikan kuah kuning.jpeg',
      'description': '''
Bahan
- 1 ekor ikan kakap (200g)
- 500ml air
- 1 batang serai, geprek
- 2 lembar daun jeruk
- 1 buah tomat, potong
- 1/2 sdt kunyit bubuk
- 1/2 sdt garam
- 1/2 sdt lada

Cara Membuat
1. Rebus semua bahan hingga ikan matang.
2. Sajikan hangat dengan sayuran rebus.''',
      'rating': '5',
    },
    {
      'title': 'Sate Tempe Bakar',
      'category': 'Main Course',
      'image': 'img-project/sate tempe bakar.jpg',
      'description': '''
Bahan
- 200g tempe, potong kotak
- 1 sdm kecap manis
- 1 sdt bawang putih bubuk
- 1 sdt ketumbar bubuk
- 1/2 sdt garam

Cara Membuat
1. Rendam tempe dengan bumbu selama 15 menit.
2. Tusuk tempe, bakar hingga kecoklatan.''',
      'rating': '3.9',
    },
    {
      'title': 'Sup oyong telur',
      'category': 'Main Course',
      'image':
          'img-project/sup-oyong-telur-puyuh-untuk-sarapan-ini-resepnya-05oNyycUoC.jpg',
      'description': '''
Bahan
- 1 buah oyong, potong
- 1 butir telur, kocok lepas
- 500ml air
- 1 siung bawang putih, cincang
- 1 batang daun bawang, iris
- 1/2 sdt garam
- 1/2 sdt lada

Cara Membuat
1. Tumis bawang putih, tambahkan air.
2. Masukkan oyong, masak hingga lunak.
3. Masukkan telur, aduk cepat agar berserabut.
4. Sajikan dengan daun bawang.''',
      'rating': '4',
    },
  ];

  List<Map<String, String>> get filteredFoods {
    final query = searchQuery.trim().toLowerCase();

    // Jika user sedang mencari sesuatu
    if (query.isNotEmpty) {
      return foods.where((food) {
        return food['title']!.toLowerCase().contains(query);
      }).toList();
    }

    // Jika tidak ada pencarian, filter berdasarkan kategori
    return selectedCategory == 'All'
        ? foods
        : foods.where((food) => food['category'] == selectedCategory).toList();
  }

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
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          Builder(
            builder:
                (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFFB9F6CA)),
              child: const Text(
                'Menu',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoriteRecipesDrawer(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Artikel'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArticlePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifikasi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tasty & Healthy\nMenu for Today',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Top3Health(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green[800],
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('more >'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset('assets/img-project/fruit.png', height: 200),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                            selectedCategory =
                                'All'; // Optional: Reset kategori saat mencari
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Find Recipe Here...',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == selectedCategory;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: isSelected,
                        selectedColor: Colors.green[800],
                        backgroundColor: Colors.white,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                        onSelected: (_) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Grid of food
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  itemCount: filteredFoods.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final food = filteredFoods[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => RecipePage(
                                  title: food['title']!,
                                  image: food['image']!,
                                  description: food['description'] ?? '',
                                  rating: food['rating'] ?? '0.0',
                                ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            const Positioned(
                              top: 8,
                              right: 8,
                              child: Icon(Icons.chevron_right),
                            ),
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      food['image']!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    food['title']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
