import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../anime_provider.dart';
import '../widgets/anime_card.dart';

class AnimeListScreen extends StatefulWidget {
  @override
  _AnimeListScreenState createState() => _AnimeListScreenState();
}

class _AnimeListScreenState extends State<AnimeListScreen> {
  TextEditingController yearController = TextEditingController();
  String selectedSeason = "winter";
  TextEditingController searchController = TextEditingController(); // Search controller

  final List<String> seasons = ["winter", "spring", "summer", "fall"];

  @override
  void initState() {
    super.initState();
    yearController.text = DateTime.now().year.toString();
    fetchAnime();
  }

  void fetchAnime() {
    int? year = int.tryParse(yearController.text);
    if (year != null && year > 1900 && year < 2100) {
      Provider.of<AnimeProvider>(context, listen: false).fetchAnime(year, selectedSeason);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter a valid year (1900 - 2100)"),
          backgroundColor: Color(0xFF424242), // Dark Gray
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AnimeProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xFFFBF5DD),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Year Input Field
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: "Year",
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color(0xFFA6CDC6), // Soft Teal
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    onSubmitted: (_) => fetchAnime(),
                  ),
                ),

                // Season Dropdown
                SizedBox(
                  width: 120,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFF229799), // Teal
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      value: selectedSeason,
                      isExpanded: true,
                      dropdownColor: Color(0xFF229799),
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      underline: SizedBox(),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                      items: seasons.map((season) {
                        return DropdownMenuItem<String>(
                          value: season,
                          child: Center(
                            child: Text(
                              season.toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (season) {
                        setState(() {
                          selectedSeason = season!;
                        });
                        fetchAnime();
                      },
                    ),
                  ),
                ),

                // Fetch Button
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: fetchAnime,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDDA853), // Golden Yellow
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      "Fetch",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: searchController,
              onChanged: (query) {
                provider.searchAnime(query, "seasonal");
              },
              decoration: InputDecoration(
                labelText: "Search Anime",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),

          // Anime Grid View
          Expanded(
            child: FutureBuilder(
              future: provider.fetchAnime(int.parse(yearController.text), selectedSeason),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                return Consumer<AnimeProvider>(
                  builder: (context, provider, child) {
                    return GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: provider.filteredAnimeList.length,
                      itemBuilder: (context, index) {
                        final anime = provider.filteredAnimeList[index]["node"];
                        return AnimeCard(anime: anime);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
