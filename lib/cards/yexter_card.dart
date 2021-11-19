import 'package:flutter/material.dart';
import 'package:telescope/home/yexter_content.dart';
import 'package:telescope/style_guide/palette.dart';

class YexterCard extends StatelessWidget {
  final UNKNOWN_IMAGE_URL =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1084px-Unknown_person.jpg';
  final YexterContent _content;
  YexterCard(this._content);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.gray2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Image.network(
            _content.photoUrl ?? UNKNOWN_IMAGE_URL,
            width: 200,
            height: 200,
          ),
          Column(
            children: [
              Text(_content.name),
              Text(_content.jobTitle),
              Text(_content.managerName ?? 'UNKNOWN'),
            ],
          ),
        ],
      ),
    );
  }
}
