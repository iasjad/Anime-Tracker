# MyAnimeList Flutter App

A Flutter-based Anime Tracker using the MyAnimeList API. Browse seasonal anime, mark shows as watched or add to a watchlist, search titles, and now dynamically configure your API Client ID using the in-app **Settings Screen**.

## ✨ Features

✅ Browse Seasonal Anime (Winter, Spring, Summer, Fall)\
✅ Mark Anime as Watched\
✅ Add Anime to Watchlist\
✅ Search Anime in Seasonal List, Watched List, and Watchlist\
✅ View Detailed Anime Info in a New Page\
✅ Remove Anime from Watched List & Watchlist\
✅ Beautiful UI with Dynamic Theme\
✅ Enter and Update MyAnimeList API Client ID via Settings Screen\
✅ View, Hide, or Delete Saved Client ID\
✅ Data stored locally using Hive\
✅ **Sort Seasonal Anime by Score or Popularity** ✨ **NEW**

## 🗖️ Technologies Used

- **Flutter** (Dart)
- **Provider** (State Management)
- **Hive** (Local Storage)
- **MyAnimeList API**
- **Dio** (HTTP Requests)

## 🛠️ Setup Instructions

### 1️⃣ Clone the Repository

```sh
git clone https://github.com/iasjad/Anime-Tracker.git
cd Anime-Tracker
```

### 2️⃣ Install Dependencies

```sh
flutter pub get
```

### 3️⃣ Run the App

```sh
flutter run
```

### 🔐 API Setup

You can now **enter your MyAnimeList API Client ID from within the app**:

- Open the app.
- Tap the **Settings icon** (top-right corner).
- Enter your `clientId` in the field.
- Save it, and the app will start using it automatically.

💡 No need to hardcode the API key anymore!

If you still prefer manual setup:

- Get your Client ID from [MyAnimeList API Docs](https://myanimelist.net/apiconfig)
- Replace the value in `anime_service.dart` (fallback method only).

## 📂 Project Structure

```
📆 Anime-Tracker
 ├📆 lib
 ┃ ├📆 screens
 ┃ ┃ ├📋 anime_list_screen.dart
 ┃ ┃ ├📋 watched_list_screen.dart
 ┃ ┃ ├📋 watchlist_screen.dart
 ┃ ┃ ├📋 anime_detail_screen.dart
 ┃ ┃ ├📋 settings_screen.dart ✅ NEW
 ┃ ├📆 widgets
 ┃ ┃ ├📋 anime_card.dart
 ┃ ├📄 main.dart
 ┃ ├📄 anime_provider.dart
 ┃ ├📄 anime_service.dart
 ├📄 pubspec.yaml
 ├📄 README.md
```

## 🌟 Screenshots

| Seasonal Anime List                                                     | Anime Detail Page                                                   | Settings Screen                                                 |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------- | --------------------------------------------------------------- |
| ![Seasonal Anime List](./screenshots/photo_2.jpg 'Seasonal Anime List') | ![Anime Detail Page](./screenshots/photo_1.jpg 'Anime Detail Page') | ![Settings Screen](./screenshots/photo_3.jpg 'Settings Screen') |

## 🎯 Features To Be Added

🔹 Anime Trailer Support\
🔹 Sorting by Score / Popularity (Added)\
🔹 Favorites List\
🔹 Dark Mode Theme\
🔹 Login with MyAnimeList Account (OAuth)

## 📜 License

This project is licensed under the **MIT License**.

## ⭐ Contribute

1. Fork the repo
2. Create a feature branch
3. Make your changes
4. Push and open a Pull Request

## 📧 Contact

📧 Email: `asjad673@gmail.com`\
👨‍💼 GitHub: [@iasjad](https://github.com/iasjad)

---

🎉 Enjoy tracking anime with your customizable Flutter app!
