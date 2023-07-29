import '../dto/Usuario.dart';

abstract class UsuarioInterfaceDAO {
  Future<Usuario> salvar(Usuario usuario);
  Future<List<Usuario>> consultarTodos();
}
