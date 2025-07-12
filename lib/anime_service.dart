import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class AnimeService {
  final Dio _dio = Dio();
  final String baseUrl = "https://api.myanimelist.net/v2";

  Future<List<dynamic>> getSeasonalAnime(int year, String season) async {
    try {
      final settingsBox = Hive.box('settings');
      final String? clientId = settingsBox.get('clientId');

      if (clientId == null || clientId.isEmpty) {
        throw Exception("Client ID not set.");
      }

      final response = await _dio.get(
        "$baseUrl/anime/season/$year/$season",
        options: Options(headers: {"X-MAL-CLIENT-ID": clientId}),
        queryParameters: {
          "limit": 50,
          "fields": "id,title,main_picture,num_episodes,status,mean,num_list_users,synopsis,genres,source,studios"
        },
      );
      return response.data["data"];
    } catch (e) {
      print("Error fetching anime: $e");
      return [];
    }
  }
}