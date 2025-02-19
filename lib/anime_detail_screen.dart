import 'package:flutter/material.dart'; 

class AnimeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> anime;

  AnimeDetailScreen({required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF5DD), // Light Cream Background
      appBar: AppBar(
        title: Text(anime["title"]),
        backgroundColor: Color(0xFF16404D), // Dark Blue
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  anime["main_picture"]["large"] ?? anime["main_picture"]["medium"],
                  width: double.infinity,
                  height: 400,
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
                color: Color(0xFF16404D), // Dark Blue
              ),
            ),

            SizedBox(height: 10),

            // Genres
            Text(
              "Genres: ${anime['genres']?.map((g) => g['name']).join(', ') ?? 'N/A'}",
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),

            SizedBox(height: 10),

            // Status & Episodes
            Row(
              children: [
                Icon(Icons.tv, color: Color(0xFFA6CDC6)),
                SizedBox(width: 5),
                Text("Status: ${anime['status'] ?? 'N/A'}",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Spacer(),
                Icon(Icons.list, color: Color(0xFFA6CDC6)),
                SizedBox(width: 5),
                Text("Episodes: ${anime['num_episodes'] ?? 'Unknown'}",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),

            SizedBox(height: 10),

            // Score & Popularity
            Row(
              children: [
                Icon(Icons.star, color: Color(0xFFDDA853)),
                SizedBox(width: 5),
                Text("${anime['mean'] ?? 'N/A'}",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                Spacer(),
                Icon(Icons.people, color: Color(0xFFA6CDC6)),
                SizedBox(width: 5),
                Text("${anime['num_list_users'] ?? 'N/A'}",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
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
            ),

            SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA6CDC6),
                    foregroundColor: Colors.black,
                  ),
                  child: Text("Mark as Watched"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA6CDC6),
                    foregroundColor: Colors.black,
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