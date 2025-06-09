import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> searchHistory = [];

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
    filteredSongs = List.from(allSongs); // <-- tambahkan baris ini
  }

  Future<void> _loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      searchHistory = prefs.getStringList('searchHistory') ?? [];
    });
  }

  Future<void> _saveSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('searchHistory', searchHistory);
  }

  void _filterSongs(String query) {
    final lowerQuery = query.toLowerCase();
    setState(() {
      filteredSongs =
          allSongs
              .where((song) => song.toLowerCase().contains(lowerQuery))
              .toList();
    });

    if (lowerQuery.isNotEmpty && !searchHistory.contains(lowerQuery)) {
      searchHistory.add(lowerQuery);
      _saveSearchHistory(); // Simpan history hanya saat enter
    }
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
              onSubmitted: (value) {
                _filterSongs(value); // hanya simpan ke history saat tekan Enter
              },
              onChanged: (value) {
                setState(() {
                  filteredSongs =
                      allSongs
                          .where(
                            (song) => song.toLowerCase().contains(
                              value.toLowerCase(),
                            ),
                          )
                          .toList();
                });
              },
            ),
            const SizedBox(height: 8),
            if (_searchController.text.isEmpty && searchHistory.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: searchHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchHistory[index]),
                    leading: const Icon(Icons.history, color: Colors.grey),
                    onTap: () {
                      _searchController.text = searchHistory[index];
                      _filterSongs(searchHistory[index]);
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          searchHistory.removeAt(index);
                        });
                        _saveSearchHistory();
                      },
                    ),
                  );
                },
              ),
            const SizedBox(height: 8),
            Expanded(
              child:
                  filteredSongs.isNotEmpty
                      ? ListView.builder(
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
                                // Tambahkan aksi untuk memainkan lagu
                              },
                            ),
                          );
                        },
                      )
                      : Center(
                        child: Text(
                          _searchController.text.isEmpty
                              ? 'Cari lagu favorit Anda.'
                              : 'Tidak ada hasil ditemukan.',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
