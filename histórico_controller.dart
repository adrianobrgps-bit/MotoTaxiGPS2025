import '../services/historico_service.dart';

class HistoricoController {
  final HistoricoService _service = HistoricoService();

  Future<void> salvarCorrida(Map<String, dynamic> dadosCorrida) async {
    await _service.salvarHistorico(dadosCorrida);
  }

  Future<List<Map<String, dynamic>>> listarCorridas() async {
    return await _service.listarHistorico();
  }

  Future<void> limparHistorico() async {
    await _service.limparHistorico();
  }
}