import 'package:flutter/material.dart';
import 'package:projeto_um/dto/Orcamentos.dart';

class FotoContato extends StatelessWidget {
  final Orcamentos orcamentos;
  const FotoContato({required this.orcamentos, Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = orcamentos.url_avatar;
    return (Uri.tryParse(url)!.isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : const CircleAvatar(child: Icon(Icons.person));
  }
}
