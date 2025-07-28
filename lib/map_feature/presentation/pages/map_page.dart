import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapController _mapController;
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _determinePosition(); // Optional: auto fetch on load
  }

  @override
  dispose() {
    super.dispose();

    _mapController.dispose();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) return;

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    LatLng currentLatLng = LatLng(position.latitude, position.longitude);

    setState(() {
      _currentLocation = currentLatLng;
    });

    _mapController.move(currentLatLng, 15); // Zoom into current location
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_map(), _locationAndShare(context)]);
  }

  Widget _locationAndShare(BuildContext context) {
    return Positioned(
      left: 5,
      top: 10,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Icon(Icons.share),
                VerticalDivider(),
                GestureDetector(
                  onTap: _determinePosition,
                  child: Icon(
                    Icons.gps_fixed_outlined,
                    color: Theme.of(context).colorScheme.primaryFixed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FlutterMap _map() {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: LatLng(51.5, -0.09),
        initialZoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.map_sample_app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: _currentLocation ?? LatLng(51.5, -0.09),
              child: Icon(Icons.location_pin, color: Colors.red, size: 40),
            ),
          ],
        ),
      ],
    );
  }
}
