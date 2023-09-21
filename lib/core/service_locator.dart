import 'package:google_maps_in_flutter/cubit/get_current_location_cubit/get_current_location_cubit.dart';
import 'package:google_maps_in_flutter/cubit/polyline_cubit/polyline_cubit.dart';

late GetCurrentLocationCubit getCurrentLocationCubit;
late PolylineCubit polylineCubit;

void serviceLocator() {
  getCurrentLocationCubit = GetCurrentLocationCubit();
  polylineCubit = PolylineCubit();
}
