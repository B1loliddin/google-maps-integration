import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/core/service_locator.dart';
import 'package:google_maps_in_flutter/cubit/get_current_location_cubit/get_current_location_cubit.dart';

class GetCurrentLocationPage extends StatefulWidget {
  const GetCurrentLocationPage({super.key});

  @override
  State<GetCurrentLocationPage> createState() => _GetCurrentLocationPageState();
}

class _GetCurrentLocationPageState extends State<GetCurrentLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Current Location')),
      body: StreamBuilder<GetCurrentLocationState>(
        initialData: getCurrentLocationCubit.state,
        stream: getCurrentLocationCubit.stream,
        builder: (context, snapshot) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: getCurrentLocationCubit.state.currentLocation,
              zoom: 11.0,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('1'),
                position: getCurrentLocationCubit.state.currentLocation,
              ),
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: getCurrentLocationCubit.determinePosition,
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
