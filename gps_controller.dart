import 'package:geolocator/geolocator.dart';
import '../services/gps_service.dart';

class GpsController {
  final GpsService _gpsService = GpsService();

  /// Retorna a posição atual usando o service
  Future<Position?> getCurrentPosition() async {
    return await _gpsService.getCurrentPosition();
  }

  /// Stream para acompanhar a posição em tempo real
  Stream<Position> listenPosition() {
    return _gpsService.listenPosition();
  }

  /// Verifica permissões de GPS
  Future<bool> checkPermissions() async {
    return await _gpsService.checkPermissions();
  }
}