import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'polyline_state.dart';

class PolylineCubit extends Cubit<PolylineState> {
  PolylineCubit() : super(const PolylineInitialState());

  void getPolyPoints() async {
    emit(PolylineLoadingState(polylinePoints: state.polylinePoints));

    final List<LatLng> polylinePoints = [];
    final PolylinePoints points = PolylinePoints();
    final PolylineResult result = await points.getRouteBetweenCoordinates(
      'AIzaSyAMUS_eH_E0_qPzIuweJL_NWuRKoI8lj0w',
      const PointLatLng(
        41.311081,
        69.240562,
      ),
      const PointLatLng(
        39.652451,
        66.970139,
      ),
    );

    if (result.points.isNotEmpty) {
      for (PointLatLng point in result.points) {
        polylinePoints.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      emit(
        PolylineFailureState(
          polylinePoints: state.polylinePoints,
          message: 'We could not get points',
        ),
      );
    }
    emit(PolylineSuccessState(polylinePoints: polylinePoints));
  }
}
