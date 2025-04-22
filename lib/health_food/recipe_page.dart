import 'package:flutter/material.dart';

class RecipePage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String rating;

  const RecipePage({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    double parsedRating = double.tryParse(rating) ?? 0.0;

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
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Share action
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {
              // Bookmark action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CARD PUTIH: Gambar, judul, dan rating
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      image,
                      width: 150,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Judul dan Rating
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: List.generate(5, (index) {
                            if (parsedRating >= index + 1) {
                              return const Icon(Icons.star, color: Colors.amber, size: 20);
                            } else if (parsedRating > index && parsedRating < index + 1) {
                              return const Icon(Icons.star_half, color: Colors.amber, size: 20);
                            } else {
                              return const Icon(Icons.star_border, color: Colors.amber, size: 20);
                            }
                          }),
                        ),
                        const SizedBox(height: 6),
                        Text('$rating / 5', style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Heading
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(thickness: 1.2),
            const SizedBox(height: 10),

            // Deskripsi diformat
            ..._buildFormattedDescription(description),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFormattedDescription(String desc) {
    final lines = desc.split('\n');
    List<Widget> widgets = [];

    for (final line in lines) {
      if (line.trim().isEmpty) continue;

      // Heading seperti "Bahan-bahan:"
      if (line.endsWith(':')) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 4),
            child: Text(
              line.trim(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }

      // Langkah (angka di depan)
      else if (RegExp(r'^\d+\.\s').hasMatch(line)) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 4),
            child: Text(
              line.trim(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      }

      // Bullet point
      else if (line.trim().startsWith('-')) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(fontSize: 16)),
                Expanded(
                  child: Text(
                    line.trim().substring(1).trim(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      // Paragraf biasa
      else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              line.trim(),
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        );
      }
    }

    return widgets;
  }
}
