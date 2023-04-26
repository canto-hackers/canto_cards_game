import 'package:canto_cards_game/db/db_ops.dart';
import 'package:canto_cards_game/home/home_controller.dart';
import 'package:get/get.dart';

class GetBindings {
  static Future init() async {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DbOps());
  }
}
