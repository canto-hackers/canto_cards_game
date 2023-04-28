import 'package:canto_cards_game/game/game_lobby_screen.dart';
import 'package:canto_cards_game/game/game_preview_screen.dart';
import 'package:canto_cards_game/game/game_screen.dart';
import 'package:canto_cards_game/home/home_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String initial = '/home';
  static const String gameLobby = '/lobby';
  static const String gamePreview = '/preview';
  static const String game = '/game';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomeScreen()),
    GetPage(name: gameLobby, page: () => GameLobbyScreen()),
    GetPage(name: gamePreview, page: () => GamePreviewScreen()),
    GetPage(name: game, page: () => GameScreen()),
  ];
}
