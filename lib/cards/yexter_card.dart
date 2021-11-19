import 'package:flutter/material.dart';
import 'package:telescope/home/yexter_content.dart';
import 'package:telescope/style_guide/palette.dart';

class YexterCard extends StatelessWidget {
  YexterContent _content;
  YexterCard(this._content);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.offWhite,
      child: Column(
        children: [
          Text(_content.name),
          Text(_content.jobTitle),
        ],
      ),
    );
  }
}
