import 'dart:async';
import 'package:advance_nutrition/backend/service/comidaService.dart';
import 'package:advance_nutrition/backend/service/diarioService.dart';
import 'package:get/get.dart';
import 'package:advance_nutrition/backend/model/usuario.dart';
import 'package:advance_nutrition/backend/service/usuarioService.dart';
import 'package:advance_nutrition/backend/model/usuario.dart';
import 'package:advance_nutrition/backend/model/comida.dart';
import 'package:advance_nutrition/backend/model/diario.dart';

class Provider {

  final usuarioService = Get.find<UsuarioService>();
  final comidaService = Get.find<ComidaService>();
  final diarioService = Get.find<DiarioService>();


  //USUARIO SERVICE
  Future<List<Usuario>> getAllUsuario() async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    // await Future.delayed(Duration(seconds: 2));
    return await usuarioService.getAll();
  }

  Future<Usuario> saveUsuario(Usuario usuario) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await usuarioService.save(usuario);
  }

  Future<Usuario> updateUsurio(Usuario usuario) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await usuarioService.update(usuario);
  }

  Future<int> deleteUsuario(int usuarioId) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await usuarioService.delete(usuarioId);
  }
  //--------------------------------------------------------------------------

  // COMIDA SERVICE
  Future<List<Comida>> getAllComida() async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    // await Future.delayed(Duration(seconds: 2));
    return await comidaService.getAll();
  }

  Future<Comida> saveComida(Comida comida) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await comidaService.save(comida);
  }

  Future<Comida> updateComida(Comida comida) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await comidaService.update(comida);
  }

  Future<int> deleteComida(int comidaId) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await comidaService.delete(comidaId);
  }
//--------------------------------------------------------------------------
// DIARIO ALIMENTAR SERVICE
  Future<List<Diario>> getAllDiario() async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    // await Future.delayed(Duration(seconds: 2));
    return await diarioService.getAll();
  }

  Future<Diario> saveDiario(Diario diario) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await diarioService.save(diario);
  }

  Future<Diario> updateDiario(Diario diario) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await diarioService.update(diario);
  }

  Future<int> deleteDiario(int diarioId) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await diarioService.delete(diarioId);
  }
}