import 'package:flutter/material.dart';
import 'package:telescope/home/yexter_content.dart';

class YexterCard extends StatelessWidget {
  YexterContent _content;
  YexterCard(this._content);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(_content.name),
          Text(_content.jobTitle),
        ],
      ),
    );
  }
}
