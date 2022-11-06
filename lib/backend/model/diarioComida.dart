// To parse this JSON data, do
//
//     final advance = advanceFromJson(jsonString);
import 'dart:convert';

List<DiarioComida> diarioFromJson(String str) =>
    List<DiarioComida>.from(json.decode(str).map((x) => DiarioComida.fromJson(x)));

String diarioToJson(List<DiarioComida> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiarioComida {
  DiarioComida({
    required this.diarioId,
    required this.comidaId,

  });

  int diarioId;
  int comidaId;



  factory DiarioComida.fromJson(Map<String, dynamic> json) => DiarioComida(
    diarioId: json["diarioId"],
    comidaId: json["comidaId"],

  );

  Map<String, dynamic> toJson() => {
    "diarioId": diarioId,
    "comidaId": comidaId,
  };

  DiarioComida copy({
    int? diarioId,
    int? comidaId,

  }) =>
      DiarioComida(
        diarioId: diarioId ?? this.diarioId,
        comidaId: comidaId ?? this.comidaId,
      );
}