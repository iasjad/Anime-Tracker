# MyAnimeList Flutter App

A Flutter-based Anime Tracker using MyAnimeList API, allowing users to browse seasonal anime, mark them as watched or add them to a watchlist, and search anime across different lists.

## 🚀 Features

✅ Browse Seasonal Anime (Winter, Spring, Summer, Fall)
✅ Mark Anime as Watched
✅ Add Anime to Watchlist
✅ Search Anime in Seasonal List, Watched List, and Watchlist
✅ View Detailed Anime Info in a New Page
✅ Remove Anime from Watched List & Watchlist
✅ Beautiful UI with Dynamic Theme

## 📦 Technologies Used

- Flutter (Dart)
- Provider (State Management)
- Hive (Local Storage)
- MyAnimeList API
- Dio (API Requests)

## 🛠 Setup Instructions

### 1️⃣ Clone the Repository

```sh
git clone https://github.com/iasjad/Anime-Tracker.git
cd Anime-Tracker
```

### 2️⃣ Install Dependencies

```sh
flutter pub get
```

### 3️⃣ Set Up API Key

- Register for a MyAnimeList API Key from [MyAnimeList API Docs](https://myanimelist.net/apiconfig)
- Open `anime_service.dart` and replace `"YOUR_CLIENT_ID"` with your API key.

```dart
final String clientId = "YOUR_CLIENT_ID"; // Replace with your API Key
```

### 4️⃣ Run the App

```sh
flutter run
```

## 📂 Project Structure

```
📦 MyAnimeList-Flutter
 ┣ 📂 lib
 ┃ ┣ 📂 screens
 ┃ ┃ ┣ 📜 anime_list_screen.dart
 ┃ ┃ ┣ 📜 watched_list_screen.dart
 ┃ ┃ ┣ 📜 watchlist_screen.dart
 ┃ ┃ ┣ 📜 anime_detail_screen.dart
 ┃ ┣ 📂 widgets
 ┃ ┃ ┣ 📜 anime_card.dart
 ┃ ┣ 📜 main.dart
 ┃ ┣ 📜 anime_provider.dart
 ┃ ┣ 📜 anime_service.dart
 ┣ 📜 pubspec.yaml
 ┣ 📜 README.md
```

## 🎯 Features To Be Added

🔹 Anime Trailer Support
🔹 Sorting Anime by Score, Popularity
🔹 Favorites List
🔹 Dark Mode Theme

## 📜 License

This project is licensed under the MIT License.

## ⭐ Contribute

1. Fork the repo
2. Create a feature branch
3. Make changes & push
4. Open a pull request

## 📧 Contact

For queries, email: `asjad673@gmail.com`
Or connect on GitHub: [GitHub Profile](https://github.com/iasjad)

🚀 Enjoy Tracking Anime with Your Flutter App! 🎉
