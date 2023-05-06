class CardModel {
  int id;
  String name;
  String assetPath;
  int attack;
  int defense;
  int health;

  CardModel({
    required this.id,
    required this.name,
    required this.assetPath,
    required this.attack,
    required this.defense,
    required this.health,
  });

  CardModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        assetPath = json['assetPath'],
        attack = json['attack'],
        defense = json['defense'],
        health = json['health'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'assetPath': assetPath,
        'attack': attack,
        'defense': defense,
        'health': health,
      };
}
