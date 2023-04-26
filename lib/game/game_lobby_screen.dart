import 'package:canto_cards_game/game/game_lobby_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameLobbyScreen extends GetView<GameLobbyController> {
  final TextEditingController _gameNameController = TextEditingController();

  GameLobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Screen'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: _gameNameController,
            decoration: const InputDecoration(
              labelText: 'Enter Game Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          // Button to create a new game
          ElevatedButton(
            onPressed: () {
              String gameName = _gameNameController.text;
              controller.newGame(gameName);
            },
            child: const Text('Create Game'),
          ),
          const SizedBox(height: 20),
          // List of available games
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: controller.availableGames.length,
                  itemBuilder: (context, index) {
                    String gameName = controller.availableGames[index].name;
                    return ListTile(
                      title: Text(gameName),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Navigate to the game lobby screen when the user taps on the join button
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => GameLobbyScreen(gameName),
                          //   ),
                          // );
                        },
                        child: const Text('Join'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
