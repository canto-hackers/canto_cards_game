import 'package:canto_cards_game/db/db_ops.dart';
import 'package:canto_cards_game/game/game_model.dart';
import 'package:canto_cards_game/player/player_model.dart';
import 'package:canto_cards_game/routes.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GamePreviewController extends GetxController {
  Rx<Game> game = Game.empty().obs;
  Rx<Player> host = Player.empty().obs;
  Rx<Player> joiner = Player.empty().obs;
  RxBool isStarting = false.obs;
  DbOps db = Get.find<DbOps>();
  var channel;

  @override
  void onInit() {
    super.onInit();
    game.value = Get.arguments['game'];
    host.value = Get.arguments['host'] ?? host.value;
    joiner.value = Get.arguments['joiner'] ?? joiner.value;

    channel = db.supabase.channel('public:games:id=eq.${game.value.id}').on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(
          event: 'UPDATE',
          schema: 'public',
          table: 'games',
          filter: 'id=eq.${game.value.id}',
        ), (payload, [ref]) async {
      print('Change received: ${payload.toString()}');
      var newGame = payload["new"];
      var joinerId = newGame["joinerId"];

      if (joinerId != null) {
        joiner.value = await db.getPlayer(joinerId);
      }
      if (newGame["status"] == 'starting') {
        Get.offAndToNamed(
          Routes.game,
          arguments: {
            'game': game.value,
            'host': host.value,
            'joiner': joiner.value,
          },
        );
      }
    });
    channel.subscribe();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
    host.close();
    joiner.close();
    await db.supabase.removeChannel(channel);
  }

  void startGame() {
    game.value.status = "starting";
    db.updateGame(game.value);
  }
}
