import 'package:flutter/material.dart';

class QuotesPage extends StatelessWidget {
  final List<Map<String, String>> _quotes = [
    {
      "en": "Believe you can and you're halfway there.",
      "id": "Percayalah kamu bisa, dan kamu sudah setengah jalan."
    },
    {
      "en": "Keep your face always toward the sunshine, and shadows will fall behind you.",
      "id": "Hadapkan wajahmu selalu ke arah matahari, dan bayangan akan jatuh di belakangmu."
    },
    {
      "en": "The only limit to our realization of tomorrow is our doubts of today.",
      "id": "Satu-satunya batas untuk mewujudkan hari esok adalah keraguan kita hari ini."
    },
    {
      "en": "Do not wait to strike till the iron is hot; but make it hot by striking.",
      "id": "Jangan menunggu besi menjadi panas untuk ditempa, tetapi buatlah panas dengan menempa."
    },
    {
      "en": "The best way to predict the future is to invent it.",
      "id": "Cara terbaik untuk meramal masa depan adalah dengan menciptakannya."
    },
    {
      "en": "Success is not the key to happiness. Happiness is the key to success.",
      "id": "Kesuksesan bukanlah kunci kebahagiaan. Kebahagiaan adalah kunci kesuksesan."
    }
  ];

  QuotesPage({super.key});

  Map<String, String> _getRandomQuote() {
    final index = DateTime.now().millisecondsSinceEpoch % _quotes.length;
    return _quotes[index];
  }

  @override
  Widget build(BuildContext context) {
    final randomQuote = _getRandomQuote();

    return Scaffold(
      backgroundColor: const Color(0xFFA7ECEE),
      appBar: AppBar(
        title: const Text('Need Some Quotes?'),
        backgroundColor: const Color(0xFFA7ECEE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Inspire Yourself',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      randomQuote['en']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      randomQuote['id']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuotesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Get Another Quote',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
