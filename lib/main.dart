import 'package:flutter/material.dart';
import 'package:telescope/home/home_screen.dart';
import 'package:telescope/style_guide/text_styles.dart';

void main() {
  runApp(TelescopeApp());
}

class TelescopeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telescope',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(body: HomeScreen()),
    );
  }
}
