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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.flash_on, color: Colors.yellow),
                      Text(
                        controller.opponentDamage.toString(),
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  AvatarWidget(
                    name: controller.getOpponentName(),
                    assetPath: controller.getOpponentImage(),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite, color: Colors.red),
                      Text(
                        controller.opponentLife.toString(),
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 10),
                      const Icon(Icons.flash_on, color: Colors.yellow),
                      Text(
                        controller.playerDamage.toString(),
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  AvatarWidget(
                    name: controller.getPlayerName(),
                    assetPath: controller.getPlayerImage(),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite, color: Colors.red),
                      Text(
                        controller.playerLife.toString(),
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
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
