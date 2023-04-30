import 'package:canto_cards_game/db/db_ops.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  RxString city = "".obs;

  Future<void> init() async {
    final DbOps db = Get.find<DbOps>();

    db.supabase.channel('public:cities:id=eq.1').on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(
          event: 'UPDATE',
          schema: 'public',
          table: 'cities',
          filter: 'id=eq.1',
        ), (payload, [ref]) {
      print('Change received: ${payload.toString()}');
      city.value = payload.toString();
    }).subscribe();
  }
}
