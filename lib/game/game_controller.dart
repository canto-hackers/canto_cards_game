import 'package:canto_cards_game/db/db_ops.dart';
import 'package:canto_cards_game/game/game_details_model.dart';
import 'package:canto_cards_game/game/game_model.dart';
import 'package:canto_cards_game/player/player_model.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  Rx<Game> game = Game.empty().obs;

  Rx<Player> host = Player.empty().obs;
  Rx<Player> joiner = Player.empty().obs;

  int userId = Get.arguments["userId"]!;
  Rx<GameDetails> gameDetails = Rx(Get.arguments["gameDetails"]!);
  DbOps db = Get.find<DbOps>();

  RxList<int> myCards = <int>[].obs;
  RxList<int> myPlayedCards = <int>[].obs;
  RxList<int> yourPlayedCards = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    game.value = Get.arguments['game'] ?? game.value;
    host.value = Get.arguments['host'] ?? host.value;
    joiner.value = Get.arguments['joiner'] ?? joiner.value;

    myCards.value = <int>[1, 2, 3, 4, 5];

    yourPlayedCards.value = <int>[7, 8];

    myPlayedCards.value = <int>[9, 99];
  }

  void playCard(int id) {
    int cardIndex = myCards.indexWhere((card) => card == id);

    gameDetails.value.hostPlayedCards.add(id);
    db.updateGameDetails(gameDetails.value);

    int card = myCards[cardIndex];
    myCards.removeAt(cardIndex);

    myPlayedCards.insert(0, card);
  }
}
