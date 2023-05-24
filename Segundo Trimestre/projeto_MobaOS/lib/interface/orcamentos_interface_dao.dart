
import 'package:projeto_um/dto/Orcamentos.dart';

abstract class OrcamentosInterfaceDAO {
  Orcamentos aceitar(Orcamentos orcamentos);
  bool excluir(dynamic id);
  Future<Orcamentos> consultar(int id);
  Future<List<Orcamentos>> consultarTodos();
}
