import 'package:flutter/material.dart';
import 'package:telescope/home/search_box.dart';
import 'package:telescope/home/search_content.dart';
import 'package:telescope/home/search_controller.dart';
import 'package:telescope/home/search_results.dart';

class SearchContainer extends StatelessWidget {
  final SearchController _controller;

  SearchContainer(SearchController controller) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment(0.0, -1.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 1000),
            child: StreamBuilder<SearchResults>(
              stream: _controller.resultStream,
              builder: (context, snapshot) {
                bool isAvailable = snapshot.data != null &&
                    snapshot.data?.status != SearchResultStatus.NOT_AVAILABLE;
                return AnimatedOpacity(
                  duration: Duration(
                      milliseconds: SearchController.animationDuration),
                  curve: Curves.easeOut,
                  opacity: isAvailable ? 1.0 : 0.0,
                  child: SearchContent(results: snapshot.data),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.0, -1.0),
          child: buildGradientBox(false),
        ),
        Align(
          alignment: Alignment(0.0, 1.0),
          child: buildGradientBox(true),
        ),
        Align(
          alignment: Alignment(0.0, -1.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 750),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 14.0,
                bottom: 24.0,
              ),
              child: SearchBox(_controller),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildGradientBox([bool reverse = false]) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: reverse ? Alignment.bottomCenter : Alignment.topCenter,
          end: reverse ? Alignment.topCenter : Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ),
      ),
    );
  }
}
