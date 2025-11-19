import 'package:flutter/material.dart';

class PassageiroScreen extends StatelessWidget {
  const PassageiroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Passageiro")),
      body: const Center(
        child: Text(
          "Tela do Passageiro",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}