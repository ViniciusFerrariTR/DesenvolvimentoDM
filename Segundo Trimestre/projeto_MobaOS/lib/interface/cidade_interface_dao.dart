import '../dto/Cidade.dart';

abstract class CidadeInterfaceDAO{
  Future<Cidade> salvar(Cidade cidade);
  Future<bool> excluir(Cidade cidade);
  Future<Cidade> consultar(int id);
  Future<List<Cidade>> consultarTodos();
}