import 'package:flutter/material.dart';

class PerfilAdmin extends StatelessWidget {
  const PerfilAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 238, 255, 1),
        title: const Text('Perfil de Admin',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

