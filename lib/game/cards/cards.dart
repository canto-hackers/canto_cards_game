import 'package:canto_cards_game/db/db_ops.dart';
import 'package:canto_cards_game/game/cards/card_model.dart';
import 'package:canto_cards_game/game/cards/player_card.dart';
import 'package:get/get.dart';

class CardsService extends GetxService {
  // static final Map<int, CardModel> cardIdToCard = {
  //   1: CardModel(id: 1, name: "Cyborg Warrior", assetPath: "C_cyborg_warrior.png", attack: 3, defense: 0, health: 3),
  //   2: CardModel(id: 2, name: "EMP Grenade", assetPath: "C_emp_grenade.png", attack: 0, defense: 0, health: 2),
  //   3: CardModel(id: 3, name: "Energy Shield", assetPath: "C_energy_shield.png", attack: 2, defense: 0, health: 0),
  //   4: CardModel(id: 4, name: "Scavenger", assetPath: "C_scavenger.png", attack: 1, defense: 0, health: 1),
  //   5: CardModel(id: 5, name: "Tech Specialist", assetPath: "C_tech_specialist.png", attack: 1, defense: 0, health: 1),
  // };

  DbOps db = Get.find<DbOps>();

  Future<CardModel> getCardById(int cardId) async {
    return await db.getCardById(cardId);
  }

  Future<List<PlayerCard>> getCards(userId) async {
    List<PlayerCard> cardModelIds = await db.getUserCardModel(userId);
    return cardModelIds;
  }

  Future<List<PlayerCard>> getPlayedCards(List<int> cardIds) async {
    List<PlayerCard> cardModelIds = await db.getPlayedCards(cardIds);
    return cardModelIds;
  }

  List<int> getIdFromCards(List<PlayerCard> cards) {
    return cards.map((card) => card.id).toList();
  }
}
