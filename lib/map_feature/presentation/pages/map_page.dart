import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../manager/map_page_controller.dart';

class MapPage extends GetView<MapPageController> {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: SafeArea(
          child: Stack(children: [_map(), _switchs(), _distance(context)]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: controller.getRoute,
          child: const Icon(Icons.alt_route, color: Colors.white),
        ),
      ),
    );
  }

  Obx _distance(BuildContext context) {
    return Obx(() {
      final distance = controller.getDistanceInKm();
      if (distance == null) return const SizedBox.shrink();

      return Positioned(
        bottom: 40,
        left: 20,
        right: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: Text(
                'فاصله تقریبی: ${distance.toStringAsFixed(2)} کیلومتر',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: Get.context ?? context,
                  builder: (context) => AlertDialog(
                    title: const Text('درخواست سفر'),
                    content: const Text('سفر با موفقیت پذیرفته شد'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('باشه'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('درخواست سفر'),
            ),
          ],
        ),
      );
    });
  }

  Positioned _switchs() {
    return Positioned(
      left: 5,
      top: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            GestureDetector(
              onTap: controller.determinePosition,
              child: Icon(Icons.gps_fixed_outlined, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: 5,
                height: 25,
                child: const VerticalDivider(color: Colors.blueGrey),
              ),
            ),
            GestureDetector(
              onTap: controller.startSelectingPoints,
              child: const Icon(Icons.start_outlined, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Obx _map() {
    return Obx(
      () => FlutterMap(
        mapController: controller.mapController,
        options: MapOptions(
          initialCenter: LatLng(51.5, -0.09),
          initialZoom: 13,
          onTap: (tapPos, point) => controller.onMapTapped(point),
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.map_sample_app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80,
                height: 80,
                point: controller.currentLocation.value ?? LatLng(51.5, -0.09),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              if (controller.startPoint.value != null)
                Marker(
                  point: controller.startPoint.value!,
                  width: 40,
                  height: 40,
                  child: const Icon(Icons.flag, color: Colors.green),
                ),
              if (controller.endPoint.value != null)
                Marker(
                  point: controller.endPoint.value!,
                  width: 40,
                  height: 40,
                  child: const Icon(Icons.flag, color: Colors.blue),
                ),
            ],
          ),
          if (controller.routePoints.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: controller.routePoints,
                  strokeWidth: 4,
                  color: Colors.blue,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
