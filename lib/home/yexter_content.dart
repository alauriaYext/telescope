import 'dart:convert';

class YexterContent {
  String _name;
  String _jobTitle;
  YexterContent.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _jobTitle = json['c_jobTitle'];
  
  String get name => _name;
  String get jobTitle => _jobTitle;
}
