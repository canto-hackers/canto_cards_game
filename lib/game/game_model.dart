class Game {
  final int id;
  final DateTime timestamp;
  final String name;
  final int players;
  final String? host;
  final String? joiner;
  final bool isNewGame;
  final String? winner;

  Game(this.id, this.timestamp, this.name, this.players, this.host, this.joiner, this.isNewGame, this.winner);

  Game.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        timestamp = DateTime.parse(json['created_at']),
        name = json['name'],
        players = json['players'],
        host = json['host'],
        joiner = json['joiner'],
        winner = json['winner'],
        isNewGame = json['isNewGame'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'timestamp': timestamp,
        'name': name,
        'players': players,
        'host': host,
        'joiner': joiner,
        'winner': winner,
        'isNewGame': isNewGame,
      };
}
