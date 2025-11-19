// lib/src/services/gps_service.dart
import 'package:geolocator/geolocator.dart';

class GpsService {
  /// Pede permissões e retorna a posição atual (latitude, longitude)
  static Future<Position> getCurrentPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        throw Exception('Permissão de localização negada');
      }
    }
    final pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return pos;
  }

  /// Stream de posição para acompanhar o GPS em tempo real (se quiser)
  static Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.best, distanceFilter: 5),
    );
  }
}