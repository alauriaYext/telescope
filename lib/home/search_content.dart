import 'package:flutter/material.dart';
import 'package:telescope/components/content_skeleton.dart';
import 'package:telescope/home/search_controller.dart';
import 'package:telescope/home/search_results.dart';

class SearchContent extends StatelessWidget {
  final SearchResults? _results;
  SearchContent({SearchResults? results})
      : _results = results;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    SearchResults results = _results ?? SearchResults.notAvailable();
    if (results.status == SearchResultStatus.LOADING) {
      items.add(ContentSkeleton(
        columnCount: 4,
        height: 125,
      ));
      items.add(ContentSkeleton());
      items.add(ContentSkeleton());
      items.add(ContentSkeleton(columnCount: 2));
      items.add(ContentSkeleton());
      items.add(ContentSkeleton(columnCount: 2));
      items.add(ContentSkeleton());
      items.add(ContentSkeleton());
      items.add(ContentSkeleton());
      items.add(ContentSkeleton());
      items.add(ContentSkeleton());
    }
    bool missing = results.status == SearchResultStatus.NOT_AVAILABLE;
    bool hidden = missing || results.status == SearchResultStatus.ANIMATING;
    return AnimatedOpacity(
      duration:
          Duration(milliseconds: SearchController.animationDuration ~/ 1.25),
      opacity: hidden ? 0.0 : 1.0,
      child: ListView(children: items),
    );
  }
}
