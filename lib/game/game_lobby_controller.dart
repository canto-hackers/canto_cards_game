import 'package:canto_cards_game/db/db_ops.dart';
import 'package:canto_cards_game/game/game_model.dart';
import 'package:canto_cards_game/player/player_model.dart';
import 'package:canto_cards_game/routes.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameLobbyController extends GetxController {
  final RxList<Game> availableGames = <Game>[].obs;
  DbOps db = Get.find<DbOps>();
  int userId = int.parse(Get.parameters["userId"]!);

  @override
  Future<void> onInit() async {
    super.onInit();
    availableGames.value = await db.getNewGames();

    db.supabase.channel('public:games').on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(
          event: 'INSERT',
          schema: 'public',
          table: 'games',
        ), (payload, [ref]) {
      print('Game Lobby Insert: ${payload.toString()}');
      availableGames.add(Game.fromJson(payload["new"]));
    }).on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(
          event: 'UPDATE',
          schema: 'public',
          table: 'games',
        ), (payload, [ref]) {
      print('Game Lobby Update: ${payload.toString()}');
      availableGames.removeWhere((element) => element.id == payload["old"]["id"]);
    }).subscribe();
  }

  Future<void> newGame(String gameName) async {
    Player host = await db.getPlayer(userId);
    Game game = await db.insertGame(gameName, host.id);
    Get.toNamed(
      Routes.gamePreview,
      arguments: {'game': game, 'host': host, 'userId': userId},
    );
  }

  Future<void> joinGame(Game hostedGame) async {
    Player joiner = await db.getPlayer(userId);
    print("Joiner ${joiner.id}");
    hostedGame.joinerId = joiner.id;
    hostedGame.players = 2;
    hostedGame.status = "ready_to_start";

    Game gameInProgress = await db.updateGame(hostedGame);
    print("gameInProgress joinerID:  ${gameInProgress.joinerId}");
    print("gameInProgress gameId: ${gameInProgress.id}");

    int hostId = gameInProgress.hostId!;
    Player host = await db.getPlayer(hostId);

    Get.toNamed(Routes.gamePreview, arguments: {
      'game': gameInProgress,
      'host': host,
      'joiner': joiner,
      'userId': userId,
    });
  }
}
