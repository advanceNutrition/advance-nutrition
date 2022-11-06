import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:advance_nutrition/backend/model/diarioComida.dart';

class DiarioComidaService extends GetxService {
  //o banco de dados declarado como late sera inicializado na primeira leitura
  late Database db;

  Future<DiarioComidaService> init() async {
    db = await _getDatabase();
    //criar nota de teste
    // final Usuario = Usuario(
    //   title: 't1',
    //   content: 'c1',
    // );
    // await save(Usuario);
    // await getAll();
    return this;
  }

  Future<Database> _getDatabase() async {
    // Recupera pasta da aplicacao
    var databasesPath = await getDatabasesPath();
    // Recupera caminho da database e excluir database
    // String path = join(databasesPath, 'advances.db');
    // descomente o await abaixo para excluir a base de dados do caminho
    // recuperado pelo path na inicializacao
    // await deleteDatabase(path);
    // Retorna o banco de dados aberto
    return db = await openDatabase(
      join(databasesPath, 'advance.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE diarioComida (diarioId INTEGER PRIMARY KEY, comidaId INTEGER PRIMARY KEY)');
      },
      version: 1,
    );
  }

  // recuperar todas as notas
  Future<List<DiarioComida>> getAll() async {
    final result = await db.rawQuery('SELECT * FROM diarioComida ORDER BY id');
    print(result);
    return result.map((json) => DiarioComida.fromJson(json)).toList();
  }

  //criar nova nota
  Future<DiarioComida> save(DiarioComida diarioComida) async {
    final id = await db.rawInsert(
        'INSERT INTO diarioComida (diarioId, comidaId) VALUES (?,?)',
        [diarioComida.diarioId, diarioComida.comidaId]);

    print(id);
    return diarioComida.copy(diarioId: id);
  }

  //excluir nota
  Future<int> delete(int diarioComidaId) async {
    final id = await db.rawDelete('DELETE FROM diarioComida WHERE id = ?', [diarioComidaId]);

    print(id);
    return id;
  }

  //fechar conexao com o banco de dados, funcao nao usada nesse app
  Future close() async {
    db.close();
  }
}