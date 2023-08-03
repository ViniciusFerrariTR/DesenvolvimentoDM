import 'package:flutter/material.dart';

class EsqueciSenha extends StatelessWidget {
  const EsqueciSenha({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Esqueci minha senha',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "MOBA O.S",
                style: TextStyle(
                  fontSize: 60,
                  fontFamily: 'NomeDaFonte',
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 50),
              Container(
                width: 300,
                child: TextFormField(
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    "Enviar",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Código enviado com sucesso!"),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
