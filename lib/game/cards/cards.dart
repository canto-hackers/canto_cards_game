import 'package:canto_cards_game/game/cards/card_model.dart';

class Cards {
  static final Map<int, CardModel> cardIdToCard = {
    1: CardModel(id: 1, name: "Cyborg Warrior", assetPath: "C_cyborg_warrior.png", attack: 3, defense: 0, health: 3),
    2: CardModel(id: 2, name: "EMP Grenade", assetPath: "C_emp_grenade.png", attack: 0, defense: 0, health: 2),
    3: CardModel(id: 3, name: "Energy Shield", assetPath: "C_energy_shield.png", attack: 2, defense: 0, health: 0),
    4: CardModel(id: 4, name: "Scavenger", assetPath: "C_scavenger.png", attack: 1, defense: 0, health: 1),
    5: CardModel(id: 5, name: "Tech Specialist", assetPath: "C_tech_specialist.png", attack: 1, defense: 0, health: 1),
  };

// final Map<int, String> cardIdToAssetPath = {
//   1: "C_cyborg_warrior.png",
//   2: "C_emp_grenade.png",
//   3: "C_energy_shield.png",
//   4: "C_scavenger.png",
//   5: "C_tech_specialist.png",
// };
  static CardModel getCardById(int id) {
    return Cards.cardIdToCard[id]!;
  }

  static List<CardModel> getCards(List<int> ids) {
    return ids.map((id) => getCardById(id)).toList();
  }

  static List<int> getIdFromCards(List<CardModel> cards) {
    return cards.map((card) => card.id).toList();
  }
}
