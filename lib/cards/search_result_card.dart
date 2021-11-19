import 'package:flutter/material.dart';
import 'package:telescope/cards/yexter_card.dart';
import 'package:telescope/home/search_results.dart';

class SearchResultCard extends StatelessWidget {
  final SearchResult _resultContent;
  SearchResultCard(this._resultContent);

  @override
  Widget build(BuildContext context) {
    if (_resultContent.yexterContent != null) {
      return YexterCard(_resultContent.yexterContent!);
    }
    return Container();
  }
}
