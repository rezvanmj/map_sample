import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../manager/map_page_controller.dart';

class MapPage extends GetView<MapPageController> {
  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Obx(
                () => FlutterMap(
                  mapController: controller.mapController,
                  options: MapOptions(
                    initialCenter: LatLng(51.5, -0.09),
                    initialZoom: 13,
                    onTap: (tapPos, point) => controller.onMapTapped(point),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                      userAgentPackageName: 'com.example.map_sample_app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 80,
                          height: 80,
                          point:
                              controller.currentLocation.value ??
                              LatLng(51.5, -0.09),
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
              ),
              Positioned(
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
                        child: Icon(
                          Icons.gps_fixed_outlined,
                          color: Colors.white,
                        ),
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
                        child: const Icon(
                          Icons.start_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: controller.getRoute,
          child: const Icon(Icons.alt_route, color: Colors.white),
        ),
      ),
    );
  }
}
