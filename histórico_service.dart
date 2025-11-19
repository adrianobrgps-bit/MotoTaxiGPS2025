import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HistoricoService {
  static const String _keyHistorico = "historico_corridas";

  /// Modelo de corrida para salvar
  Map<String, dynamic> criarRegistro({
    required double km,
    required double minutos,
    required double tarifaNormal,
    required double tarifaComPercentual,
    required DateTime data,
  }) {
    return {
      "km": km,
      "minutos": minutos,
      "tarifaNormal": tarifaNormal,
      "tarifaCom15": tarifaComPercentual,
      "data": data.toIso8601String(),
    };
  }

  /// Salvar corrida no histórico
  Future<void> salvarRegistro(Map<String, dynamic> corrida) async {
    final prefs = await SharedPreferences.getInstance();

    // pega todos os registros salvos
    final listaAtual = await listarHistorico();

    // adiciona o novo
    listaAtual.add(corrida);

    // salva de novo convertendo em JSON
    await prefs.setString(_keyHistorico, jsonEncode(listaAtual));
  }

  /// Listar todo o histórico salvo
  Future<List<Map<String, dynamic>>> listarHistorico() async {
    final prefs = await SharedPreferences.getInstance();

    final dados = prefs.getString(_keyHistorico);

    if (dados == null) return [];

    final List lista = jsonDecode(dados);

    return lista.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  /// Apagar todo o histórico
  Future<void> limparHistorico() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyHistorico);
  }
}