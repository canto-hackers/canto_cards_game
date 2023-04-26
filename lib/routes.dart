import 'package:canto_cards_game/home/home_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String initial = '/home';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => HomeScreen()),
  ];
}
