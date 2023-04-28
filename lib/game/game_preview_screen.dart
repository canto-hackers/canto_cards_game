import 'package:canto_cards_game/game/game_preview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamePreviewScreen extends GetView<GamePreviewController> {
  const GamePreviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  color: Colors.red,
                  child: Center(
                    child: Obx(
                      () {
                        return Text(
                          controller.host.value.name,
                          style: TextStyle(fontSize: 35, color: Colors.cyan),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Text("VS"),
              Expanded(
                child: Container(
                  height: 200,
                  color: Colors.blueAccent,
                  child: Center(
                    child: Obx(
                      () {
                        return Text(
                          controller.joiner.value.name,
                          style: TextStyle(fontSize: 35, color: Colors.cyan),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "START GAME",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
