import 'package:flutter/material.dart';
import 'package:cimilo_sheeg/Screans/home.dart';

void main() {
  runApp(CimilosheegApp());
}

class CimilosheegApp extends StatelessWidget {
  final String AppName = 'Cimilo sheeg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppName,
      theme: ThemeData.dark(),
      home: HomeScrean(title: AppName),
    );
  }
}
