import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:telescope/home/search_results.dart';

class SearchController {
  static const animationDuration = 200;
  final TextEditingController _queryController;
  final FocusNode _focusNode;
  final BehaviorSubject<String> _querySubject;
  final BehaviorSubject<SearchResults> _resultSubject;

  SearchController()
      : _queryController = TextEditingController(),
        _focusNode = FocusNode(),
        _querySubject = BehaviorSubject(),
        _resultSubject = BehaviorSubject() {
    _focusNode.requestFocus();
  }

  TextEditingController get queryController => _queryController;
  Stream<SearchResults> get resultStream => _resultSubject.stream;

  search(String value) {
    print(value);
    _resultSubject.add(SearchResults.animating());
    Timer(Duration(milliseconds: animationDuration), () {
      _resultSubject.add(SearchResults.loading());
    });
  }

  void dispose() {
    _queryController.dispose();
    _resultSubject.close();
  }
}
