import 'package:canto_cards_game/db/db_ops.dart';
import 'package:canto_cards_game/game/game_model.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GameLobbyController extends GetxController {
  final RxList<Game> availableGames = <Game>[].obs;
  DbOps db = Get.find<DbOps>();

  @override
  Future<void> onInit() async {
    super.onInit();
    availableGames.value = await db.getGames();

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
    String game = await db.insertGame(gameName);
    // availableGames.add(game);
  }
}
