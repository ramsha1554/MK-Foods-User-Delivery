import 'package:shared_preferences/shared_preferences.dart';

class AuthStorageService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userIdKey = 'user_id';
  static const String _userPhoneKey = 'user_phone';
  static const String _userNameKey = 'user_name';

  String? _accessToken;
  String? _refreshToken;
  String? _userId;
  String? _userPhone;
  String? _userName;

  String? get accessToken => _accessToken;
  String? get userId => _userId;
  String? get userPhone => _userPhone;
  String? get userName => _userName;
  String? get refreshToken => _refreshToken;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString(_accessTokenKey);
    _refreshToken = prefs.getString(_refreshTokenKey);
    _userId = prefs.getString(_userIdKey);
    _userPhone = prefs.getString(_userPhoneKey);
    _userName = prefs.getString(_userNameKey);
  }

  Future<void> saveAuth({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String phone,
    String? name,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _userId = userId;
    _userPhone = phone;
    _userName = name;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_userPhoneKey, phone);
    if (name != null) {
      await prefs.setString(_userNameKey, name);
    }
  }

  Future<void> saveName(String name) async {
    _userName = name;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name);
  }

  bool get isLoggedIn => _accessToken != null;

  Future<void> clear() async {
    _accessToken = null;
    _refreshToken = null;
    _userId = null;
    _userPhone = null;
    _userName = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_userPhoneKey);
    await prefs.remove(_userNameKey);
  }
}
    
    