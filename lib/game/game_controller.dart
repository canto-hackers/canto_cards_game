import 'package:canto_cards_game/game/game_model.dart';
import 'package:canto_cards_game/player/player_model.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  Rx<Game> game = Game.empty().obs;
  Rx<Player> host = Player.empty().obs;
  Rx<Player> joiner = Player.empty().obs;

  @override
  void onInit() {
    super.onInit();
    game.value = Get.arguments['game'];
    host.value = Get.arguments['host'] ?? host.value;
    joiner.value = Get.arguments['joiner'] ?? joiner.value;
  }
}
