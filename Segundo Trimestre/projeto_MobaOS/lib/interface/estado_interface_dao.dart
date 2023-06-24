import '../dto/Estado.dart';

abstract class EstadoInterfaceDAO {
  Future<Estado> salvar(Estado estado);
  Future<bool> excluir(dynamic id);
  Future<Estado> consultar(int id);
  Future<List<Estado>> consultarTodos();
}
