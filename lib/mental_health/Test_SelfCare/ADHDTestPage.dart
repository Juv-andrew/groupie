import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ADHDTestPage extends StatefulWidget {
  const ADHDTestPage({super.key});

  @override
  State<ADHDTestPage> createState() => _ADHDTestPageState();
}

class _ADHDTestPageState extends State<ADHDTestPage> {
  final List<Map<String, dynamic>> questions = [
    {
      "question": "Apakah kamu sering merasa sulit untuk fokus pada tugas?",
      "score": 0,
    },
    {
      "question": "Apakah kamu sering bertindak impulsif tanpa berpikir terlebih dahulu?",
      "score": 0,
    },
    {
      "question": "Apakah kamu mudah terganggu oleh hal-hal di sekitarmu?",
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
      result = "Kemungkinan ADHD rendah.";
    } else if (totalScore <= 4) {
      result = "Kemungkinan ADHD sedang.";
    } else {
      result = "Kemungkinan ADHD tinggi.";
    }

    _saveADHDTestResult(totalScore);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Hasil Tes", style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
        content: Text(result, style: GoogleFonts.nunito()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: Text("Kembali", style: GoogleFonts.nunito()),
          ),
        ],
      ),
    );
  }

  Future<void> _saveADHDTestResult(int score) async {
    final prefs = await SharedPreferences.getInstance();
    final date = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

    await prefs.setInt('adhd_score', score); 
    await prefs.setString('adhd_date', date);
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= questions.length) {
      return const Scaffold(body: SizedBox());
    }

    final current = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text("Tes ADHD", style: GoogleFonts.nunito(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 202, 231, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 202, 231, 255),
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
                  style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                Text(
                  current['question'],
                  style: GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.bold),
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
        child: Text(label, style: GoogleFonts.nunito(fontSize: 16)),
      ),
    );
  }
}
