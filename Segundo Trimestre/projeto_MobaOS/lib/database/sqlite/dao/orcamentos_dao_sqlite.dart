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
    String sql = 'UPDATE orcamentos SET statusOrcamento = ? WHERE id = ?';
    await db.rawUpdate(sql, ['ACEITO', orcamentos.id]);
    
    Orcamentos orcamentosAtualizado = Orcamentos(
      id: orcamentos.id,
      nome:orcamentos.nome,
      servico: orcamentos.servico,
      endereco: orcamentos.endereco,
      cidade: orcamentos.cidade,
      telefone: orcamentos.telefone,
      email: orcamentos.email,
      url_avatar: orcamentos.url_avatar,
      statusOrcamento: 'ACEITO',

    );

    return orcamentosAtualizado;
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
  Future<List<Orcamentos>> consultar() async {
    Database db = await Conexao.criar();
    List<Map<dynamic, dynamic>> resultadoBD = await db.query('orcamentos',
        where: 'statusOrcamento = ?', whereArgs: ['ACEITO']);
    List<Orcamentos> lista = [];
    for (var registro in resultadoBD) {
      var orcamentos = await converterOrcamentos(registro);
      lista.add(orcamentos);
    }
    return lista;
  }

  @override
  Future<List<Orcamentos>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Map<dynamic, dynamic>> resultadoBD = await db.query('orcamentos',
        where: 'statusOrcamento = ?', whereArgs: ['NAO_VERIFICADO']);
    List<Orcamentos> lista = [];
    for (var registro in resultadoBD) {
      var orcamentos = await converterOrcamentos(registro);
      lista.add(orcamentos);
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
    id: resultado['id'],
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