import 'package:flutter/material.dart';
import 'package:project/health_food/shop/data_bahan.dart';

class Bahan {
  final String nama;
  final int harga;
  final bool tersedia;
  final String gambar;
  final String satuan;
  final String kategori;
  int jumlah;

  Bahan({
    required this.nama,
    required this.harga,
    required this.tersedia,
    required this.gambar,
    required this.satuan,
    required this.kategori,
    this.jumlah = 1,
  });
}

class ShopProvider extends ChangeNotifier {
  String selectedCategory = 'Semua';
  bool isSwitched = false;
  String _searchQuery = '';

  final List<Bahan> semuaBahan = semuaBahanList;
  final List<Bahan> _keranjang = [];

  List<Bahan> get keranjang => _keranjang;

  int get totalKeranjang {
    return _keranjang.length;
  }

  int totalHarga() {
    int total = 0;
    for (var item in _keranjang) {
      total += item.harga * item.jumlah;
    }
    return total;
  }

  List<Bahan> get filteredItems {
    return semuaBahan.where((bahan) {
      final cocokKategori =
          selectedCategory == 'Semua' || bahan.kategori == selectedCategory;
      final cocokTersedia = !isSwitched || bahan.tersedia;
      final cocokSearch = bahan.nama.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );
      return cocokKategori && cocokTersedia && cocokSearch;
    }).toList();
  }

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  void toggleSwitch(bool value) {
    isSwitched = value;
    notifyListeners();
  }

  void selectCategory(String? value) {
    if (value != null) {
      selectedCategory = value;
      notifyListeners();
    }
  }

  void tambahKeKeranjang(Bahan bahan) {
    final index = _keranjang.indexWhere((item) => item.nama == bahan.nama);
    if (index != -1) {
      _keranjang[index].jumlah += 1;
    } else {
      _keranjang.add(
        Bahan(
          nama: bahan.nama,
          harga: bahan.harga,
          tersedia: bahan.tersedia,
          gambar: bahan.gambar,
          satuan: bahan.satuan,
          kategori: bahan.kategori,
          jumlah: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeFromKeranjang(Bahan bahan) {
    _keranjang.remove(bahan);
    notifyListeners();
  }

  void checkout() {
    _keranjang.clear();
    notifyListeners();
  }

  void tambahJumlah(Bahan bahan) {
    final index = _keranjang.indexOf(bahan);
    if (index != -1) {
      _keranjang[index].jumlah += 1;
      notifyListeners();
    }
  }

  void kurangJumlah(Bahan bahan) {
    final index = _keranjang.indexOf(bahan);
    if (index != -1 && _keranjang[index].jumlah > 1) {
      _keranjang[index].jumlah -= 1;
      notifyListeners();
    } else {
      removeFromKeranjang(bahan);
    }
  }
}
