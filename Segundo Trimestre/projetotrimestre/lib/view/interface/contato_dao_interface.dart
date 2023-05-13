import '../dto/contato.dart';
/* Foi feito uma inverção de dependencias, para não precisa mais de banco de dados para a implementação */
abstract class ContatoDAOInterface{
  Future<Contato> salvar(Contato contato);
  Future<List<Contato>> buscarTodos();
  Future<Contato> buscar(dynamic id);
  Future<Contato> alterar(Contato contato);
  Future<bool> excluir (dynamic id);
}