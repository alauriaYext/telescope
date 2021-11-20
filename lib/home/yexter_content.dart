class YexterContent {
  String _name;
  String _jobTitle;
  bool? _isActive;
  String? _photoUrl;
  String? _officeName;
  String? _team;
  String? _email;
  String? _managerName;
  String? _myersBriggs;
  YexterContent.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _jobTitle = json['c_jobTitle'],
        _isActive = json['c_active'],
        _officeName = getOfficeName(json),
        _team = json['c_team'] ?? null,
        _email = getEmail(json),
        _photoUrl = getPhotoUrl(json),
        _managerName = getManagerName(json),
        _myersBriggs = json['c_myersBriggs'] ?? null {}

  String get name => _name;
  String get jobTitle => _jobTitle;
  bool get isActive => _isActive ?? false;
  String? get officeName => _officeName;
  String? get photoUrl => _photoUrl;
  String? get team => _team;
  String? get email => _email;
  String? get managerName => _managerName;
  String? get myersBriggs => _myersBriggs;

  static String? getOfficeName(Map<String, dynamic> json) {
    String? officeName = json['c_office'];
    if (officeName == null) {
      return null;
    }
    return officeName.split(':').first;
  }

  static String? getPhotoUrl(Map<String, dynamic> json) {
    dynamic photoObject = json['c_profilePicture'];
    if (photoObject == null) {
      return null;
    }
    return photoObject['url'];
  }

  static String? getManagerName(Map<String, dynamic> json) {
    List<dynamic> managerList = json['c_manager'] ?? [];
    if (managerList == null || managerList.isEmpty) {
      return null;
    }
    return managerList[0]['name'];
  }

  static String? getEmail(Map<String, dynamic> json) {
    List<dynamic> emails = json['emails'] ?? [];
    if (emails == null || emails.isEmpty) {
      return null;
    }
    return emails[0];
  }
}
