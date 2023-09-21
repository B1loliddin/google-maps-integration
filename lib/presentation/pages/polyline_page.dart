import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/core/service_locator.dart';
import 'package:google_maps_in_flutter/cubit/polyline_cubit/polyline_cubit.dart';

class PolylinePage extends StatefulWidget {
  const PolylinePage({super.key});

  @override
  State<PolylinePage> createState() => _PolylinePageState();
}

class _PolylinePageState extends State<PolylinePage> {
  @override
  void initState() {
    super.initState();
    polylineCubit.getPolyPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Polyline')),
      body: StreamBuilder<PolylineState>(
        initialData: polylineCubit.state,
        stream: polylineCubit.stream,
        builder: (context, snapshot) {
          return GoogleMap(
            polylines: {
              Polyline(
                polylineId: const PolylineId('1'),
                points: polylineCubit.state.polylinePoints,
                width: 5,
                color: Colors.purple,
              )
            },
            initialCameraPosition: const CameraPosition(
              target: LatLng(41.311081, 69.240562),
              zoom: 11,
            ),
          );
        },
      ),
    );
  }
}
