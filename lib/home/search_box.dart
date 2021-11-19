import 'package:flutter/material.dart';
import 'package:telescope/components/generic_button.dart';
import 'package:telescope/home/search_controller.dart';
import 'package:telescope/style_guide/palette.dart';
import 'package:telescope/style_guide/text_styles.dart';

class SearchBox extends StatelessWidget {
  final SearchController _controller;

  SearchBox(SearchController controller) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.offWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 6.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  controller: _controller.queryController,
                  autofocus: true,
                  cursorColor: Palette.gray10,
                  maxLines: 1,
                  style: TextStyles.textXL,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                  ),
                  onSubmitted: _controller.search,
                ),
              ),
            ),
            GenericButton(
              onTap: () {
                _controller.search(_controller.queryController.text);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.search,
                  size: 34,
                  color: Palette.gray10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
