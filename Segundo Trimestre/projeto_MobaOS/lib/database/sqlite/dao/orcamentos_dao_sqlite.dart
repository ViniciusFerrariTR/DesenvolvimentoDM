import 'package:projeto_um/database/sqlite/conexao.dart';
import 'package:projeto_um/database/sqlite/dao/cidade_dao_sqlite.dart';
import 'package:projeto_um/dto/Cidade.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
import 'package:projeto_um/interface/orcamentos_interface_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class OrcamentosDAOSQlite implements OrcamentosInterfaceDAO {
  @override
  Future<Orcamentos> aceitar(Orcamentos orcamentos) async {
    Database db = await Conexao.criar();
    String sql;
    /*
    if (orcamentos.id == null) {
      db.update('orcamentos',{'statusOrcamento': 'ACEITO'}, where: 'id = ?', whereArgs: [orcamentos.id],
      );
    }*/

    sql = 'UPDATE orcamentos SET statusOrcamento = \'ACEITO\' WHERE id = ?';
    await db.rawUpdate(sql, [
      orcamentos.id,
    ]);
    print('>>>>>aceitar ${orcamentos.id}');
    return orcamentos;
  }


  @override
  Future<Orcamentos> concluirAceitos(Orcamentos orcamentos) async {
    Database db = await Conexao.criar();
    String sql;
    if (orcamentos.id == null) {
      sql = 'UPDATE orcamentos SET orcamentoConcluido = CONCLUIDO WHERE id = ?';
      db.rawUpdate(sql, [
        orcamentos.statusOrcamento,
      ]);
    }
    return orcamentos;
  }

  @override
  Future<Orcamentos> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps = await db.query('orcamentos',
        where: 'statusOrcamento = ?',
        whereArgs: ['NAO_VERIFICADO']);
    if (maps.isEmpty) throw Exception("Não possui orcamentos em verificação");
    Map<dynamic, dynamic> resultado = maps.first;
    return converterOrcamentos(resultado);
  }

  @override
  Future<List<Orcamentos>> consultarTodos() async {
    Database db = await Conexao.criar();  
    List<Map<dynamic,dynamic>> resultadoBD = await db.query('orcamentos');
    List<Orcamentos> lista = [];
    for(var registro in resultadoBD){
      var contato = await converterOrcamentos(registro);
      lista.add(contato);
    }
    return lista;
  }


  @override
  Future<bool> excluir(dynamic id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM orcamentos WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

@override
Future<Orcamentos> salvar(Orcamentos orcamentos) async {
  Database db = await Conexao.criar();
  String sql;
  if (orcamentos.id == null) {
    sql =
        'INSERT INTO orcamentos (nome, servico, endereco, cidade_id, telefone, email, url_avatar) VALUES (?,?,?,?,?,?,?)';
    int id = await db.rawInsert(sql, [
      orcamentos.nome,
      orcamentos.servico,
      orcamentos.endereco,
      orcamentos.cidade.id,
      orcamentos.telefone,
      orcamentos.email,
      orcamentos.url_avatar,
    ]);
    orcamentos = Orcamentos(
      id: id,
      nome: orcamentos.nome,
      servico: orcamentos.servico,
      endereco: orcamentos.endereco,
      cidade: orcamentos.cidade,
      telefone: orcamentos.telefone,
      email: orcamentos.email,
      url_avatar: orcamentos.url_avatar,
    );
  } else {
    sql =
        'UPDATE orcamentos SET nome = ?, servico = ?, endereco = ?, cidade_id = ?, telefone = ?, email = ?, url_avatar = ? WHERE id = ?';
    await db.rawUpdate(sql, [
      orcamentos.nome,
      orcamentos.servico,
      orcamentos.endereco,
      orcamentos.cidade.id,
      orcamentos.telefone,
      orcamentos.email,
      orcamentos.url_avatar,
      orcamentos.id,
    ]);
  }
  return orcamentos;
}



Future<Orcamentos> converterOrcamentos(Map<dynamic, dynamic> resultado) async {
  Cidade cidade = await CidadeDAOSQLite().consultar(resultado['cidade_id']);
  return Orcamentos(
    nome: resultado['nome'],
    servico: resultado['servico'],
    endereco: resultado['endereco'],
    cidade: cidade,
    telefone: resultado['telefone'],
    email: resultado['email'],
    url_avatar: resultado['url_avatar'],
    orcamentoConcluido: resultado['orcamentoConcluido'],
    statusOrcamento: resultado['statusOrcamento'],
  );
}
}