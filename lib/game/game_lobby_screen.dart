import 'package:canto_cards_game/game/game_lobby_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameLobbyScreen extends GetView<GameLobbyController> {
  final TextEditingController _gameNameController = TextEditingController();

  GameLobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/lobby.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _gameNameController,
                decoration: InputDecoration(
                  hintText: 'Enter Game Name',
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String gameName = _gameNameController.text;
                controller.newGame(gameName);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Theme.of(context).primaryColor,
              ),
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
                      var game = controller.availableGames[index];
                      String gameName = game.name;
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: ListTile(
                          title: Text(
                            gameName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(controller.host.value.name),
                          trailing: ElevatedButton(
                            onPressed: () {
                              controller.joinGame(game);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.black,
                            ),
                            child: const Text('Join'),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
