import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/health_food/shop/cart_healthyfood.dart';
import 'package:project/provider/shop_provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Healthy Food Shop'),
          backgroundColor: const Color.fromARGB(255, 202, 231, 255),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xff0D273D),
            ),
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
          builder: (context, provider, child) => Stack(
            children: [
              FloatingActionButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartPage()),
                ),
                child: const Icon(Icons.shopping_cart),
              ),
              if (provider.keranjang.isNotEmpty)
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 10,
                    child: Text(
                      provider.keranjang.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
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
    final items = provider.filteredItems.where((i) => i.kategori == category).toList();
    final popularItems = List.from(items)..sort((a, b) => b.jumlahPembelian.compareTo(a.jumlahPembelian));

    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('img-project/profile.png'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat datang, Groupie!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Nikmati belanja $category sehat',
                    style: const TextStyle(fontSize: 14, color: Color(0xff0D273D)),
                  ),
                  const Text(
                    'Pesan sekarang!',
                    style: TextStyle(fontSize: 14, color: Color(0xff0D273D)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'img-project/banner_healthyfood.jpeg',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: provider.setSearchQuery,
            decoration: InputDecoration(
              hintText: 'Cari produk...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Switch(value: provider.isSwitched, onChanged: provider.toggleSwitch),
              const Text('Stok Tersedia'),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Populer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: popularItems.take(5).length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) => ProductCard(item: popularItems[index], isHorizontal: true),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Semua Produk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width < 360 ? 2 : 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: width < 360 ? 0.85 : 0.95,
            ),
            itemBuilder: (context, index) => ProductCard(item: items[index]),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Bahan item;
  final bool isHorizontal;
  const ProductCard({super.key, required this.item, this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShopProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: isHorizontal ? 140 : null,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                item.gambar,
                height: isHorizontal ? 100 : (width < 360 ? 90 : 110),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.nama,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width < 360 ? 13 : 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Rp ${item.harga}',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: width < 360 ? 12 : 13,
                    ),
                  ),
                  Text(item.satuan, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(height: 6),
                  item.tersedia
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              provider.tambahKeKeranjang(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${item.nama} ditambahkan ke keranjang.'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            icon: const Icon(Icons.shopping_cart_outlined, size: 16),
                            label: const Text('Add'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0D273D),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              textStyle: const TextStyle(fontSize: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.red),
                          ),
                          child: const Text(
                            'Tidak Tersedia',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
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
