// lib/src/services/tarifa_service.dart
// Lógica de cálculo das tarifas (normal + vermelha)

class TarifaService {
  // Parâmetros (padrão pedidos)
  static const double _base = 3.00;
  static const double _porKm = 0.50;
  static const double _porMin = 0.10;
  static const double _percentual = 0.15; // 15%
  static const double _fixo = 1.00;

  /// Calcula tarifa normal a partir de km e minutos.
  static double calcularNormal({required double km, required double minutos}) {
    final valor = _base + (km * _porKm) + (minutos * _porMin);
    return double.parse(valor.toStringAsFixed(2));
  }

  /// Calcula tarifa com acréscimo (15% ×1,15 + R$1,00) a partir do valor normal.
  static double calcularVermelha({required double valorNormal}) {
    final valor = (valorNormal * (1 + _percentual)) + _fixo;
    return double.parse(valor.toStringAsFixed(2));
  }

  /// Retorna um map com o detalhamento do cálculo da tarifa normal.
  static Map<String, dynamic> detalharNormal({required double km, required double minutos}) {
    final kmValor = (km * _porKm);
    final minValor = (minutos * _porMin);
    final total = calcularNormal(km: km, minutos: minutos);
    return {
      'base': _base,
      'km': km,
      'kmValor': double.parse(kmValor.toStringAsFixed(2)),
      'min': minutos,
      'minValor': double.parse(minValor.toStringAsFixed(2)),
      'total': total,
    };
  }

  /// Retorna um map com o detalhamento da tarifa vermelha (aplica sobre o normal).
  static Map<String, dynamic> detalharVermelha({required double valorNormal}) {
    final percentualValor = double.parse((valorNormal * _percentual).toStringAsFixed(2));
    final total = calcularVermelha(valorNormal: valorNormal);
    return {
      'normal': valorNormal,
      'percentual': _percentual,
      'percentualValor': percentualValor,
      'fixo': _fixo,
      'total': total,
    };
  }
}