import 'package:advance_nutrition/backend/model/usuario.dart';
import 'package:advance_nutrition/backend/model/comida.dart';
import 'package:advance_nutrition/backend/model/diario.dart';
import 'package:advance_nutrition/backend/application/provider.dart';

class Repository {
  final Provider api;
  Repository(this.api);
// USUARIO
  getAllUsuario() {
    return api.getAllUsuario();
  }

  saveUsuario(Usuario usuario) {
    return api.saveUsuario(usuario);
  }

  updateUsurio(Usuario usuario) {
    return api.updateUsurio(usuario);
  }

  deleteUsuario(int usuarioId) {
    return api.deleteUsuario(usuarioId);
  }

  // COMIDA
  getAllComida(){
    return api.getAllComida();
  }

  saveComida(Comida comida){
    return api.saveComida(comida);
  }
  
  updateComida(Comida comida){
    return api.updateComida(comida);
  }
  
  deleteComida(int comidaId){
    return api.deleteComida(comidaId);
  }

  getAllDiario(){
    return api.getAllDiario();
  }

  saveDiario(Diario diario){
    return api.saveDiario(diario);
  }

  updateDiario(Diario diario){
    return api.updateDiario(diario);
  }

  deleteDiario(int diarioId){
    return api.deleteDiario(diarioId);
  }

}