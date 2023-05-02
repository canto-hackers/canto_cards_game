class GameDetails {
  final int id;
  int gameId;
   DateTime? timestamp;
   List<int>? hostDeck;
   List<int>? hostPlayedCards;
   List<int>? joinerDeck;
   List<int>? joinerPlayedCards;

  GameDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        gameId = json['gameId'],
        timestamp = DateTime.parse(json['created_at']),
        hostPlayedCards = json['hostPlayedCards'].cast<int>(),
        hostDeck = json['hostDeck'].cast<int>(),
        joinerDeck = json['joinerDeck'].cast<int>(),
        joinerPlayedCards = json['joinerPlayedCards'].cast<int>();

  GameDetails.empty({this.id = 0, this.gameId = 0});

  Map<String, dynamic> toJson() => {
        'gameId': gameId,
        'hostPlayedCards': hostPlayedCards,
        'hostDeck': hostDeck,
        'joinerDeck': joinerDeck,
        'joinerPlayedCards': joinerPlayedCards,
      };

  GameDetails(this.id, this.gameId, this.timestamp, this.hostDeck, this.hostPlayedCards, this.joinerDeck, this.joinerPlayedCards);
}
