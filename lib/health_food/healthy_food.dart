import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:project/ProfilPage.dart';
import 'package:project/artikel.dart';
import 'package:project/main_page.dart';
import 'package:project/notification.dart';
import 'package:project/health_food/recipe_page.dart' show RecipePage;
import 'package:project/health_food/top3_health.dart';
import 'package:project/health_food/favorite_page.dart';
import 'package:project/health_food/shop/shop_page.dart';

import 'package:project/health_food/models/food.dart';

class FoodMenuPage extends StatefulWidget {
  const FoodMenuPage({super.key});

  @override
  State<FoodMenuPage> createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  final List<String> categories = ['All', 'Appetizer', 'Main Course', 'Dessert'];

  String selectedCategory = 'All';
  String searchQuery = '';

  late Future<List<Food>> foodsFuture;

  @override
  void initState() {
    super.initState();
    foodsFuture = loadFoodsFromJson();
  }

  Future<List<Food>> loadFoodsFromJson() async {
    final jsonString = await rootBundle.loadString('assets/food.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((json) => Food.fromJson(json)).toList();
  }

  List<Food> filterFoods(List<Food> foods) {
    final query = searchQuery.trim().toLowerCase();

    List<Food> filtered = foods;

    if (query.isNotEmpty) {
      filtered = filtered
          .where((food) => food.title.toLowerCase().contains(query))
          .toList();
    } else if (selectedCategory != 'All') {
      filtered = filtered
          .where((food) => food.category == selectedCategory)
          .toList();
    }

    return filtered;
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
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ShopPage())),
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ProfilePage())),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFB9F6CA)),
              child: Text('Menu', style: TextStyle(fontSize: 24, color: Colors.black)),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoriteRecipesDrawer()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Artikel'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ArticlePage()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifikasi'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsPage()),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Food>>(
          future: foodsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading foods: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No foods found.'));
            }

            final filteredFoods = filterFoods(snapshot.data!);

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tasty & Healthy',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Menu for Today',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Top3Health()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[800],
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Explore More',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'img-project/fruit.png',
                          height: 160,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.green),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value;
                                selectedCategory = 'All';
                              });
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Find Recipe Here...',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Categories
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final isSelected = category == selectedCategory;
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: ChoiceChip(
                            label: Text(
                              category,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            selected: isSelected,
                            selectedColor: Colors.green[800],
                            backgroundColor: Colors.white,
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
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
                const SizedBox(height: 15),

                // Grid of food
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      itemCount: filteredFoods.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final food = filteredFoods[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RecipePage(
                                  title: food.title,
                                  image: food.image,
                                  description: food.description,
                                  rating: food.rating,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.asset(
                                    food.image,
                                    height: 140,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                                  child: Text(
                                    food.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
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
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1B5E20),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 2,
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
              // Already here, do nothing or refresh
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
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Makanan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
