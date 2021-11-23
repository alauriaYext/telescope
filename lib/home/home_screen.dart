import 'package:flutter/material.dart';
import 'package:telescope/home/search_box.dart';
import 'package:telescope/home/search_container.dart';
import 'package:telescope/home/search_result_content.dart';
import 'package:telescope/home/search_controller.dart';
import 'package:telescope/home/search_results.dart';
import 'package:telescope/home/settings_bar.dart';
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
        color: Palette.black,
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 35,
                child: Align(
                  alignment: Alignment.topCenter,
                  // child: SettingsBar(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/yext_logo_white.jpg',
                    width: 65,
                    height: 65,
                  ),
                  Container(width: 2.5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: SelectableText(
                      title,
                      style: TextStyles.header1.offWhite(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              StreamBuilder<SearchResults>(
                stream: _controller.resultStream,
                builder: (context, snapshot) {
                  bool isAvailable = snapshot.data != null &&
                      snapshot.data?.status != SearchResultStatus.NOT_AVAILABLE;
                  return AnimatedContainer(
                    duration: Duration(
                        milliseconds: SearchController.animationDuration),
                    curve: Curves.easeOut,
                    height: maxHeight * (isAvailable ? 0.9 : 0.55),
                    child: SearchContainer(_controller),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
