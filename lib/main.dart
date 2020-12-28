import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weatherapp/controller/theme.dart';
import 'package:weatherapp/screen/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(primaryColor: Colors.orange.shade700),
      home: MyHomePage(),
    );
  }
}
