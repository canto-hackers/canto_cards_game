import 'package:canto_cards_game/db/db_ops.dart';
import 'package:canto_cards_game/game/game_lobby_controller.dart';
import 'package:canto_cards_game/home/home_controller.dart';
import 'package:get/get.dart';

import 'game/game_preview_controller.dart';

class GetBindings {
  static Future init() async {
    Get.lazyPut(() => DbOps());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => GameLobbyController());
    Get.lazyPut(() => GamePreviewController());
  }
}
