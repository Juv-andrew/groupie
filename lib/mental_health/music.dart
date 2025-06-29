import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'music_player_page.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> allSongs = [
    {
      'title': 'Let It Be',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    },
    {
      'title': 'Shape of You',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    },
    {
      'title': 'Bohemian Rhapsody',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
    },
    {
      'title': 'Imagine',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
    },
    {
      'title': 'Perfect',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
    },
    {
      'title': 'Yesterday',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3',
    },
    {
      'title': 'Photograph',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3',
    },
    {
      'title': 'Hey Jude',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3',
    },
    {
      'title': 'Thinking Out Loud',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3',
    },
    {
      'title': 'Hallelujah',
      'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3',
    },
  ];

  List<Map<String, String>> filteredSongs = [];
  List<String> searchHistory = [];

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
    filteredSongs = List.from(allSongs);
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
              .where(
                (song) => song['title']!.toLowerCase().contains(lowerQuery),
              )
              .toList();
    });

    if (query.trim().isNotEmpty && !searchHistory.contains(lowerQuery)) {
      searchHistory.insert(0, lowerQuery); // Tambah ke depan (terbaru)
      if (searchHistory.length > 10) {
        searchHistory = searchHistory.sublist(0, 10); // Batasi 10
      }
      _saveSearchHistory();
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
      backgroundColor: const Color.fromARGB(255, 202, 231, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 231, 255),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Music Favorit',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0D273D),
                  ),
                ),
                const SizedBox(height: 12),
                Focus(
                  onFocusChange: (_) => setState(() {}),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Cari lagu...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: _filterSongs,
                    onChanged: (value) {
                      setState(() {
                        filteredSongs =
                            allSongs
                                .where(
                                  (song) => song['title']!
                                      .toLowerCase()
                                      .contains(value.toLowerCase()),
                                )
                                .toList();
                      });
                    },
                  ),
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
                                    color: Color(0xff0D273D),
                                  ),
                                  title: Text(filteredSongs[index]['title']!),
                                  trailing: const Icon(Icons.play_arrow),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => MusicPlayerPage(
                                              title:
                                                  filteredSongs[index]['title']!,
                                              url: filteredSongs[index]['url']!,
                                            ),
                                      ),
                                    );
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
            if (_searchController.text.isEmpty && searchHistory.isNotEmpty)
              Positioned(
                top: 110,
                left: 0,
                right: 0,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchHistory.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(searchHistory[index]),
                        leading: const Icon(Icons.history, color: Colors.grey),
                        onTap: () {
                          _searchController.text = searchHistory[index];
                          _filterSongs(searchHistory[index]);
                          FocusScope.of(context).unfocus();
                        },
                        trailing: IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
