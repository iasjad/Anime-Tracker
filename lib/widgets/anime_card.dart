import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../anime_provider.dart';
import '../anime_detail_screen.dart';

class AnimeCard extends StatefulWidget {
  final Map<String, dynamic> anime;

  AnimeCard({required this.anime});

  @override
  _AnimeCardState createState() => _AnimeCardState();
}

class _AnimeCardState extends State<AnimeCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final anime = widget.anime;
    final provider = Provider.of<AnimeProvider>(context, listen: false);

    String synopsis = anime['synopsis'] ?? "No synopsis available.";
    bool showReadMore = synopsis.length > 150;
    String studio = (anime['studios'] != null && anime['studios'].isNotEmpty)
        ? anime['studios'][0]['name']
        : "N/A";
    String source = anime['source'] ?? "N/A";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimeDetailScreen(anime: anime),
          ),
        );
      },
      child: SizedBox(
        height: 900,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF16404D),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover Image
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Image.network(
                    anime["main_picture"]["large"] ??
                        anime["main_picture"]["medium"],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      anime["title"] ?? "Unknown",
                      style: TextStyle(
                        color: Color(0xFFDDA853),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),

                    // Genres
                    Text(
                      "Genres: ${anime['genres']?.map((g) => g['name']).join(', ') ?? 'N/A'}",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),

                    // Score, Popularity
                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xFFDDA853), size: 16),
                        SizedBox(width: 5),
                        Text("${anime['mean'] ?? 'N/A'}", style: TextStyle(color: Colors.white)),

                        Spacer(),

                        Icon(Icons.people, color: Colors.white, size: 16),
                        SizedBox(width: 5),
                        Text("${anime['num_list_users'] ?? 'N/A'}", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 5),

                    // Episodes, Status, Airing Date
                    Row(
                      children: [
                        Icon(Icons.tv, color: Color(0xFFA6CDC6), size: 16),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Episodes: ${anime['num_episodes'] ?? 'Unknown'}",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.calendar_today, color: Color(0xFFA6CDC6), size: 16),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Aired: ${anime['start_date'] ?? 'N/A'}",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),

                    // Studio, Source
                    Row(
                      children: [
                        Icon(Icons.business, color: Color(0xFFA6CDC6), size: 16),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Studio: $studio",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.book, color: Color(0xFFA6CDC6), size: 16),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Source: $source",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),

                    // Synopsis
                    Text(
                      _isExpanded
                          ? synopsis
                          : "${synopsis.substring(0, showReadMore ? 150 : synopsis.length)}...",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                      maxLines: _isExpanded ? null : 3,
                      overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                    ),
                    if (showReadMore)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(
                          _isExpanded ? "Read Less" : "Read More",
                          style: TextStyle(
                              color: Color(0xFFA6CDC6),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),

              // Bottom buttons
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => provider.markAsWatched(anime["id"]),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA6CDC6),
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        child: Text("Watched"),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => provider.addToWatchlist(anime["id"]),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA6CDC6),
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        child: Text("Watchlist"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
