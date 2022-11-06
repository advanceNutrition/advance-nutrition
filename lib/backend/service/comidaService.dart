import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:advance_nutrition/backend/model/comida.dart';

class ComidaService extends GetxService {
  //o banco de dados declarado como late sera inicializado na primeira leitura
  late Database db;

  Future<ComidaService> init() async {
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
            'CREATE TABLE comida (id INTEGER PRIMARY KEY, nome TEXT, quantidade DOUBLE, calorias DOUBLE, proteina DOUBLE, carboidratos DOUBLE, gordura DOUBLE)');
      },
      version: 1,
    );
  }

  // recuperar todas as notas
  Future<List<Comida>> getAll() async {
    final result = await db.rawQuery('SELECT * FROM comida ORDER BY id');
    print(result);
    return result.map((json) => Comida.fromJson(json)).toList();
  }

  //criar nova nota
  Future<Comida> save(Comida comida) async {
    final id = await db.rawInsert(
        'INSERT INTO comida (nome, quantidade, calorias, proteina, carboidratos, gordura) VALUES (?,?,?,?,?,?)',
        [comida.nome, comida.quantidade, comida.calorias, comida.proteina, comida.carboidratos, comida.gordura]);

    print(id);
    return comida.copy(id: id);
  }
//atualizar nota
  Future<Comida> update(Comida comida) async {
    final id = await db.rawUpdate(
        'UPDATE usuario SET nome = ?, quantidade = ?, calorias = ?, proteina = ?, carboidratos = ?, gordura = ? WHERE id = ?',
        [comida.nome, comida.quantidade, comida.calorias, comida.proteina, comida.carboidratos, comida.gordura]);

    print(id);
    return comida.copy(id: id);
  }

  //excluir nota
  Future<int> delete(int comidaID) async {
    final id = await db.rawDelete('DELETE FROM comida WHERE id = ?', [comidaID]);

    print(id);
    return id;
  }

  //fechar conexao com o banco de dados, funcao nao usada nesse app
  Future close() async {
    db.close();
  }
}

