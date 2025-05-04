import 'package:flutter/material.dart';
import 'package:project/health_food/shop/shop_page.dart';
import 'package:provider/provider.dart';
import 'package:project/provider/shop_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: const Color(0xFFB9F6CA),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Consumer<ShopProvider>(
        builder: (context, provider, child) {
          final cartItems = provider.keranjang;

          if (cartItems.isEmpty) {
            return const Center(child: Text('Keranjang kamu kosong!'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: Image.asset(
                          item.gambar,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.nama),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rp ${item.harga} (${item.satuan})'),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    provider.kurangJumlah(item);
                                  },
                                ),
                                Text('${item.jumlah}'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    provider.tambahJumlah(item);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            provider.removeFromKeranjang(item);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: const Border(top: BorderSide(color: Colors.grey)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rp ${provider.totalHarga()}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00C853),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {
                          // Menampilkan dialog pop-up untuk memilih metode pembayaran
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PaymentDialog(
                                totalHarga: provider.totalHarga(),
                                onBayar: () {
                                  // Hapus keranjang setelah bayar
                                  provider.checkout();
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Pembayaran Sukses!'),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class PaymentDialog extends StatefulWidget {
  final int totalHarga;
  final VoidCallback onBayar;

  const PaymentDialog({
    super.key,
    required this.totalHarga,
    required this.onBayar,
  });

  @override
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pilih Metode Pembayaran'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<String>(
            title: const Text('Kartu Kredit'),
            value: 'Kartu Kredit',
            groupValue: _selectedPaymentMethod,
            onChanged: (String? value) {
              setState(() {
                _selectedPaymentMethod = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('E-Wallet'),
            value: 'E-Wallet',
            groupValue: _selectedPaymentMethod,
            onChanged: (String? value) {
              setState(() {
                _selectedPaymentMethod = value;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('Transfer Bank'),
            value: 'Transfer Bank',
            groupValue: _selectedPaymentMethod,
            onChanged: (String? value) {
              setState(() {
                _selectedPaymentMethod = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Total Harga: Rp ${widget.totalHarga}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_selectedPaymentMethod != null) {
              widget.onBayar(); // Panggil fungsi bayar

              // Menutup semua halaman yang ada dan kembali ke halaman utama
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => ShopPage()),
                (route) => false, // Menghapus semua halaman sebelumnya
              );
              // Menampilkan snackbar untuk konfirmasi pembayaran berhasil
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pembayaran Sukses!')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pilih metode pembayaran')),
              );
            }
          },

          child: const Text('Bayar'),
        ),
      ],
    );
  }
}
