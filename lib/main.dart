import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final MapController mc = MapController()
    ..mapEventStream.listen(
      (event) => print(event.camera.visibleBounds.north),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telo'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mc,
            options: const MapOptions(
              initialCenter: LatLng(-7.7691284398291245, 112.19649791645196),
              initialZoom: 9.2,
            ),
            children: [
              TileLayer(
                // Bring your own tiles
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                userAgentPackageName:
                    'com.example.a  pp', // Add your app identifier
                // And many more recommended properties!
              ),

              MarkerLayer(markers: [
                Marker(
                    point: LatLng(-7.7691284398291245, 112.19649791645196),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                    )),
                Marker(
                    point: LatLng(-7.7651284398291243, 112.19649791645196),
                    child: InkWell(
                      onTap: () => ScaffoldMessenger.of(context)
                        ..clearSnackBars()
                        ..showSnackBar(SnackBar(content: Text('Telo'))),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),
                    )),
                Marker(
                    point: LatLng(-7.7691284398291245, 112.19249791645180),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    )),
              ]),

              // RichAttributionWidget( // Include a stylish prebuilt attribution widget that meets all requirments
              //   attributions: [
              //     TextSourceAttribution(
              //       'OpenStreetMap contributors',
              //       onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
              //     ),
              //     // Also add images...
              //   ],
              // ),
            ],
          ),
          Positioned(
              child: ElevatedButton(
                  onPressed: () => mc.rotate(0), child: Icon(Icons.north)))
        ],
      ),
    );
  }
}
