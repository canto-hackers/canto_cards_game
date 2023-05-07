import 'package:canto_cards_game/game/cards/card_model.dart';

class PlayerCard {
  int id;
  CardModel cardModel;
  static final CardModel emptyModel = CardModel(
    id: -1,
    name: "Cyborg Warrior",
    assetPath: "C_cyborg_warrior.png",
    attack: 0,
    defense: 0,
    health: 0,
  );

  PlayerCard(this.id, this.cardModel);

  PlayerCard.empty({this.id = 0, CardModel? cardModel}) : this.cardModel = cardModel ?? emptyModel;

  PlayerCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        cardModel = CardModel.fromJson(json['cards']);

  Map<String, dynamic> toJson() => {'cardModel': cardModel.toJson()};
}
