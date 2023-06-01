import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final VoidCallback? salvar;
  final BuildContext context;
  const Botao({required this.salvar, required this.context, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: salvar,
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 255, 0, 0),
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
      ),
      child: const Text('Salvar Orçamento'),
    );
  }
}
