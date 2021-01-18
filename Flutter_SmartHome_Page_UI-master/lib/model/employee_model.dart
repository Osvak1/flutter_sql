import 'dart:convert';

List<Videojocs> videojocsFromJson(String str) =>
    List<Videojocs>.from(json.decode(str).map((x) => Videojocs.fromJson(x)));

String videojocsToJson(List<Videojocs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Videojocs {
  int id;
  String nom;
  String empresa;
  String imatge;

  Videojocs({this.id, this.nom, this.empresa, this.imatge});

  factory Videojocs.fromJson(Map<String, dynamic> json) => Videojocs(
      id: json["id"],
      nom: json["nom"],
      empresa: json["empresa"],
      imatge: json["imatge"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "nom": nom, "empresa": empresa, "imatge": imatge};
}
