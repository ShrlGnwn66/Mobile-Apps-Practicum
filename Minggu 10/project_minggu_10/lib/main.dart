import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_minggu_10/get_data.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: pageOne(),
      // getPages : pageRouteApp.pages
      home: GetDataScreen(),
    );
  }
}
