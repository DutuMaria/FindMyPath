import 'dart:convert';

import 'package:frontend/local_storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferencesImpl implements LocalPreferences {
  static const sharedPrefAuthTokenKey = 'auth_token_key';
  static const sharedPrefUserIdKey = 'auth_user_id_key';

  @override
  Future<String> getAuthToken() async {
    String data = await _getStringFromPreferences(sharedPrefAuthTokenKey);
    return data;
  }

  @override
  Future<String> getUserId() async {
    String data = await _getStringFromPreferences(sharedPrefUserIdKey);
    return data;
  }

  @override
  Future<void> saveAuthToken(String token) {
    return _saveStringToPreferences(sharedPrefAuthTokenKey, token);
  }

  @override
  Future<void> saveUserId(String userId) {
    return _saveStringToPreferences(sharedPrefUserIdKey, userId);
  }

  _getStringFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future<String>.value(prefs.getString(key) ?? '');
  }

  _saveStringToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Future<void> clearData() async {
    saveAuthToken('');
    saveUserId('');
  }

  @override
  Future<void> saveUserAnswers(Map<int, int> userAnswers) async {
    final prefs = await SharedPreferences.getInstance();
    final stringKeyMap =
        userAnswers.map((key, value) => MapEntry(key.toString(), value));
    await prefs.setString('userAnswers', jsonEncode(stringKeyMap));
  }

  @override
  Future<Map<int, int>> getUserAnswers() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('userAnswers');
    if (jsonString == null) return {};
    final Map<String, dynamic> stringKeyMap = jsonDecode(jsonString);
    return stringKeyMap
        .map((key, value) => MapEntry(int.parse(key), value as int));
  }

  @override
  Future<void> clearUserAnswers() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userAnswers');
  }
}
