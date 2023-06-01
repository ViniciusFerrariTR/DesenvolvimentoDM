import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:projeto_um/database/daofake/dados_fake.dart';
import 'package:projeto_um/database/sqlite/conexao.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
import 'package:projeto_um/interface/orcamentos_interface_dao.dart';
import 'package:projeto_um/telas/OrcamentosForm.dart';
import 'package:sqflite/sqlite_api.dart';

class OrcamentosDAOSQlite implements OrcamentosInterfaceDAO {
  @override
  Future<Orcamentos> aceitar(Orcamentos orcamentos) async {
    Database db = await Conexao.criar();
    String sql;
    if (orcamentos.id == null) {
      sql = 'UPDATE orcamentos SET statusOrcamento = ACEITO WHERE id = ?';
      db.rawUpdate(sql, [
        orcamentos.statusOrcamento,
      ]);
    }
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
        where: 'statusOrcamento = NAO_VERIFICADO',
        whereArgs: [StatusOrcamento]);
    if (maps.isEmpty) throw Exception("Não possui orcamentos em verificação");
    Map<dynamic, dynamic> resultado = maps.first;
    return converterOrcamentos(resultado);
  }

  @override
  Future<List<Orcamentos>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Orcamentos> lista = (await db.query('orcamentos'))
        .map<Orcamentos>(converterOrcamentos)
        .toList();
    return lista;
  }

  @override
  Future<List<Orcamentos>> consultarTodosAceitos() async {
    Database db = await Conexao.criar();
    List<Orcamentos> listaAceitos = (await db.query('orcamentosAceitos',
        where: 'orcamentoConcluido = EM_ANDAMENTO',
        whereArgs: [OrcamentoConcluido]))
        .map<Orcamentos>(converterOrcamentos)
        .toList();
    return listaAceitos;
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
      sql = 'INSERT INTO orcamentos (nome, servico, endereco, telefone, email, urlAvatar, orcamentoConcluido, statusOrcamento) VALUES (?,?,?,?,?,?,EM_ANDAMENTO,NAO_VERIFICADO)';
      int id = await db.rawInsert(sql, [
        orcamentos.nome,
        orcamentos.servico,
        orcamentos.endereco,
        orcamentos.telefone,
        orcamentos.email,
        orcamentos.urlAvatar,
        orcamentos.orcamentoConcluido,
        orcamentos.statusOrcamento,
      ]);
      orcamentos = Orcamentos(
        id: id,
        nome: orcamentos.nome, 
        servico: orcamentos.servico, 
        endereco: orcamentos.endereco, 
        telefone: orcamentos.telefone, 
        email: orcamentos.email, 
        urlAvatar: orcamentos.urlAvatar,
        orcamentoConcluido: orcamentos.orcamentoConcluido,
        statusOrcamento: orcamentos.statusOrcamento,);
    } else {
      sql = 'UPDATE orcamentos SET nome = ?, servico = ?, endereco = ?, telefone = ?, email = ?, urlAvatar = ?, orcamentoConcluido = EM_ANDAMENTO, statusOrcamento = NAO_VERIFICADO WHERE id = ?';
      db.rawUpdate(sql, [
        orcamentos.nome,
        orcamentos.servico,
        orcamentos.endereco,
        orcamentos.telefone,
        orcamentos.email,
        orcamentos.urlAvatar,
        orcamentos.orcamentoConcluido,
        orcamentos.statusOrcamento,
      ]);
    }
    return orcamentos;
  }




Orcamentos converterOrcamentos(Map<dynamic, dynamic> resultado) {
  return Orcamentos(
      nome: resultado['id'],
      servico: resultado['servico'],
      endereco: resultado['endereco'],
      telefone: resultado['telefone'],
      email: resultado['email'],
      urlAvatar: resultado['urlAvatar'],
      orcamentoConcluido: resultado['orcamentoConcluido'],
      statusOrcamento: resultado['statusOrcamento']);
}

}