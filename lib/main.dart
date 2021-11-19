import 'package:flutter/material.dart';

void main() {
  runApp(TelescopeApp());
}

class TelescopeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telescope',
      theme: ThemeData(fontFamily: 'Andale Mono'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              'Telescope',
              style: TextStyle(
                color: Colors.white,
                fontSize: 55,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
