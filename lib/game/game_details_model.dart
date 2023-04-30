class GameDetails {
  final int id;
  final int gameId;
  late DateTime? timestamp;
  late List<int> hostPlayedCards;
  late List<int> joinerPlayedCards;

  GameDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        gameId = json['gameId'],
        timestamp = DateTime.parse(json['created_at']),
        hostPlayedCards = json['hostPlayedCards'].cast<int>(),
        joinerPlayedCards = json['joinerPlayedCards'].cast<int>();

  GameDetails.empty({this.id = 0, this.gameId = 0});

  Map<String, dynamic> toJson() => {
        'id': id,
        'gameId': gameId,
        'created_at': timestamp.toString(),
        'hostPlayedCards': hostPlayedCards,
        'joinerPlayedCards': joinerPlayedCards,
      };
}
