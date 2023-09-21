import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChangeStylePage extends StatefulWidget {
  const ChangeStylePage({super.key});

  @override
  State<ChangeStylePage> createState() => _ChangeStylePageState();
}

class _ChangeStylePageState extends State<ChangeStylePage> {
  late final GoogleMapController mapController;
  String mapStyle = '';

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context)
        .loadString('assets/map_style/standard_style.json')
        .then((value) => mapStyle = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Style'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String path) async {
              mapStyle = await DefaultAssetBundle.of(context).loadString(path);
              mapController.setMapStyle(mapStyle);
            },
            itemBuilder: (_) {
              return [
                const PopupMenuItem(
                  value: 'assets/map_style/standard_style.json',
                  child: Text('Standard'),
                ),
                const PopupMenuItem(
                  value: 'assets/map_style/silver_style.json',
                  child: Text('Silver'),
                ),
                const PopupMenuItem(
                  value: 'assets/map_style/retro_style.json',
                  child: Text('Retro'),
                ),
                const PopupMenuItem(
                  value: 'assets/map_style/dark_style.json',
                  child: Text('Dark'),
                ),
                const PopupMenuItem(
                  value: 'assets/map_style/night_style.json',
                  child: Text('Night'),
                ),
                const PopupMenuItem(
                  value: 'assets/map_style/aubergine_style.json',
                  child: Text('Aubergine'),
                ),
              ];
            },
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          mapController.setMapStyle(mapStyle);
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(41.311081, 69.240562),
          zoom: 10,
        ),
      ),
    );
  }
}
