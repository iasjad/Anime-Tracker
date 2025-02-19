import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'anime_service.dart';

class AnimeProvider extends ChangeNotifier {
  List<dynamic> animeList = [];
  List<dynamic> watchedList = [];
  List<dynamic> watchlist = [];
  
  List<dynamic> filteredAnimeList = [];
  List<dynamic> filteredWatchedList = [];
  List<dynamic> filteredWatchlist = [];

  Future<void> fetchAnime(int year, String season) async {
    animeList = await AnimeService().getSeasonalAnime(year, season);
    filteredAnimeList = List.from(animeList);
    notifyListeners();
  }

  void markAsWatched(int animeId) {
    final anime = animeList.firstWhere((a) => a["node"]["id"] == animeId, orElse: () => null);
    if (anime != null && !watchedList.contains(anime)) {
      watchedList.add(anime);
      watchlist.removeWhere((a) => a["node"]["id"] == animeId);
      filteredWatchedList = List.from(watchedList);
      notifyListeners();
    }
  }

  void addToWatchlist(int animeId) {
    final anime = animeList.firstWhere((a) => a["node"]["id"] == animeId, orElse: () => null);
    if (anime != null && !watchlist.contains(anime)) {
      watchlist.add(anime);
      watchedList.removeWhere((a) => a["node"]["id"] == animeId);
      filteredWatchlist = List.from(watchlist);
      notifyListeners();
    }
  }

  void removeFromWatched(int animeId) {
    watchedList.removeWhere((a) => a["node"]["id"] == animeId);
    filteredWatchedList = List.from(watchedList);
    notifyListeners();
  }

  void removeFromWatchlist(int animeId) {
    watchlist.removeWhere((a) => a["node"]["id"] == animeId);
    filteredWatchlist = List.from(watchlist);
    notifyListeners();
  }

  void searchAnime(String query, String listType) {
    if (listType == "seasonal") {
      filteredAnimeList = animeList
          .where((anime) => anime["node"]["title"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else if (listType == "watched") {
      filteredWatchedList = watchedList
          .where((anime) => anime["node"]["title"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else if (listType == "watchlist") {
      filteredWatchlist = watchlist
          .where((anime) => anime["node"]["title"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
