import '../services/gps_service.dart';

class MapaController {
  final GpsService _gpsService = GpsService();

  Future<Map<String, dynamic>> obterLocalizacao() async {
    return await _gpsService.getCurrentLocation();
  }
}