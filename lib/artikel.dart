import 'package:flutter/material.dart';
import 'ArticleDetailPage.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  final List<Map<String, String>> articles = const [
    {
      'category': 'Hidup Sehat',
      'title': 'Cara Merawat Kulit Wajah yang Baik dan Benar',
      'image': '',
    },
    {
      'category': 'Kesehatan',
      'title': 'Makin Cantik setelah Tahu Cara Membersihkan Wajah dengan Benar',
      'image': '',
    },
    {
      'category': 'Hidup Sehat',
      'title': 'Makan Banyak tapi Tetap Kurus? Ini Kemungkinan Penyebabnya',
      'image': '',
    },
    {
      'category': 'Kesehatan Mental',
      'title': 'Cara Mengatasi Overthinking dengan Teknik Pernapasan',
      'image': '',
    },
    {
      'category': 'Kesehatan Mental',
      'title': 'Pentingnya Self-Care untuk Menjaga Kesehatan Mental',
      'image': '',
    },
    {
      'category': 'Kesehatan Mental',
      'title': 'Tips Mengelola Stres di Tengah Kesibukan Sehari-hari',
      'image': '',
    },
    {
      'category': 'Kesehatan Mental',
      'title': 'Kenali Tanda-Tanda Burnout dan Cara Mengatasinya',
      'image': '',
    },
    {
      'category': 'Kesehatan Mental',
      'title': 'Manfaat Journaling untuk Kesehatan Emosional',
      'image': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : const Color(0xFFDFFFE1), 

    appBar: AppBar(
      title: const Text("Artikel"),
      backgroundColor: Colors.transparent,
      elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Colors.blue),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: articles.length,
        separatorBuilder: (context, _) => const SizedBox(height: 18),
        itemBuilder: (context, index) {
          final article = articles[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailPageFancy(
                    title: article['title'] ?? '',
                    category: article['category'] ?? '',
                    content: 'Ini adalah isi lengkap dari artikel berjudul "${article['title']}". Nanti bisa kamu ganti sesuai kebutuhan.',
                    imageUrl: article['image'] ?? '',
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(25, 0, 0, 0),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                    child: article['image']!.isNotEmpty
                        ? Image.network(
                            article['image']!,
                            width: double.infinity,
                            height: 160,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            height: 160,
                            color: const Color(0xFFE6F3EB),
                            child: const Center(
                              child: Icon(Icons.image, size: 50, color: Colors.grey),
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF58C48E).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            article['category']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF58C48E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          article['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                            height: 1.4,
                          ),
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
    );
  }
}
