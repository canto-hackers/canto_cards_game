class Player {
  final int id;
  late DateTime timestamp;
  final String name;
  final String? walletAddr;
  final int wins;
  final int losses;
  late List<int> deck;

  Player(this.id, this.timestamp, this.name, this.wins, this.walletAddr, this.losses, this.deck);

  Player.empty({this.id = 0, this.name = "EMPTY", this.wins = 0, this.walletAddr = '0', this.losses = 0});

  Player.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        timestamp = DateTime.parse(json['created_at']),
        name = json['name'],
        wins = json['wins'],
        walletAddr = json['walletAddr'],
        losses = json['losses'],
        deck = json['deck'].cast<int>();

  Map<String, dynamic> toJson() => {
        'id': id,
        'timestamp': timestamp,
        'name': name,
        'players': wins,
        'walletAddr': walletAddr,
        'wins': wins,
        'losses': losses,
        'deck': deck,
      };
}
