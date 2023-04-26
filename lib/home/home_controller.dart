import 'package:canto_cards_game/db/db_ops.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString city = "".obs;

  Future<void> init() async {
    final DbOps db = Get.find<DbOps>();
    city.value = await db.getCities();
  }
}
