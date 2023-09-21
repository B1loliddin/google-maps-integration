import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/presentation/pages/change_style_page.dart';
import 'package:google_maps_in_flutter/presentation/pages/get_current_location_page.dart';
import 'package:google_maps_in_flutter/presentation/pages/polygon_page.dart';
import 'package:google_maps_in_flutter/presentation/pages/polyline_page.dart';

class AllPages extends StatelessWidget {
  const AllPages({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToPage({required Widget page}) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => page,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Choose One')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => navigateToPage(page: const ChangeStylePage()),
              child: const Text('Change Style Page'),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => navigateToPage(page: const PolygonPage()),
              child: const Text('Polygone Page'),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => navigateToPage(page: const PolylinePage()),
              child: const Text('Polyline Page'),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () =>
                  navigateToPage(page: const GetCurrentLocationPage()),
              child: const Text('Get Current Location Page'),
            ),
          ],
        ),
      ),
    );
  }
}
