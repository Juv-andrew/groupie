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

  @override
  void initState() {
    super.initState();
    items = widget.cartItems;
  }

  void showConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Konfirmasi Pemesanan'),
          content: const Text('Apakah Anda yakin ingin memesan barang ini?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Tutup dialog
                showLoadingAndOrder(); // Tampilkan loading
              },
              child: const Text('Ya, Pesan'),
            ),
          ],
        );
      },
    );
  }

  void showLoadingAndOrder() async {
    // Tampilkan dialog loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Memproses pesanan..."),
              ],
            ),
          ),
        );
      },
    );

    await Future.delayed(const Duration(seconds: 5));

    if (mounted) Navigator.of(context).pop(); // Tutup dialog

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Barang telah dipesan!'),
        duration: Duration(seconds: 2),
      ),
    );

    widget.onOrderComplete();

    await Future.delayed(const Duration(seconds: 2));
    if (mounted) Navigator.pop(context); // Tutup halaman CartPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang Belanja',
          style: TextStyle(color: Colors.white),
        ),
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
                    onPressed: showConfirmationDialog,
                    child: const Text(
                      'Pesan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
