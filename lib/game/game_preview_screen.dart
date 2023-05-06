import 'package:canto_cards_game/game/components/avatar_widget.dart';
import 'package:canto_cards_game/game/game_preview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamePreviewScreen extends GetView<GamePreviewController> {
  const GamePreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/game-preview-bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AvatarWidget(
                    name: controller.host.value.name,
                    assetPath: 'images/avatars/cypher.gif',
                    life: "",
                    damage: "",
                    moves: "",
                  ),
                  Obx(
                    () => AvatarWidget(
                      name: controller.joiner.value.name,
                      assetPath: 'images/avatars/zenith.gif',
                      life: "",
                      damage: "",
                      moves: "",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: controller.isHost(),
                child: ElevatedButton(
                  onPressed: () {
                    controller.startGame();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(
                    "START GAME",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
