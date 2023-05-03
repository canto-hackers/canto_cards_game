import 'package:canto_cards_game/game/components/card_widget.dart';
import 'package:canto_cards_game/game/components/avatar_widget.dart';
import 'package:canto_cards_game/game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(controller.game.value.name),
    //   ),
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('images/arena/arena1.png', fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AvatarWidget(
                name: controller.getOpponentName(),
                assetPath: controller.getOpponentImage(),
              ),
              Expanded(
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildCardWidget(controller.opponentPlayedCards),
                    )),
              ),
              Expanded(
                  child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildCardWidget(controller.playerPlayedCards),
                ),
              )),
              AvatarWidget(
                name: controller.getPlayerName(),
                assetPath: controller.getPlayerImage(),
              ),
              Expanded(
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: buildCardWidget(controller.playerDeck),
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.playRound();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.black,
                ),
                child: const Text("Play round!"),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }

  List<CardWidget> buildCardWidget(List<int> cardIds) {
    return cardIds.map((id) => CardWidget(id: id)).toList();
  }
}
