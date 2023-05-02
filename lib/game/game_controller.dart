import 'package:canto_cards_game/db/db_ops.dart';
import 'package:canto_cards_game/game/game_details_model.dart';
import 'package:canto_cards_game/game/game_model.dart';
import 'package:canto_cards_game/player/player_model.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameController extends GetxController {
  Rx<Game> game = Game.empty().obs;

  Rx<Player> host = Player.empty().obs;
  Rx<Player> joiner = Player.empty().obs;

  int userId = Get.arguments["userId"]!;

  Rx<GameDetails> gameDetails = GameDetails.empty().obs;
  DbOps db = Get.find<DbOps>();

  RxList<int> playerDeck = <int>[].obs;
  RxList<int> opponentDeck = <int>[].obs;
  RxList<int> playerPlayedCards = <int>[].obs;
  RxList<int> opponentPlayedCards = <int>[].obs;

  var channel;

  @override
  Future<void> onInit() async {
    super.onInit();
    game.value = Get.arguments['game'] ?? game.value;
    host.value = Get.arguments['host'] ?? host.value;
    joiner.value = Get.arguments['joiner'] ?? joiner.value;

    playerDeck.value = isHost() ? host.value.deck! : joiner.value.deck!;
    opponentDeck.value = isHost() ? joiner.value.deck! : host.value.deck!;

    gameDetails.value = await db.getGameDetailsBy(game.value.id);
    opponentPlayedCards.value = isHost() ? gameDetails.value.joinerPlayedCards! : gameDetails.value.hostPlayedCards!;
    playerPlayedCards.value = isHost() ? gameDetails.value.hostPlayedCards! : gameDetails.value.joinerPlayedCards!;

    channel = db.supabase.channel('public:game_details:id=eq.${gameDetails.value.id}').on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(
          event: 'UPDATE',
          schema: 'public',
          table: 'game_details',
          filter: 'id=eq.${gameDetails.value.id}',
        ), (payload, [ref]) async {
      print('Game Play Update: ${payload.toString()}');
      GameDetails gd = GameDetails.fromJson(payload["new"]);
      gameDetails.value = gd;
    });
    channel.subscribe();
  }

  void playCard(int id) {
    playerPlayedCards.add(id);
    playerDeck.removeWhere((cardId) => cardId == id);

    if (isHost()) {
      gameDetails.value.hostPlayedCards = playerPlayedCards;
      gameDetails.value.hostDeck = playerDeck;
    } else {
      gameDetails.value.joinerPlayedCards = playerPlayedCards;
      gameDetails.value.joinerDeck = playerDeck;
    }
    db.updateGameDetails(gameDetails.value);
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

  @override
  Future<void> onClose() async {
    super.onClose();
    host.close();
    joiner.close();
    gameDetails.close();
    playerDeck.close();
    opponentDeck.close();
    playerPlayedCards.close();
    opponentPlayedCards.close();
    await db.supabase.removeChannel(channel);
  }
}
