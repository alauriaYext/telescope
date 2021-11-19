import 'dart:convert';

class YexterContent {
  String _name;
  String _jobTitle;
  bool? _isActive;
  String? _photoUrl;
  String? _managerName;
  String? _myersBriggs;
  YexterContent.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _jobTitle = json['c_jobTitle'],
        _isActive = json['c_active'],
        _photoUrl = getPhotoUrl(json),
        _managerName = getManagerName(json),
        _myersBriggs = json['c_myersBriggs'] ?? null {
    print('=================================');
    dynamic item = json['c_newHirePhoto'];
    if (item != null) {
      print('$item');
    }
    print('----------------------');
    for (String key in json.keys) {
      print(key);
    }
  }

  String get name => _name;
  String get jobTitle => _jobTitle;
  bool get isActive => _isActive ?? false;
  String? get photoUrl => _photoUrl;
  String? get managerName => _managerName;
  String? get myersBriggs => _myersBriggs;

  static String? getPhotoUrl(Map<String, dynamic> json) {
    dynamic photoObject = json['c_profilePicture'];
    if (photoObject == null) {
      return null;
    }
    return photoObject['url'];
  }

  static String? getManagerName(Map<String, dynamic> json) {
    List<dynamic> managerList = json['c_manager'];
    print(managerList);
    if (managerList == null || managerList.isEmpty) {
      return null;
    }
    return managerList[0]['name'];
  }
}
