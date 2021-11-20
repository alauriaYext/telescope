import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:telescope/cards/yexter_content.dart';
import 'package:telescope/home/search_results.dart';
import 'package:telescope/secure/constants.dart';
import 'package:http/http.dart' as http;

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
        _resultSubject = BehaviorSubject.seeded(SearchResults.notAvailable()) {
    _focusNode.requestFocus();
  }

  TextEditingController get queryController => _queryController;
  Stream<SearchResults> get resultStream => _resultSubject.stream;

  search(String input) {
    int delayMs = 0;
    if (_resultSubject.valueWrapper?.value.status ==
        SearchResultStatus.NOT_AVAILABLE) {
      _resultSubject.add(SearchResults.animating());
      delayMs = animationDuration;
    }
    Timer(Duration(milliseconds: delayMs), () {
      _resultSubject.add(SearchResults.loading());
    });
    String request =
        'https://liveapi.yext.com/v2/accounts/$ACCOUNT_ID/answers/query?';
    Map<String, String> params = Map();
    params['input'] = input;
    params['experienceKey'] = EXPERIENCE_KEY;
    params['api_key'] = API_KEY;
    params['version'] = 'PRODUCTION';
    params['v'] = '20190101';
    params['locale'] = "en";
    for (int i = 0; i < params.length; i++) {
      String key = params.keys.toList()[i];
      request += '$key=${params[key]}';
      if (i != params.length - 1) {
        request += '&';
      }
    }
    http.get(Uri.parse(request)).then((response) {
      List<SearchResult> results = [];
      if (response.statusCode == 200) {
        Map<String, dynamic> responseJson = jsonDecode(response.body);
        List<dynamic> modules = responseJson['response']['modules'];
        for (dynamic module in modules) {
          if (module['verticalConfigId'] != 'yexters') {
            continue;
          }
          for (Map<String, dynamic> yexterResult in module['results']) {
            YexterContent yexterContent =
                YexterContent.fromJson(yexterResult['data']);
                if (!yexterContent.isActive) {
                  continue;
                }
            results.add(SearchResult.yexter(yexterContent));
          }
        }
      } else {
        throw Exception(
            'Failed to perform search\nStatus Code = ${response.statusCode}\nBody = ${response.body}');
      }
      _resultSubject.add(SearchResults(results));
    });
  }

  void dispose() {
    _queryController.dispose();
    _resultSubject.close();
  }
}
