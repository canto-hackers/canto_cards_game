import 'package:canto_cards_game/game/components/card_widget.dart';
import 'package:canto_cards_game/game/components/avatar_widget.dart';
import 'package:canto_cards_game/game/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({super.key});

//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         return Column(
//           children: [
//             Text("Host: ${controller.host.value.name}"),
//             Text("Joiner: ${controller.joiner.value.name}"),
//             Text("Game: ${controller.game.value.name}"),
//           ],
//         );
//       }),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
            ],
          ),
          AvatarWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
              CardWidget(number: 1),
            ],
          ),
        ],
      ),
    );
  }
}

