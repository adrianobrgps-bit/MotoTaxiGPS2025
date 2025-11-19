import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';

class MapOfflineService {
  static final instance = MapOfflineService();

  final store = FMTC.instance('mototaxi_offline_cache');

  Future<void> init() async {
    await FMTC.init(); // inicializa o sistema de cache
  }

  /// Baixar tiles de uma área (retângulo)
  Future<void> downloadArea({
    required LatLng southWest,
    required LatLng northEast,
    int minZoom = 10,
    int maxZoom = 17,
  }) async {
    await store.manage.createAsync(
      bounds: LatLngBounds(southWest, northEast),
      minZoom: minZoom,
      maxZoom: maxZoom,
    );
  }

  /// Indica ao mapa que deve usar tiles offline
  void enableOfflineMode() {
    FMTCSettings.instance.global.enableLogs = true;
  }
}