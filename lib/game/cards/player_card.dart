import 'package:canto_cards_game/game/cards/card_model.dart';

class PlayerCard {
  int id;
  CardModel cardModel;

  PlayerCard(this.id, this.cardModel);

  PlayerCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        cardModel = CardModel.fromJson(json['cards']);

  Map<String, dynamic> toJson() => {'cardModel': cardModel.toJson()};
}
