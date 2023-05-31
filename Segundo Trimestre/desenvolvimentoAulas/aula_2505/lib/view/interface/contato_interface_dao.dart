import 'package:aula_2505/view/dto/contato.dart';

abstract class ContatoInterfaceDAO {
  Future<Contato> salvar(Contato contato);
  Future<bool> excluir(dynamic id);
  Future<Contato> consultar(int id);
  Future<List<Contato>> consultarTodos();
}
