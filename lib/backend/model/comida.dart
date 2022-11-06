// To parse this JSON data, do
//
//     final advance = advanceFromJson(jsonString);
import 'dart:convert';

List<Comida> usuarioFromJson(String str) =>
    List<Comida>.from(json.decode(str).map((x) => Comida.fromJson(x)));

String comidaToJson(List<Comida> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comida {
  Comida({
    this.id,
    required this.nome,
    required this.quantidade,
    required this.calorias,
    required this.proteina,
    required this.carboidratos,
    required this.gordura
  });

  int? id;
  String nome;
  double quantidade;
  double calorias;
  double proteina;
  double carboidratos;
  double gordura;



  factory Comida.fromJson(Map<String, dynamic> json) => Comida(
    id: json["id"],
    nome: json["nome"],
    quantidade: json["quantidade"],
    calorias: json["calorias"],
    proteina: json["proteina"],
    carboidratos: json["carboidratos"],
    gordura: json["gordura"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nome": nome,
    "quantidade": quantidade,
    "calorias": calorias,
    "proteina": proteina,
    "carboidratos": carboidratos,
    "gordura": gordura,
  };

  Comida copy({
    int? id,
    String? nome,
    double? quantidade,
    double? calorias,
    double? proteina,
    double? carboidratos,
    double? gordura,
  }) =>
      Comida(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        quantidade: quantidade ?? this.quantidade,
        calorias: calorias ?? this.calorias,
        proteina: proteina ?? this.proteina,
        carboidratos: carboidratos ?? this.carboidratos,
        gordura: gordura ?? this.gordura,
      );
}