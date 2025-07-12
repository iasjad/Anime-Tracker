import 'package:flutter/material.dart';

class AnimeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> anime;

  AnimeDetailScreen({required this.anime});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFBF5DD),
      appBar: AppBar(
        title: Text(anime["title"]),
        backgroundColor: Color(0xFF16404D),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  anime["main_picture"]["large"] ?? anime["main_picture"]["medium"],
                  width: screenWidth * 0.9,
                  height: screenWidth < 600 ? 250 : 400, // Adjust height based on width
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20),
            
            // Title
            Text(
              anime["title"],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16404D),
              ),
            ),

            SizedBox(height: 10),

            // Genres
            Text(
              "Genres: ${anime['genres']?.map((g) => g['name']).join(', ') ?? 'N/A'}",
              style: TextStyle(color: Colors.black87, fontSize: 16),
              softWrap: true,
            ),

            SizedBox(height: 10),

            // Status & Episodes
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 20,
              runSpacing: 10,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.tv, color: Color(0xFFA6CDC6)),
                    SizedBox(width: 5),
                    Text("Status: ${anime['status'] ?? 'N/A'}",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.list, color: Color(0xFFA6CDC6)),
                    SizedBox(width: 5),
                    Text("Episodes: ${anime['num_episodes'] ?? 'Unknown'}",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
              ],
            ),

            SizedBox(height: 10),

            // Score & Popularity
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 20,
              runSpacing: 10,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Color(0xFFDDA853)),
                    SizedBox(width: 5),
                    Text("${anime['mean'] ?? 'N/A'}",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.people, color: Color(0xFFA6CDC6)),
                    SizedBox(width: 5),
                    Text("${anime['num_list_users'] ?? 'N/A'}",
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // Synopsis
            Text(
              "Synopsis",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF16404D)),
            ),
            SizedBox(height: 5),
            Text(
              anime['synopsis'] ?? "No synopsis available.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
              softWrap: true,
            ),

            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA6CDC6),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: Text("Mark as Watched"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA6CDC6),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: Text("Add to Watchlist"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
