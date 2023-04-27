class Game {
  final int id;
  late DateTime? timestamp;
  final String name;
  late int players;
  final int? hostId;
  late int? joinerId;
  late bool isNewGame;
  final int? winnerId;

  Game(this.id, this.timestamp, this.name, this.players, this.hostId, this.joinerId, this.isNewGame, this.winnerId);

  Game.empty({this.id = 0, this.name = "NewGame", this.hostId = 0, this.winnerId = 0});

  Game.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        timestamp = DateTime.parse(json['created_at']),
        name = json['name'],
        players = json['players'],
        hostId = json['hostId'],
        joinerId = json['joinerId'],
        winnerId = json['winnerId'],
        isNewGame = json['isNewGame'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': timestamp.toString(),
        'name': name,
        'players': players,
        'hostId': hostId,
        'joinerId': joinerId,
        'winnerId': winnerId,
        'isNewGame': isNewGame,
      };
}
