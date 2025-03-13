class Line {
  final String id;
  final String type;
  final String nom;
  final String numero;
  final String couleur;
  final List<dynamic> stops;

  Line({
    required this.id,
    required this.type,
    required this.nom,
    required this.numero,
    required this.couleur,
    required this.stops,
  });

  factory Line.fromJson(Map<String, dynamic> json) {
    return Line(
      id: json['id'].toString(),
      type: json['type'],
      nom: json['nom'],
      numero: json['numero'],
      couleur: json['couleur'],
      stops: json['stops'],
    );
  }
}
