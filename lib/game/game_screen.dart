import 'package:canto_cards_game/game/cards/card_widget.dart';
import 'package:canto_cards_game/game/cards/player_card.dart';
import 'package:canto_cards_game/game/components/avatar_widget.dart';
import 'package:canto_cards_game/game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('images/arena/arena1.png', fit: BoxFit.cover),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => AvatarWidget(
                      name: controller.getOpponentName(),
                      assetPath: controller.getOpponentImage(),
                      life: controller.opponentLife.toString(),
                      damage: controller.opponentDamage.toString(),
                      moves: controller.playerMoves.toString(),
                    ),
                  ),
                ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => AvatarWidget(
                      name: controller.getPlayerName(),
                      assetPath: controller.getPlayerImage(),
                      life: controller.playerLife.toString(),
                      damage: controller.playerDamage.toString(),
                      moves: controller.playerMoves.toString(),
                    ),
                  ),
                ],
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
                child: const Text("READY"),
              ),
              const SizedBox(height: 50),
            ],
          ),
          Text(
            controller.game.value.name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  List<CardWidget> buildCardWidget(List<PlayerCard> cards) {
    return cards.map((card) => CardWidget(card: card)).toList();
  }
}
