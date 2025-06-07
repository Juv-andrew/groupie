import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> allSongs = [
    'Let It Be',
    'Shape of You',
    'Bohemian Rhapsody',
    'Stay With Me',
    'Counting Stars',
    'Someone Like You',
    'Perfect',
    'Photograph',
    'Fix You',
  ];
  List<String> filteredSongs = [];

  @override
  void initState() {
    super.initState();
    filteredSongs = allSongs;
    _searchController.addListener(_filterSongs);
  }

  void _filterSongs() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredSongs =
          allSongs.where((song) => song.toLowerCase().contains(query)).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA7ECEE),
      appBar: AppBar(
        backgroundColor: const Color(0xFFA7ECEE),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Music Favorit',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari lagu...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSongs.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.music_note,
                        color: Colors.blueAccent,
                      ),
                      title: Text(filteredSongs[index]),
                      trailing: const Icon(Icons.play_arrow),
                      onTap: () {
                      
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
