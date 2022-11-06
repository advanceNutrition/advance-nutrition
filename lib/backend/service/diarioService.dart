import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:advance_nutrition/backend/model/diario.dart';

class DiarioService extends GetxService {
  //o banco de dados declarado como late sera inicializado na primeira leitura
  late Database db;

  Future<DiarioService> init() async {
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
            'CREATE TABLE diario (id INTEGER PRIMARY KEY, data DATE, usuarioId INTEGER FOREIGN KEY)');
      },
      version: 1,
    );
  }

  // recuperar todas as notas
  Future<List<Diario>> getAll() async {
    final result = await db.rawQuery('SELECT * FROM diario ORDER BY id');
    print(result);
    return result.map((json) => Diario.fromJson(json)).toList();
  }

  //criar nova nota
  Future<Diario> save(Diario diario) async {
    final id = await db.rawInsert(
        'INSERT INTO diario (data, usuarioId) VALUES (?,?)',
        [diario.data, diario.usuarioId]);

    print(id);
    return diario.copy(id: id);
  }
//atualizar nota
  Future<Diario> update(Diario diario) async {
    final id = await db.rawUpdate(
        'UPDATE diario SET data = ? WHERE id = ?',
        [diario.data]);

    print(id);
    return diario.copy(id: id);
  }

  //excluir nota
  Future<int> delete(int diarioId) async {
    final id = await db.rawDelete('DELETE FROM diario WHERE id = ?', [diarioId]);

    print(id);
    return id;
  }

  //fechar conexao com o banco de dados, funcao nao usada nesse app
  Future close() async {
    db.close();
  }
}