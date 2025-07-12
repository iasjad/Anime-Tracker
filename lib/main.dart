import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'anime_provider.dart';
import 'anime_list_screen.dart';
import 'screens/watched_list_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/watchlist_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(MyAnimeApp());
}

class MyAnimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFFBF5DD), // Light Cream
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF16404D), // Dark Blue
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.white),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Anime Tracker"),
        actions: [
    IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => SettingsScreen()),
        );
      },
    ),
  ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xFFDDA853), // Golden Yellow
          labelColor: Colors.white, // Set active tab text color to white
          unselectedLabelColor: Colors.white70, // Slightly dimmed white for inactive tabs
          tabs: [
            Tab(text: "Seasonal"),
            Tab(text: "Watched"),
            Tab(text: "Watchlist"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AnimeListScreen(),
          WatchedListScreen(),
          WatchlistScreen(),
        ],
      ),
    );
  }
}
