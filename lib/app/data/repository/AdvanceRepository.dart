import 'package:teste/lib/app/data/model/AdvanceModel.dart';
import 'package:teste/lib/app/data/provider/AdvanceProvider.dart';

class AdvanceRepository {
  final AdvanceProvider api;
  AdvanceRepository(this.api);

  getAll() {
    return api.getAll();
  }

  save(Advance advance) {
    return api.save(advance);
  }

  update(Advance advance) {
    return api.update(advance);
  }

  delete(int id) {
    return api.delete(id);
  }
}