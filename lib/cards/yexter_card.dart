import 'package:flutter/material.dart';
import 'package:telescope/home/yexter_content.dart';
import 'package:telescope/style_guide/palette.dart';

class YexterCard extends StatelessWidget {
  final YexterContent _content;
  YexterCard(this._content);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Palette.offWhite, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Text(_content.name),
          Text(_content.jobTitle),
        ],
      ),
    );
  }
}
