class Schedule {
  final String station;
  final String line;
  final String destination;
  final Map<String, List<String>> schedule;

  Schedule({
    required this.station,
    required this.line,
    required this.destination,
    required this.schedule,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      station: json['station'],
      line: json['line'],
      destination: json['destination'],
      schedule: Map<String, List<String>>.from(json['schedule']),
    );
  }
}
