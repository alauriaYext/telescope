import 'dart:math';

import 'package:flutter/material.dart';
import 'package:telescope/cards/search_result_card.dart';
import 'package:telescope/components/content_skeleton.dart';
import 'package:telescope/home/search_controller.dart';
import 'package:telescope/home/search_results.dart';
import 'package:telescope/style_guide/text_styles.dart';

class SearchResultContent extends StatelessWidget {
  final SearchResults? _results;
  SearchResultContent({SearchResults? results}) : _results = results;

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
    items.add(ContentSkeleton(columnCount: 4));
    items.add(ContentSkeleton());
    items.add(ContentSkeleton(columnCount: 2));
    items.add(ContentSkeleton());
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
      child: ListView(
        padding: buildListPadding(),
        children: items,
      ),
    );
  }

  Widget buildResultContent(SearchResults results) {
    if (results.results.isEmpty) {
      return Align(
        alignment: Alignment(0.0, -0.2),
        child: Text(
          'No Results :(',
          style: TextStyles.textXL.offWhite(),
        ),
      );
    }

    return LayoutBuilder(builder: (_, constraints) {
      List<Widget> rows = [];
      List<Widget> currentRowItems = [];
      int itemsPerRow = max(constraints.maxWidth ~/ 295, 1);
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
      int lastRowItemCount = currentRowItems.length;
      if (lastRowItemCount > 0) {
        for (int i = 0; i < itemsPerRow - lastRowItemCount; i++) {
          currentRowItems.add(Spacer());
        }
        rows.add(Row(children: currentRowItems));
      }
      return ListView.builder(
        padding: buildListPadding(),
        itemCount: rows.length,
        itemBuilder: (_, index) {
          if (index >= rows.length) {
            return Container();
          }
          return rows[index];
        },
      );
    });
  }

  EdgeInsets buildListPadding() {
    return EdgeInsets.only(top: 65, bottom: 20, left: 4, right: 4);
  }
}
