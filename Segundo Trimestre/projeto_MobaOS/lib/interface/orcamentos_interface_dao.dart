
import 'package:projeto_um/dto/Orcamentos.dart';

abstract class OrcamentosInterfaceDAO {
  Future<Orcamentos> aceitar(Orcamentos orcamentos);
  Future<bool> excluir(dynamic id);
  Future<Orcamentos> concluirAceitos(Orcamentos orcamentos);
  Future<List<Orcamentos>> consultar();
  Future<List<Orcamentos>> consultarTodos();
  Future<Orcamentos> salvar(Orcamentos orcamentos);

}
