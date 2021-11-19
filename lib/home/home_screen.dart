import 'package:flutter/material.dart';
import 'package:telescope/home/search_box.dart';
import 'package:telescope/home/search_content.dart';
import 'package:telescope/home/search_controller.dart';
import 'package:telescope/home/search_results.dart';
import 'package:telescope/style_guide/palette.dart';
import 'package:telescope/style_guide/text_styles.dart';

class HomeScreen extends StatelessWidget {
  static const title = 'Telescope';
  final SearchController _controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      double maxHeight = constraints.maxHeight;
      return Container(
        color: Palette.gray10,
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 700),
            child: Column(
              children: [
                Spacer(flex: 45),
                SelectableText(
                  title,
                  style: TextStyles.header1.offWhite(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20.0,
                  ),
                  child: SearchBox(_controller),
                ),
                StreamBuilder<SearchResults>(
                  stream: _controller.resultStream,
                  builder: (context, snapshot) {
                    var status = snapshot.data == null
                        ? null
                        : snapshot.data!.status;
                    return AnimatedContainer(
                      duration: Duration(
                          milliseconds: SearchController.animationDuration),
                      height: status == null ? 0 : maxHeight * 0.7,
                      child: SearchContent(results: snapshot.data),
                    );
                  },
                ),
                Spacer(flex: 55),
              ],
            ),
          ),
        ),
      );
    });
  }
}
