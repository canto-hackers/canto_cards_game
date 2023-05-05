import 'package:canto_cards_game/game/cards/card_model.dart';
import 'package:canto_cards_game/game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardWidget extends GetView<GameController> {
  final CardModel card;

  CardWidget({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCardDialog(context, CardWidget(card: card));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Image.asset(
                'images/cards/${card.assetPath}',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCardDialog(BuildContext context, CardWidget cardWidget) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    'images/cards/${card.assetPath}',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () {
                    return Visibility(
                      visible: controller.isPlayBtnVisible(card),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.playCard(card);
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.black,
                        ),
                        child: const Text("Play"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
