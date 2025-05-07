import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JournalingPage extends StatefulWidget {
  const JournalingPage({super.key});

  @override
  State<JournalingPage> createState() => _JournalingPageState();
}

class _JournalingPageState extends State<JournalingPage> {
  List<String> _journalEntries = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadJournalEntries();
  }

  Future<void> _loadJournalEntries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _journalEntries = prefs.getStringList('journal_entries') ?? [];
    });
  }

  Future<void> _saveJournalEntries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('journal_entries', _journalEntries);
  }

  void _addJournalEntry(String entry) {
    setState(() {
      _journalEntries.add(entry);
    });
    _saveJournalEntries();
    Navigator.of(context).pop();
    _textController.clear();
  }

  void _showAddEntryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Journal Entry'),
          content: TextField(
            controller: _textController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Type your thoughts...',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  _addJournalEntry(_textController.text);
                }
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA7ECEE),
      appBar: AppBar(
        title: const Text('Journaling'),
        backgroundColor: const Color(0xFFA7ECEE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            _journalEntries.isEmpty
                ? const Center(
                  child: Text(
                    'No journal entries yet. Start adding your thoughts!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                )
                : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: _journalEntries.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _journalEntries[index],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    );
                  },
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEntryDialog,
        backgroundColor: const Color.fromARGB(255, 252, 253, 253),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
