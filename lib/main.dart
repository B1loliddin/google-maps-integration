import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/app.dart';
import 'package:google_maps_in_flutter/core/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  serviceLocator();

  runApp(const MyApp());
}
