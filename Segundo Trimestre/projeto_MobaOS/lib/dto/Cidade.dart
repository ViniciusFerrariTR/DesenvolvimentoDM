import 'package:projeto_um/dto/Estado.dart';

class Cidade {
  final dynamic id;
  final String nome;
  final Estado estado;
  Cidade({required this.id, required this.nome, required this.estado});

  @override
  bool operator ==(other) =>
      other is Cidade && other.nome == nome && other.id == id;

  @override
  String toString() {
    return '''
      $id
      $nome 
      ${estado.sigla} 
    ''';
  }
}
