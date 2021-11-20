import 'dart:io';

import 'package:flutter/material.dart';
import 'package:telescope/cards/search_result_card.dart';
import 'package:telescope/components/content_skeleton.dart';
import 'package:telescope/home/search_controller.dart';
import 'package:telescope/home/search_results.dart';

class SearchContent extends StatelessWidget {
  final SearchResults? _results;
  SearchContent({SearchResults? results}) : _results = results;

  @override
  Widget build(BuildContext context) {
    Widget content;
    SearchResults results = _results ?? SearchResults.notAvailable();
    switch (results.status) {
      case SearchResultStatus.LOADING:
        content = buildLoadingContent(context);
        break;
      case SearchResultStatus.AVAILABLE:
        content = buildResultContent(results);
        break;
      default:
        content = Container();
        break;
    }
    bool missing = results.status == SearchResultStatus.NOT_AVAILABLE;
    bool hidden = missing || results.status == SearchResultStatus.ANIMATING;
    return AnimatedOpacity(
      duration:
          Duration(milliseconds: SearchController.animationDuration ~/ 1.25),
      opacity: hidden ? 0.0 : 1.0,
      child: content,
    );
  }

  Widget buildLoadingContent(BuildContext context) {
    List<Widget> items = [];
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
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView(children: items),
    );
  }

  Widget buildResultContent(SearchResults results) {
    List<Widget> rows = [];
    List<Widget> currentRowItems = [];
    int itemsPerRow = isMobile() ? 1 : 2;
    for (SearchResult searchResult in results.results) {
      SearchResultCard card = SearchResultCard(searchResult);
      currentRowItems.add(Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: card,
        ),
      ));
      if (currentRowItems.length == itemsPerRow) {
        rows.add(Row(children: currentRowItems));
        currentRowItems = [];
      }
    }
    if (currentRowItems.length > 0) {
      rows.add(Row(children: currentRowItems));
    }
    return ListView(children: [Column(children: rows)]);
  }

  bool isMobile() {
    try {
      return !Platform.isMacOS && !Platform.isLinux && !Platform.isWindows;
    } catch (e) {
      return false;
    }
  }
}
