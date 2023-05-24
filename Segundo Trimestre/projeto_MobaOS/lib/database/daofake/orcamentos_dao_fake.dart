
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
  bool excluir(dynamic id) {
    print('excluir ${orcamento[id - 1]}');
    orcamento.remove(orcamento[id - 1]);
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
        urlAvatar: orcamentos.urlAvatar,
      );
      orcamento.add(orcamentos);
    } else {
      int i = (orcamentos.id as int) - 1;
      orcamento[i] = orcamentos;
    }
    print(orcamentos);
    return orcamentos;
  }
}
