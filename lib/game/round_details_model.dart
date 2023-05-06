class RoundDetails {
  int? id;
  int gameId = 0;
  int hostMoves = 0;
  int joinerMoves = 0;
  bool hostReady = false;
  bool joinerReady = false;

  RoundDetails(this.id, this.gameId, this.hostMoves, this.joinerMoves, this.hostReady, this.joinerReady);

  RoundDetails.empty();

  RoundDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        gameId = json['gameId'],
        hostMoves = json['hostMoves'],
        joinerMoves = json['joinerMoves'],
        hostReady = json['hostReady'],
        joinerReady = json['joinerReady'];

  Map<String, dynamic> toJson() => {
        'gameId': gameId,
        'hostMoves': hostMoves,
        'joinerMoves': joinerMoves,
        'hostReady': hostReady,
        'joinerReady': joinerReady,
      };
}
