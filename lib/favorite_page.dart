import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'health_food/recipe_page.dart';

class FavoriteRecipesDrawer extends StatefulWidget {
  const FavoriteRecipesDrawer({super.key});

  @override
  State<FavoriteRecipesDrawer> createState() => _FavoriteRecipesDrawerState();
}

class _FavoriteRecipesDrawerState extends State<FavoriteRecipesDrawer> {
  List<String> favoriteTitles = [];

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

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    final favs = keys
        .where((key) => key.startsWith('fav_') && prefs.getBool(key) == true)
        .map((key) => key.substring(4))
        .toList();

    setState(() {
      favoriteTitles = favs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 20, bottom: 20),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF81C784),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Row(
              children: const [
                Icon(Icons.favorite, color: Colors.white, size: 32),
                SizedBox(width: 12),
                Text(
                  'Resep Favorit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: favoriteTitles.isEmpty
                ? const Center(
                    child: Text(
                      'Belum ada resep favorit.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: favoriteTitles.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final title = favoriteTitles[index];
                      final food = foods.firstWhere(
                        (f) => f['title'] == title,
                        orElse: () => {},
                      );

                      if (food.isEmpty) return const SizedBox.shrink();

                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(food['image'] ?? ''),
                        ),
                        title: Text(
                          food['title'] ?? '',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Row(
                          children: [
                            const Icon(Icons.restaurant_menu, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              food['category'] ?? '',
                              style: const TextStyle(fontSize: 13),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.star, size: 16, color: Colors.amber),
                            Text(
                              food['rating'] ?? '0.0',
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipePage(
                                title: food['title'] ?? '',
                                image: food['image'] ?? '',
                                description: food['description'] ?? '',
                                rating: food['rating'] ?? '0.0',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
