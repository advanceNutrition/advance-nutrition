import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:advance_nutrition/backend/model/usuario.dart';

class UsuarioService extends GetxService {
  //o banco de dados declarado como late sera inicializado na primeira leitura
  late Database db;

  Future<UsuarioService> init() async {
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
            'CREATE TABLE usuario (id INTEGER PRIMARY KEY, nome TEXT, email TEXT, senha TEXT, altura TEXT, peso TEXT, idade TEXT, sexo TEXT, objetivo TEXT, calorias TEXT, atividade TEXT)');
      },
      version: 1,
    );
  }

  // recuperar todas as notas
  Future<List<Usuario>> getAll() async {
    final result = await db.rawQuery('SELECT * FROM usuario ORDER BY id');
    print(result);
    return result.map((json) => Usuario.fromJson(json)).toList();
  }

  //criar nova nota
  Future<Usuario> save(Usuario usuario) async {
    final id = await db.rawInsert(
        'INSERT INTO usuario (nome, email, senha, altura, peso, idade, sexo, objetivo, calorias, atividade) VALUES (?,?,?,?,?,?,?,?,?,?)',
        [usuario.nome, usuario.email, usuario.senha, usuario.altura, usuario.peso, usuario.idade, usuario.sexo, usuario.objetivo, usuario.calorias, usuario.atividade]);

    print(id);
    return usuario.copy(id: id);
  }
//atualizar nota
  Future<Usuario> update(Usuario usuario) async {
    final id = await db.rawUpdate(
        'UPDATE usuario SET nome = ?, email = ?, senha = ?, altura = ?, peso = ?, idade = ?, sexo = ?, objetivo = ?, calorias = ?, atividade = ? WHERE id = ?',
        [usuario.nome, usuario.email, usuario.senha, usuario.altura, usuario.peso, usuario.idade, usuario.sexo, usuario.objetivo, usuario.calorias, usuario.atividade, usuario.id]);

    print(id);
    return usuario.copy(id: id);
  }

  //excluir nota
  Future<int> delete(int usuarioId) async {
    final id = await db.rawDelete('DELETE FROM usuario WHERE id = ?', [usuarioId]);

    print(id);
    return id;
  }

  //fechar conexao com o banco de dados, funcao nao usada nesse app
  Future close() async {
    db.close();
  }
}