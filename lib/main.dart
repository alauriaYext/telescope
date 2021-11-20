import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telescope/home/home_screen.dart';
import 'package:telescope/style_guide/palette.dart';

void main() {
  runApp(TelescopeApp());
}

class TelescopeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Telescope',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Palette.black,
          child: HomeScreen(),
        ),
      ),
    );
  }
}
