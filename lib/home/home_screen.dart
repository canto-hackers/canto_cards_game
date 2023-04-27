import 'package:canto_cards_game/home/home_controller.dart';
import 'package:canto_cards_game/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed(Routes.gameLobby),
          child: Text("Go to lobby"),
        ),
      ),
    );
  }
}
