import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/core/service_locator.dart';
import 'package:google_maps_in_flutter/presentation/pages/all_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  serviceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      home: const AllPages(),
    );
  }
}
