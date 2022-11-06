// To parse this JSON data, do
//
//     final advance = advanceFromJson(jsonString);
import 'dart:convert';

List<Diario> diarioFromJson(String str) =>
    List<Diario>.from(json.decode(str).map((x) => Diario.fromJson(x)));

String diarioToJson(List<Diario> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Diario {
  Diario({
    this.id,
    required this.data,
    required this.usuarioId,

  });

  int? id;
  String data;
  int usuarioId;



  factory Diario.fromJson(Map<String, dynamic> json) => Diario(
    id: json["id"],
    data: json["data"],
    usuarioId: json["usuarioId"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data": data,
    "usuarioId": usuarioId,

  };

  Diario copy({
    int? id,
    String? data,
    int? usuarioId,

  }) =>
      Diario(
        id: id ?? this.id,
        data: data ?? this.data,
        usuarioId: usuarioId ?? this.usuarioId,
      );
}