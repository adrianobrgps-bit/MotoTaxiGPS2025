import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:latlong2/latlong.dart';

class MapaOfflineScreen extends StatefulWidget {
  const MapaOfflineScreen({super.key});

  @override
  State<MapaOfflineScreen> createState() => _MapaOfflineScreenState();
}

class _MapaOfflineScreenState extends State<MapaOfflineScreen> {
  final mapController = MapController();
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    _loadOfflineTiles();
  }

  Future<void> _loadOfflineTiles() async {
    await FMTC.instance('mototaxi_cache').manage.create();  
    setState(() => loaded = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mapa Offline")),
      body: loaded == false
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              mapController: mapController,
              options: MapOptions(
                center: LatLng(-23.55, -46.63), // Ajustável para seu GPS depois
                zoom: 14.5,
                minZoom: 5,
                maxZoom: 18,
              ),
              children: [
                TileLayer(
                  urlTemplate: 
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  tileProvider: FMTC.instance('mototaxi_cache')
                      .getTileProvider(),
                ),
              ],
            ),
    );
  }
}