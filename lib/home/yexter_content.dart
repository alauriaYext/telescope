import 'dart:convert';

class YexterContent {
  String _name;
  String _jobTitle;
  bool? _isActive;
  String? _myersBriggs;
  YexterContent.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _jobTitle = json['c_jobTitle'],
        _isActive = json['c_active'],
        _myersBriggs = json['c_myersBriggs'] ?? null {
          print('----------------------');
          dynamic active = json['c_active'];
          if (active != null) {
            print('active = $active');
          }
          print(json['c_myersBriggs']);
    for (String key in json.keys) {
      print(key);
      // print('$key   :   ${json[key]}');
    }
  }

  String get name => _name;
  String get jobTitle => _jobTitle;
  bool get isActive => _isActive ?? false;
  String? get myersBriggs => _myersBriggs;
}
