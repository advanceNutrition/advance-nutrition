// To parse this JSON data, do
//
//     final advance = advanceFromJson(jsonString);

import 'dart:convert';

List<Advance> advanceFromJson(String str) =>
    List<Advance>.from(json.decode(str).map((x) => Advance.fromJson(x)));

String advanceToJson(List<Advance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Advance {
  Advance({
    this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.altura,
    required this.peso,
    required this.idade,
    required this.sexo,
    required this.objetivo,
    required this.calorias,
    required this.atividade,
  });

  int? id;
  String nome;
  String email;
  String senha;
  String altura;
  String peso;
  String idade;
  String sexo;
  String objetivo;
  String calorias;
  String atividade;


  factory Advance.fromJson(Map<String, dynamic> json) => Advance(
    id: json["id"],
    nome: json["nome"],
    email: json["email"],
    senha: json["senha"],
    altura: json["altura"],
    peso: json["peso"],
    idade: json["idade"],
    sexo: json["sexo"],
    objetivo: json["objetivo"],
    calorias: json["calorias"],
    atividade: json["atividade"],
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "nome": nome,
  "email": email,
  "senha": senha,
  "altura": altura,
  "peso": peso,
  "idade": idade,
  "sexo":sexo,
  "objetivo": objetivo,
  "calorias": calorias,
  "atividade": atividade,

};

Advance copy({
  int? id,
  String? nome,
  String? email,
  String? senha,
  String? altura,
  String? peso,
  String? idade,
  String? sexo,
  String? objetivo,
  String? calorias,
  String? atividade,

}) =>
    Advance(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      altura: altura ?? this.altura,
      peso: peso ?? this.peso,
      idade: idade ?? this.idade,
      sexo:sexo ?? this.sexo,
      objetivo: objetivo ?? this.objetivo,
      calorias: calorias ?? this.calorias,
      atividade: atividade ?? this.atividade,
    );
}