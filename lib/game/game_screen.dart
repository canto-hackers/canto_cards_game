import 'dart:html';

import 'package:canto_cards_game/game/components/card_widget.dart';
import 'package:canto_cards_game/game/components/avatar_widget.dart';
import 'package:canto_cards_game/game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.game.value.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(name: controller.joiner.value.name),
          Expanded(
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildCardWidget(controller.yourPlayedCards),
                )),
          ),
          Expanded(
              child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: buildCardWidget(controller.myPlayedCards),
            ),
          )),
          AvatarWidget(name: controller.host.value.name),
          Expanded(
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildCardWidget(controller.myCards),
                )),
          ),
        ],
      ),
    );
  }

  List<CardWidget> buildCardWidget(List<int> cardIds) {
    return cardIds.map((id) => CardWidget(id: id)).toList();
  }
}
