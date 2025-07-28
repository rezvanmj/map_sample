import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_sample/map_feature/bindings/map_bindings.dart';

import 'map_feature/routes/edit_profile_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Map sample',
      initialRoute: '/map',
      initialBinding: MapBindings(),
      getPages: mapRoutes,
    );
  }
}
