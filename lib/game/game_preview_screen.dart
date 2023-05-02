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
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          'images/avatars/avatar1.png',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.host.value.name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => Column(
                      children: [
                        CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            backgroundImage: controller.joiner.value.name == "EMPTY"
                                ? const AssetImage(
                                    'images/avatars/empty_avatar.png',
                                  )
                                : AssetImage(
                                    'images/avatars/avatar2.png',
                                  )),
                        const SizedBox(height: 10),
                        Text(
                          controller.joiner.value.name,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
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
