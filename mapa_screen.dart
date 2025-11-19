import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'map_download_screen.dart';

// IMPORTANTE: ativa o mapa offline
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({super.key});

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  @override
  void initState() {
    super.initState();

    // Inicializa o provedor offline do FMTC
    FMTC.instance('mapStore').manage.createAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: "Baixar mapa offline",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MapDownloadScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-5.8860, -42.6776), // Região Teresina
          zoom: 13.0,
        ),
        children: [

          /// AQUI ATIVA O MAPA OFFLINE DE VERDADE
          TileLayer(
            tileProvider: FMTC.instance('mapStore').getTileProvider(),
          ),

        ],
      ),
    );
  }
}