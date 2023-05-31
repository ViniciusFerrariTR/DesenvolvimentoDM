import 'package:flutter/material.dart';
import 'package:projeto_um/dto/Orcamentos.dart';
class FotoContatoAceitos extends StatelessWidget {
  final Orcamentos orcamentosAceitos;
  const FotoContatoAceitos({required this.orcamentosAceitos, Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = orcamentosAceitos.urlAvatar;
    return (Uri.tryParse(url)!.isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : const CircleAvatar(child: Icon(Icons.person));
  }
}
