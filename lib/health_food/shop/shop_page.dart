import 'package:flutter/material.dart';
import 'package:project/health_food/shop/cart_healthyfood.dart';
import 'package:project/provider/shop_provider.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Healthy Food Shop'),
          backgroundColor: const Color(0xFFB9F6CA),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [Tab(text: 'Vegetable'), Tab(text: 'Meat')],
          ),
        ),
        body: const TabBarView(
          children: [
            BahanMakananTab(category: 'Vegetable'),
            BahanMakananTab(category: 'Meat'),
          ],
        ),
        floatingActionButton: Consumer<ShopProvider>(
          builder: (context, provider, child) {
            return Stack(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CartPage()),
                    );
                  },
                  child: const Icon(Icons.shopping_cart),
                ),
                if (provider.keranjang.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 37, 214, 37),
                      radius: 10,
                      child: Text(
                        provider.keranjang.length.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 9, 132, 58),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BahanMakananTab extends StatelessWidget {
  final String category;
  const BahanMakananTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShopProvider>(context);
    final items =
        provider.filteredItems
            .where((item) => category == 'Semua' || item.kategori == category)
            .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  'img-project/profile.png',
                ), 
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Selamat datang, Groupie!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Nikmati belanja Vegetable sehat',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 118, 111, 111),
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Pesan sekarang!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 118, 111, 111),
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ],
              )

            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'img-project/banner_healthyfood.jpeg',
              width: double.infinity,
              height:
                  MediaQuery.of(context).size.height * 0.3, 
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),
          TextField(
            onChanged: provider.setSearchQuery,
            decoration: InputDecoration(
              hintText: 'Cari produk...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Switch(
                    value: provider.isSwitched,
                    onChanged: provider.toggleSwitch,
                  ),
                  const Text('Stok Tersedia'),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text(
            'Populer',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  provider.filteredItems.length > 5
                      ? 5
                      : provider.filteredItems.length,
              itemBuilder: (context, index) {
                final item = provider.filteredItems[index];
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 12),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(item.gambar, fit: BoxFit.cover),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.nama,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rp ${item.harga}',
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        item.tersedia
                            ? ElevatedButton(
                              onPressed: () {
                                Provider.of<ShopProvider>(
                                  context,
                                  listen: false,
                                ).tambahKeKeranjang(item);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${item.nama} ditambahkan ke keranjang.',
                                    ),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              },
                              child: const Text('Add to Cart'),
                            )
                            : const Text(
                              'Tidak Tersedia',
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            'Semua Produk',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(item.gambar, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.nama,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rp ${item.harga}',
                      style: const TextStyle(color: Colors.green),
                    ),
                    const SizedBox(height: 8),
                    item.tersedia
                        ? ElevatedButton(
                          onPressed: () {
                            Provider.of<ShopProvider>(
                              context,
                              listen: false,
                            ).tambahKeKeranjang(item);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${item.nama} ditambahkan ke keranjang.',
                                ),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(
                              120,
                              36,
                            ), 
                            backgroundColor: Colors.white,
                            foregroundColor: const Color.fromARGB(
                              255,
                              116,
                              39,
                              130,
                            ), 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8,
                              ), 
                            ),
                            elevation: 5, 
                            shadowColor: Colors.grey.withOpacity(
                              0.3,
                            ), 
                          ),
                          child: const Text('Add to Cart'),
                        )
                        : const Text(
                          'Tidak Tersedia',
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
