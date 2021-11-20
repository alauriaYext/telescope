import 'package:telescope/cards/yexter_content.dart';

enum SearchResultStatus {
  NOT_AVAILABLE,
  ANIMATING,
  LOADING,
  AVAILABLE,
}

class SearchResults {
  final SearchResultStatus _status;
  final List<SearchResult> _results;
  SearchResults(this._results) : _status = SearchResultStatus.AVAILABLE;
  SearchResults.fromResponse(String response) : _status = SearchResultStatus.AVAILABLE, _results = [];
  SearchResults.notAvailable()
      : _status = SearchResultStatus.NOT_AVAILABLE,
        _results = [];
  SearchResults.animating()
      : _status = SearchResultStatus.ANIMATING,
        _results = [];
  SearchResults.loading()
      : _status = SearchResultStatus.LOADING,
        _results = [];

  SearchResultStatus get status => _status;
  List<SearchResult> get results => _results;
}

class SearchResult {
  final YexterContent? _yexterContent;
  SearchResult.yexter(this._yexterContent);

  YexterContent? get yexterContent => _yexterContent;
}
