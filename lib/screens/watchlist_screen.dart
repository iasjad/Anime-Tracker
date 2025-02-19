import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../anime_provider.dart';
import '../widgets/anime_card.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AnimeProvider>(context);

    return Column(
      children: [
        // Search Bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            onChanged: (query) {
              provider.searchAnime(query, "watchlist");
            },
            decoration: InputDecoration(
              labelText: "Search Watchlist",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),

        // Anime Grid View
        Expanded(
          child: provider.filteredWatchlist.isEmpty
              ? Center(child: Text("No anime found", style: TextStyle(color: Colors.black, fontSize: 16)))
              : GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: provider.filteredWatchlist.length,
                  itemBuilder: (context, index) {
                    final anime = provider.filteredWatchlist[index]["node"];
                    return Stack(
                      children: [
                        AnimeCard(anime: anime),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.red, size: 30),
                            onPressed: () {
                              provider.removeFromWatchlist(anime["id"]);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ),
      ],
    );
  }
}
