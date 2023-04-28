import 'package:canto_cards_game/game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            Text("Host: ${controller.host.value.name}"),
            Text("Joiner: ${controller.joiner.value.name}"),
            Text("Game: ${controller.game.value.name}"),
          ],
        );
      }),
    );
  }
}
