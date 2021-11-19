import 'package:flutter/material.dart';
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
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: Text('Telescope', style: TextStyles.header1.offWhite()),
          ),
        ),
      ),
    );
  }
}
