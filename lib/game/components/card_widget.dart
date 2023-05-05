import 'package:canto_cards_game/game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardWidget extends GetView<GameController> {
  final int id;

  final Map<int, String> cardIdToAssetPath = {
    1: "C_cyborg_warrior.png",
    2: "C_emp_grenade.png",
    3: "C_energy_shield.png",
    4: "C_scavenger.png",
    5: "C_tech_specialist.png",
  };

  CardWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCardDialog(context, CardWidget(id: id));
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
                'images/cards/${cardIdToAssetPath[id]}',
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
                    'images/cards/${cardIdToAssetPath[id]}',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () {
                    return Visibility(
                      visible: !(controller.playerPlayedCards.contains(id) || controller.opponentPlayedCards.contains(id)),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.playCard(id);
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.black,
                        ),
                        child: Text("Play"),
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
