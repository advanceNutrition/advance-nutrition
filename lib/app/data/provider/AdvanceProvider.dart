import 'package:get/get.dart';
import 'package:teste/lib/app/data/model/AdvanceModel.dart';
import 'package:teste/lib/app/db/AdvancesService.dart';

class AdvanceProvider {
  final advancesService = Get.find<AdvanceService>();

  Future<List<Advance>> getAll() async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    // await Future.delayed(Duration(seconds: 2));
    return await advancesService.getAll();
  }

  Future<Advance> save(Advance advance) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await advancesService.save(advance);
  }

  Future<Advance> update(Advance advance) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await advancesService.update(advance);
  }

  Future<int> delete(int advanceId) async {
    //descomente a linha abaixo para simular um tempo maior de resposta
    await Future.delayed(Duration(seconds: 2));
    return await advancesService.delete(advanceId);
  }
}