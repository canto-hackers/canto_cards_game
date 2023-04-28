import 'package:canto_cards_game/game/components/card_widget.dart';
import 'package:canto_cards_game/game/game_model.dart';
import 'package:canto_cards_game/player/player_model.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  // Rx<Game> game = Game.empty().obs;
  // Rx<Player> host = Player.empty().obs;
  // Rx<Player> joiner = Player.empty().obs;

  RxList<CardWidget> myCards = <CardWidget>[].obs;
  RxList<CardWidget> myPlayedCards = <CardWidget>[].obs;
  RxList<CardWidget> yourPlayedCards = <CardWidget>[].obs;

  @override
  void onInit() {
    super.onInit();
    // game.value = Get.arguments['game'] ?? game.value;
    // host.value = Get.arguments['host'] ?? host.value;
    // joiner.value = Get.arguments['joiner'] ?? joiner.value;

    myCards.value = <CardWidget>[
      CardWidget(id: 1),
      CardWidget(id: 1),
      CardWidget(id: 1),
      CardWidget(id: 1),
      CardWidget(id: 1),
      CardWidget(id: 1),
    ];

    yourPlayedCards.value = <CardWidget>[
      CardWidget(id: 2),
      CardWidget(id: 2),
    ];

    myPlayedCards.value = <CardWidget>[
      CardWidget(id: 2),
      CardWidget(id: 3),
    ];
  }

  void playCard(int id) {
    int cardIndex = myCards.indexWhere((card) => card.id == id);
    CardWidget card = myCards[cardIndex];
    myCards.removeAt(cardIndex);

    myPlayedCards.insert(0, card);
  }
}
