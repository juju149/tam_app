class NextTram {
  final String tripHeadsign;
  final String direction;
  final String delay;
  final String time;
  final String ligne;
  final String directionName;

  NextTram({
    required this.tripHeadsign,
    required this.direction,
    required this.delay,
    required this.time,
    required this.ligne,
    required this.directionName,
  });

  factory NextTram.fromJson(Map<String, dynamic> json) {
    return NextTram(
      tripHeadsign: json['trip_headsign'],
      direction: json['direction'],
      delay: json['delay'],
      time: json['time'],
      ligne: json['ligne'],
      directionName: json['direction_name'],
    );
  }
}
