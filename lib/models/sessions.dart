class SpaceFortressSessions {
  int? playerPoints;
  int? velocityScore;
  int? controlScore;
  int? playerShots;
  int? shipDamageByFortress;
  int? fortressDestruction;
  int? shipDamageByMine;
  int? fortressHitByMissile;
  int? bonusTaken;
  double? fireAverage;
  double? foeMineLoadAndPlayerActTimesDiffAverage;
  double? friendlyMineLoadAndPlayerActTimesDiffAverage;
  double? totalPlayerDistance;
  String? resultId;
  // String? assigned_username;
  // String? objectId;
  // DateTime? created;
  // DateTime? updated;

  SpaceFortressSessions({
    required this.playerPoints,
    required this.velocityScore,
    required this.controlScore,
    required this.playerShots,
    required this.shipDamageByFortress,
    required this.fortressDestruction,
    required this.shipDamageByMine,
    required this.fortressHitByMissile,
    required this.bonusTaken,
    required this.fireAverage,
    required this.foeMineLoadAndPlayerActTimesDiffAverage,
    required this.friendlyMineLoadAndPlayerActTimesDiffAverage,
    required this.totalPlayerDistance,
    required this.resultId,
    // required this.assigned_username,
    // this.objectId,
    // this.created,
    // this.updated,
  });

  Map<String, Object?> toJson() => {
        'points': playerPoints,
        'velocity': velocityScore,
        'controlScore': controlScore,
        'shots': playerShots,
        'fortressDamage': shipDamageByFortress,
        'destruction': fortressDestruction,
        'mineDamage': shipDamageByMine,
        'missileHit': fortressHitByMissile,
        'bonus': bonusTaken,
        'fireAverage': fireAverage,
        'avgFoeMineLoadActionTimeDiff': foeMineLoadAndPlayerActTimesDiffAverage,
        'avgMineLoadActionTimeDiff':
            friendlyMineLoadAndPlayerActTimesDiffAverage,
        'distance': totalPlayerDistance,
        'result': resultId,
        // 'assigned_username': assigned_username,
        // 'created': created,
        // 'updated': updated,
        // 'objectId': objectId,
      };

  static SpaceFortressSessions fromJson(Map<dynamic, dynamic>? json) =>
      SpaceFortressSessions(
        playerPoints: json!['points'] as int?,
        velocityScore: json['velocity'] as int?,
        controlScore: json['controlScore'] as int?,
        playerShots: json['shots'] as int?,
        shipDamageByFortress: json['fortressDamage'] as int?,
        fortressDestruction: json['destruction'] as int?,
        shipDamageByMine: json['mineDamage'] as int?,
        fortressHitByMissile: json['missileHit'] as int?,
        bonusTaken: json['bonus'] as int?,
        fireAverage: json['fireAverage'] as double?,
        foeMineLoadAndPlayerActTimesDiffAverage:
            json['avgFoeMineLoadActionTimeDiff'] as double?,
        friendlyMineLoadAndPlayerActTimesDiffAverage:
            json['avgMineLoadActionTimeDiff'] as double?,
        totalPlayerDistance: json['distance'] as double?,
        resultId: json['result'] as String?,
        // assigned_username: json['assigned_username'] as String?,
        // objectId: json['objectId'] as String?,
        // created: json['created'] as DateTime?,
        // updated: json['updated'] as DateTime?,
      );
}
