import 'package:flutter/material.dart';
import '../services/tarifa_service.dart';

class TarifaController extends ChangeNotifier {
  final TarifaService _service = TarifaService();

  double km = 0.0;
  double min = 0.0;

  double tarifaNormal = 0.0;
  double tarifaComAdicional = 0.0;

  /// Atualiza KM digitado
  void setKm(double value) {
    km = value;
    notifyListeners();
  }

  /// Atualiza Min digitado
  void setMin(double value) {
    min = value;
    notifyListeners();
  }

  /// Calcula as duas tarifas
  void calcular() {
    final result = _service.calcularTarifa(km: km, minutos: min);

    tarifaNormal = result["tarifa_normal"];
    tarifaComAdicional = result["tarifa_15"];

    notifyListeners();
  }

  /// Limpa todos os valores
  void reset() {
    km = 0.0;
    min = 0.0;
    tarifaNormal = 0.0;
    tarifaComAdicional = 0.0;

    notifyListeners();
  }
}