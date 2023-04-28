import 'package:canto_cards_game/game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardWidget extends GetView<GameController> {
  final int id;

  const CardWidget({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCardDialog(context, CardWidget(id: id));
      },
      child: Container(
        child: Text(id.toString()),
        margin: EdgeInsets.all(8),
        width: 60,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(1, 1),
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
              color: Colors.white,
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
                cardWidget,
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.playCard(id);
                    Get.back();
                  },
                  child: Text("Play"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
