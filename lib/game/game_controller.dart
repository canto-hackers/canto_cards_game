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
  int gameDetailsId = Get.arguments["gameDetailsId"]!;
  Rx<GameDetails> gameDetails = GameDetails.empty().obs;
  DbOps db = Get.find<DbOps>();

  RxList<int> playerDeck = <int>[].obs;
  RxList<int> opponentDeck = <int>[].obs;
  RxList<int> playerPlayedCards = <int>[].obs;
  RxList<int> opponentPlayedCards = <int>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    print('On Init: isHost: ${isHost()}');
    gameDetailsId = Get.arguments["gameDetailsId"]!;
    game.value = Get.arguments['game'] ?? game.value;
    host.value = Get.arguments['host'] ?? host.value;
    joiner.value = Get.arguments['joiner'] ?? joiner.value;

    playerDeck.value = isHost() ? host.value.deck : joiner.value.deck;
    opponentDeck.value = isHost() ? joiner.value.deck : host.value.deck;

    gameDetails.value = await db.getGameDetails(gameDetailsId);

    opponentPlayedCards.value = isHost() ? gameDetails.value.joinerPlayedCards : gameDetails.value.hostPlayedCards;
    playerPlayedCards.value = isHost() ? gameDetails.value.hostPlayedCards : gameDetails.value.joinerPlayedCards;
  }

  void playCard(int id) {
    if (isHost()) {
      playerPlayedCards.add(id);
      playerDeck.removeWhere((cardId) => cardId == id);
      gameDetails.value.hostPlayedCards = playerPlayedCards;
      gameDetails.value.hostDeck = playerDeck;
    } else {
      opponentPlayedCards.add(id);
      opponentDeck.removeWhere((cardId) => cardId == id);
      gameDetails.value.joinerPlayedCards = opponentPlayedCards;
      gameDetails.value.joinerDeck = opponentDeck;
    }
    db.updateGameDetails(gameDetails.value);
    playerDeck.removeWhere((card) => card == id);
  }

  bool isHost() {
    return game.value.hostId == userId;
  }

  String getOpponentName() {
    return isHost() ? joiner.value.name : host.value.name;
  }

  String getPlayerName() {
    return isHost() ? host.value.name : joiner.value.name;
  }
}
