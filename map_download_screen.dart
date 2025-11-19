import 'package:flutter/material.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';

class MapDownloadScreen extends StatefulWidget {
  const MapDownloadScreen({super.key});

  @override
  State<MapDownloadScreen> createState() => _MapDownloadScreenState();
}

class _MapDownloadScreenState extends State<MapDownloadScreen> {
  bool baixando = false;
  String status = "Aguardando download...";

  // ÁREAS DO MAPA QUE SERÃO BAIXADAS
  // (Teresina, Demerval, Lagoa do Piauí, Chapadinha-PI)
  final List<Map<String, dynamic>> areas = [
    {
      "nome": "Teresina - PI",
      "minZoom": 5.0,
      "maxZoom": 16.0,
      "bounds": LatLngBounds.fromPoints([
        LatLng(-5.02, -42.95),
        LatLng(-5.25, -42.70),
      ]),
    },
    {
      "nome": "Demerval Lobão - PI",
      "minZoom": 5.0,
      "maxZoom": 16.0,
      "bounds": LatLngBounds.fromPoints([
        LatLng(-5.34, -42.02),
        LatLng(-5.45, -41.95),
      ]),
    },
    {
      "nome": "Lagoa do Piauí - PI",
      "minZoom": 5.0,
      "maxZoom": 16.0,
      "bounds": LatLngBounds.fromPoints([
        LatLng(-5.41, -42.65),
        LatLng(-5.48, -42.59),
      ]),
    },
    {
      "nome": "Chapadinha - PI",
      "minZoom": 5.0,
      "maxZoom": 16.0,
      "bounds": LatLngBounds.fromPoints([
        LatLng(-5.43, -42.57),
        LatLng(-5.51, -42.50),
      ]),
    },
  ];

  Future<void> baixarMapa() async {
    setState(() {
      baixando = true;
      status = "Iniciando download...";
    });

    final store = FMTCStore('mototaxi_cache');
    await store.manage.create();

    for (var area in areas) {
      setState(() {
        status = "Baixando: ${area['nome']}...";
      });

      await store.download.region(
        area['bounds'],
        area['minZoom'],
        area['maxZoom'],
        options: const DownloadOptions(
          threadCount: 4,
          skipExistingTiles: true,
        ),
      );
    }

    setState(() {
      baixando = false;
      status = "✅ MAPA OFFLINE INSTALADO COM SUCESSO!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Baixar Mapa Offline")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              status,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: baixando ? null : baixarMapa,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: Text(
                baixando ? "Baixando..." : "⬇️ Baixar Mapa Offline",
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}