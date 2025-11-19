import 'package:flutter/material.dart';

class MotoristaScreen extends StatelessWidget {
  const MotoristaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Motorista")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Área do Motorista",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("Aqui vão ficar as funções do motorista."),
          ],
        ),
      ),
    );
  }
}