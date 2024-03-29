import 'package:projeto_um/dto/Cidade.dart';

class Orcamentos {
  final dynamic id;
  final String nome;
  final String servico;
  final String endereco;
  final Cidade cidade;
  final String telefone;
  final String email;
  final String url_avatar;
  String? statusOrcamento;
  String? orcamentoConcluido;

  Orcamentos({
      this.id,
      required this.nome,
      required this.servico,
      required this.endereco,
      required this.cidade,
      required this.telefone,
      required this.email,
      required this.url_avatar,
      this.statusOrcamento,
      this.orcamentoConcluido
});

  @override
  String toString() {
    return '''
      $id
      $nome 
      $servico
      $endereco
      $cidade
      $telefone
      $email
      $url_avatar
      $statusOrcamento
      $orcamentoConcluido
    ''';
  }
}
