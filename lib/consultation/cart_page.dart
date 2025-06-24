import 'dart:math';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, String>> cartItems;
  final VoidCallback onOrderComplete;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.onOrderComplete,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, String>> items = [];
  bool _isOrdering = false;

  @override
  void initState() {
    super.initState();
    items = widget.cartItems;
  }

  void showOrderDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi"),
        content: const Text("Apakah Anda yakin ingin memesan barang ini?"),
        actions: [
          TextButton(
            child: const Text("Batal"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text("Ya"),
            onPressed: () {
              Navigator.of(context).pop();
              orderItemsWithLoading();
            },
          ),
        ],
      ),
    );
  }

  void orderItemsWithLoading() async {
    setState(() {
      _isOrdering = true;
    });

    final int randomSeconds = Random().nextInt(4) + 2;

    await Future.delayed(Duration(seconds: randomSeconds));

    setState(() {
      _isOrdering = false;
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Barang telah dipesan!'),
        duration: Duration(seconds: 2),
      ),
    );

    widget.onOrderComplete();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Keranjang Belanja', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.teal[700],
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: items.isEmpty
              ? const Center(child: Text('Keranjang kosong'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return ListTile(
                            title: Text(item['name']!),
                            subtitle: Text(item['price']!),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: _isOrdering ? null : showOrderDialog,
                        child: const Text('Pesan', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
        ),

        // Fullscreen loading dengan background putih
        if (_isOrdering)
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}
