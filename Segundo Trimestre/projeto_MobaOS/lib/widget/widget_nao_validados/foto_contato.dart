import 'package:flutter/material.dart';
import 'package:projeto_um/dto/Orcamentos.dart';

class FotoOrcamentos extends StatelessWidget {
  final Orcamentos orcamentos;
  final double? raio;
  const FotoOrcamentos({
    required this.orcamentos,
    this.raio,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = orcamentos.url_avatar;
    return (Uri.tryParse(url)!.isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : const CircleAvatar(
            child: Icon(Icons.person),
          );
  }
}
