
import 'package:projetoaulas/Atividade_Aula_16-03-2023/pessoa.dart';

class Cliente extends Pessoa{
  String status;
  String? telefone;
  
  Cliente(
    {required super.nome, 
    required super.documento,
    required super.cidade,
    required this.status,
    this.telefone});
}