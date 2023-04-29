import 'package:canto_cards_game/db/db_ops.dart';
import 'package:canto_cards_game/game/game_model.dart';
import 'package:canto_cards_game/player/player_model.dart';
import 'package:canto_cards_game/routes.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameLobbyController extends GetxController {
  final RxList<Game> availableGames = <Game>[].obs;
  DbOps db = Get.find<DbOps>();

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
      print('Change received: ${payload.toString()}');
      availableGames.add(Game.fromJson(payload["new"]));
    }).on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(
          event: 'UPDATE',
          schema: 'public',
          table: 'games',
        ), (payload, [ref]) {
      print('Change received: ${payload.toString()}');
      availableGames.removeWhere((element) => element.id == payload["old"]["id"]);
    }).subscribe();
  }

  Future<void> newGame(String gameName) async {
    String userId = Get.parameters["userId"]!;
    int id = int.parse(userId);
    Player host = await db.getPlayer(id);
    Game game = await db.insertGame(gameName, host.id);
    Get.toNamed(Routes.gamePreview, arguments: {'game': game, 'host': host, 'me': host});
  }

  Future<void> joinGame(Game hostedGame) async {
    String userId = Get.parameters["userId"]!;
    int id = int.parse(userId);
    Player joiner = await db.getPlayer(id);

    hostedGame.joinerId = joiner.id;
    hostedGame.players = 2;
    hostedGame.status = "ready_to_start";

    Game gameInProgress = await db.updateGame(hostedGame);

    int hostId = gameInProgress.hostId!;
    Player host = await db.getPlayer(hostId);

    Get.toNamed(Routes.gamePreview, arguments: {
      'game': gameInProgress,
      'host': host,
      'joiner': joiner,
      'me': joiner,
      'you': host,
    });
  }
}
