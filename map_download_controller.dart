import 'package:latlong2/latlong.dart';
import '../services/map_offline_service.dart';

class MapDownloadController {
  final mapService = MapOfflineService.instance;

  // COORDENADAS das cidades que você pediu
  final areas = [
    // Demerval Lobão – PI
    {
      "sw": LatLng(-5.980, -42.010),
      "ne": LatLng(-5.850, -41.880),
    },

    // Teresina – PI
    {
      "sw": LatLng(-5.200, -42.950),
      "ne": LatLng(-5.000, -42.650),
    },

    // Lagoa do Piauí – PI
    {
      "sw": LatLng(-5.430, -42.750),
      "ne": LatLng(-5.320, -42.620),
    },

    // Chapadinha – PI
    {
      "sw": LatLng(-4.600, -43.400),
      "ne": LatLng(-4.400, -43.150),
    },
  ];

  Future<void> baixarTodasRegioes() async {
    for (var area in areas) {
      await mapService.downloadArea(
        southWest: area["sw"]!,
        northEast: area["ne"]!,
      );
    }
  }
}