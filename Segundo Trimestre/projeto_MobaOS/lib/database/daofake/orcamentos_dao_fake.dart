
/*import 'package:flutter/material.dart';
import 'package:projeto_um/database/daofake/dados_fake.dart';
import 'package:projeto_um/dto/Orcamentos.dart';

import '../../interface/orcamentos_interface_dao.dart';

class OrcamentosDAOFake implements OrcamentosInterfaceDAO {
  @override
  Future<Orcamentos> consultar(int id) {
    return Future.value(orcamento[id - 1]);
  }

  @override
  Future<List<Orcamentos>> consultarTodos() {
    return Future.value(orcamento);
  }
  @override
  Future<List<Orcamentos>> consultarTodosAceitos() {
    return Future.value(orcamentosAceitos);
  }

  @override
  Future<bool> excluir(dynamic id) async {
    print('excluir ${orcamento[id - 1]}');
    orcamento.remove(orcamento[id - 1]);
    return true;
  }

  @override
  bool concluirAceitos(dynamic id) {
    print('excluir ${orcamentosAceitos[id - 1]}');
    orcamentosAceitos.remove(orcamentosAceitos[id - 1]);
    return true;
  }

  @override
  Orcamentos aceitar(Orcamentos orcamentos) {
    if (orcamentos.id == null) {
      orcamentos = Orcamentos(
        id: orcamento.length,
        nome: orcamentos.nome,
        servico: orcamentos.servico,
        endereco: orcamentos.endereco,
        telefone: orcamentos.telefone,
         email: orcamentos.email,
        urlAvatar: orcamentos.urlAvatar,
        statusOrcamento: StatusOrcamento.ACEITO
      );
      orcamento.remove(orcamentos);

    } else {
      orcamentos.statusOrcamento = StatusOrcamento.ACEITO;
      orcamentosAceitos.add(orcamentos);
    }
    print(orcamentos);
    return orcamentos;
  }
}
*/