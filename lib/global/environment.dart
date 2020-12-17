import 'dart:io';

class Environment {
  static String _domainAndroid = 'http://10.0.2.2:3000';
  static String _domainAndroidSocket = 'http://10.0.2.2:3001';
  static String _domainIos = 'http://localhost:3000';
  static String _domainIosSocket = 'http://localhost:3001';

  static String get domain => Platform.isAndroid ? _domainAndroid : _domainIos;
  static String get domainWS =>
      Platform.isAndroid ? _domainAndroidSocket : _domainIosSocket;
}
