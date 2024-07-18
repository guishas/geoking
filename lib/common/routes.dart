import 'package:flutter/material.dart';
import 'package:geoking/features/game/game.dart';
import 'package:geoking/features/home/home.dart';
import 'package:geoking/features/leaderboard/view/leaderboard_page.dart';

class RouteInfo {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case '/game':
        return MaterialPageRoute(
          builder: (context) => const GamePage(),
        );
      case '/leaderboard':
        return MaterialPageRoute(
          builder: (context) => const LeaderboardPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
    }
  }
}
