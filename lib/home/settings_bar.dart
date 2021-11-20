import 'package:flutter/material.dart';
import 'package:telescope/components/generic_button.dart';
import 'package:telescope/style_guide/palette.dart';

class SettingsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon(Icons.settings),
          icon(Icons.person),
        ],
      ),
    );
  }

  Widget icon(IconData iconData) {
    return GenericButton(
      onTap: () {},
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            iconData,
            color: Palette.offWhite,
            size: 34,
          ),
        ),
      ),
    );
  }
}
