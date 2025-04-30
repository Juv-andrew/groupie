import 'package:flutter/material.dart'; 
// Mengimpor paket Flutter Material, menyediakan widget dasar seperti Scaffold, AppBar, Text, Button.

class SubscriptionPage extends StatelessWidget {
// Kita menggunakan StatelessWidget karena halaman ini hanya menampilkan data tetap (static), 
// tidak ada perubahan data atau interaksi yang mengubah UI setelah dibuka.

  const SubscriptionPage({super.key});
// Constructor 'const' mempercepat rendering widget ini karena isinya tidak berubah-ubah.

  @override
  Widget build(BuildContext context) {
// build() adalah method utama yang membuat tampilan halaman ini.

    return Scaffold(
// Scaffold membuat struktur layout dasar: AppBar di atas, body di tengah.

      appBar: AppBar(
// AppBar menampilkan bilah judul di bagian atas aplikasi.

        title: const Text('Subscription Plans'),
// Judul halaman di AppBar.

        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
// Style untuk teks judul: lebih besar, tebal, dan putih.

        leading: IconButton(
// leading artinya widget di sisi paling kiri AppBar (biasanya tombol kembali/back).

          icon: const Icon(Icons.arrow_back, color: Colors.white),
// Ikon panah untuk kembali.

          onPressed: () => Navigator.pop(context),
// onPressed: Ketika tombol back ditekan, Navigator.pop(context) akan menutup halaman ini 
// dan kembali ke halaman sebelumnya.

        ),

        centerTitle: true,
// Menjadikan judul AppBar berada di tengah.

        backgroundColor: const Color.fromARGB(255, 255, 12, 12),
// Memberi warna merah terang pada AppBar.

      ),

      body: Padding(
// Padding memberikan jarak/margin 16px dari tepi layar ke isi body.

        padding: const EdgeInsets.all(16.0),

        child: ListView(
// ListView digunakan agar semua konten bisa discroll ke atas/bawah jika melebihi layar.

          children: [
// ListView.children berisi daftar widget.

            _buildPlanCard(
// Memanggil fungsi _buildPlanCard untuk membuat kartu pertama.

              context,
              title: "weekly",
              price: "\$10 / week",
              features: [
                "private training sessions online",
                "Unlimited access to all features",
                "gym & fitness classes",
              ],
              onPressed: () => print("Selected weekly Plan"),
// Saat tombol 'Purchase' ditekan, akan print teks ini ke console.

            ),

            const SizedBox(height: 16),
// Memberi jarak 16 pixel antar kartu.

            _buildPlanCard(
// Membuat kartu langganan kedua.

              context,
              title: "monthly",
              price: "\$600/ month",
              features: [
                "private training sessions online",
                "access to gym & fitness center",
                "unlimited access to all features",
                "coaching 1 on 1 session",
              ],
              onPressed: () => print("Selected monthly Plan"),
// Tombol 'Purchase' akan print teks berbeda.

            ),
          ],
        ),
      ),
    );
  }

  // Membuat widget khusus untuk kartu plan subscription
  Widget _buildPlanCard(
    BuildContext context, {
    required String title,
    required String price,
    required List<String> features,
    required VoidCallback onPressed,
  }) {

    return Card(
// Card membuat tampilan kotak dengan elevasi (bayangan) untuk memperjelas antar elemen.

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// Membuat sudut Card menjadi bulat (rounded).

      elevation: 6,
// Memberikan efek bayangan di bawah kartu agar terlihat mengambang.

      child: Padding(
// Padding dalam kartu untuk memberi ruang kosong di dalamnya.

        padding: const EdgeInsets.all(16.0),

        child: Column(
// Column menyusun elemen secara vertikal (atas ke bawah).

          crossAxisAlignment: CrossAxisAlignment.start,
// Mengatur semua anak di dalam Column menjadi rata kiri.

          children: [

            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
// Menampilkan nama paket (weekly / monthly) dengan ukuran lebih besar dan tebal.

            const SizedBox(height: 4),
// Memberi jarak kecil antara judul dan harga.

            Text(price, style: const TextStyle(fontSize: 16)),
// Menampilkan harga paket di bawah judul.

            const Divider(height: 20, thickness: 1),
// Garis pemisah antara header kartu dan daftar fitur.

            ...features.map(
// Memproses list `features` menjadi widget satu per satu.

              (f) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
// Setiap fitur ditampilkan dalam Row: Icon + Teks.

                  children: [

                    const Icon(Icons.check, color: Colors.green, size: 20),
// Ikon centang berwarna hijau untuk tiap fitur.

                    const SizedBox(width: 8),
// Memberi jarak antara ikon dan teks.

                    Expanded(child: Text(f)),
// Expanded membuat teks fitur menyesuaikan ruang yang tersedia.

                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
// Jarak sebelum tombol 'Purchase'.

            ElevatedButton(
// Tombol untuk membeli langganan.

              onPressed: onPressed,
// Fungsi yang dipanggil saat tombol ditekan.

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 16, 16),
// Memberi warna merah pada tombol.

                minimumSize: const Size.fromHeight(40),
// Membuat tinggi minimal tombol agar nyaman ditekan.

              ),

              child: const Text(
                "Purchase",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
// Teks dalam tombol: Purchase, dibuat putih dan tebal.

            ),
          ],
        ),
      ),
    );
  }
}
