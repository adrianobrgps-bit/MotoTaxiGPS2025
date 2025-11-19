import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/cadastro_screen.dart';
import '../screens/motorista_screen.dart';
import '../screens/passageiro_screen.dart';
import '../screens/mapa_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case '/cadastro':
        return MaterialPageRoute(builder: (_) => const CadastroScreen());

      case '/motorista':
        return MaterialPageRoute(builder: (_) => const MotoristaScreen());

      case '/passageiro':
        return MaterialPageRoute(builder: (_) => const PassageiroScreen());

      case '/mapa':
        return MaterialPageRoute(builder: (_) => const MapaScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text("Rota não encontrada")),
            body: const Center(child: Text("Tela não existe")),
          ),
        );
    }
  }
}