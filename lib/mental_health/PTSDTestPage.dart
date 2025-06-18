import 'package:flutter/material.dart';

class PTSDTestPage extends StatefulWidget {
  const PTSDTestPage({super.key});

  @override
  State<PTSDTestPage> createState() => _PTSDTestPageState();
}

class _PTSDTestPageState extends State<PTSDTestPage> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "Apakah kamu mengalami kilas balik atau mimpi buruk tentang kejadian traumatis?",
      "score": 0,
    },
    {
      "question": "Apakah kamu merasa cemas atau gelisah saat mengingat kejadian traumatis?",
      "score": 0,
    },
    {
      "question": "Apakah kamu menghindari tempat, orang, atau situasi yang mengingatkanmu pada trauma?",
      "score": 0,
    },
  ];

  int currentQuestion = 0;
  int totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      totalScore += score;
      currentQuestion++;
    });

    if (currentQuestion >= questions.length) {
      Future.delayed(Duration.zero, _showResult);
    }
  }

  void _showResult() {
    String result;
    if (totalScore <= 2) {
      result = "Tingkat PTSD rendah";
    } else if (totalScore <= 4) {
      result = "Tingkat PTSD sedang";
    } else {
      result = "Tingkat PTSD tinggi";
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Hasil Tes"),
        content: Text(result),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text("Kembali"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= questions.length) {
      return const Scaffold(body: SizedBox());
    }

    final current = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tes PTSD"),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: const Color(0xFFF1FDFD),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pertanyaan ${currentQuestion + 1} dari ${questions.length}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Text(
                  current['question'],
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                _buildAnswerButton("Tidak Pernah", 0, Colors.grey.shade300),
                const SizedBox(height: 12),
                _buildAnswerButton("Kadang-kadang", 1, Colors.orange.shade200),
                const SizedBox(height: 12),
                _buildAnswerButton("Sering", 2, Colors.red.shade300),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerButton(String label, int score, Color color) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () => _answerQuestion(score),
        child: Text(label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
