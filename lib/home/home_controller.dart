import 'package:canto_cards_game/db/db_ops.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  final DbOps db = Get.find<DbOps>();
  int userId = int.parse(Get.parameters["userId"]!);

  Future<void> init() async {}
}
