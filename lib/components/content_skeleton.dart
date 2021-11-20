import 'package:flutter/material.dart';
import 'package:telescope/style_guide/palette.dart';

class ContentSkeleton extends StatefulWidget {
  final int _columnCount;
  final double _height;

  ContentSkeleton({int columnCount = 1, double height = 175})
      : _columnCount = columnCount,
        _height = height;

  createState() => ContentSkeletonState();
}

class ContentSkeletonState extends State<ContentSkeleton>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  Animation? gradientPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);

    gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.linear),
    )..addListener(() {
        setState(() {});
      });

    _controller?.repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < widget._columnCount; i++) {
      items.add(Expanded(child: box()));
    }
    return Row(children: items);
  }

  Widget box() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: widget._height,
        decoration: BoxDecoration(
          color: Palette.gray2,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
