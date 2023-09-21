import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonPage extends StatelessWidget {
  const PolygonPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<LatLng> polygonPoints = [
      LatLng(40.376919, 68.493941),
      LatLng(40.372418, 68.501211),
      LatLng(40.366706, 68.501211),
      LatLng(40.362552, 68.496326),
      LatLng(40.362552, 68.482467),
      LatLng(40.360388, 68.478491),
      LatLng(40.358090, 68.477146),
      LatLng(40.356314, 68.475463),
      LatLng(40.355231, 68.471948),
      LatLng(40.355231, 68.464552),
      LatLng(40.357471, 68.463682),
      LatLng(40.363487, 68.470242),
      LatLng(40.374500, 68.475802),
      LatLng(40.377296, 68.481584),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Polygone')),
      body: GoogleMap(
        polygons: {
          Polygon(
            polygonId: const PolygonId('1'),
            points: polygonPoints,
            fillColor: Colors.blue.shade100.withOpacity(0.5),
            strokeWidth: 2,
            strokeColor: Colors.black87,
          ),
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(40.365817, 68.478444),
          zoom: 13,
        ),
      ),
    );
  }
}
