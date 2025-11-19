import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/cadastro_screen.dart';
import '../screens/motorista_screen.dart';
import '../screens/passageiro_screen.dart';
import '../screens/mapa_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String cadastro = '/cadastro';
  static const String motorista = '/motorista';
  static const String passageiro = '/passageiro';
  static const String mapa = '/mapa';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    cadastro: (context) => const CadastroScreen(),
    motorista: (context) => const MotoristaScreen(),
    passageiro: (context) => const PassageiroScreen(),
    mapa: (context) => const MapaScreen(),
  };
}