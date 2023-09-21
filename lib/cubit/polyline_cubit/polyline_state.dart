part of 'polyline_cubit.dart';

@immutable
abstract class PolylineState {
  final List<LatLng> polylinePoints;

  const PolylineState({required this.polylinePoints});
}

class PolylineInitialState extends PolylineState {
  const PolylineInitialState() : super(polylinePoints: const []);
}

class PolylineSuccessState extends PolylineState {
  const PolylineSuccessState({required super.polylinePoints});
}

class PolylineFailureState extends PolylineState {
  final String message;

  const PolylineFailureState({
    required super.polylinePoints,
    required this.message,
  });
}

class PolylineLoadingState extends PolylineState {
  const PolylineLoadingState({required super.polylinePoints});
}
