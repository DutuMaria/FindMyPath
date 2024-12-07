import 'package:frontend/local_storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferencesImpl implements LocalPreferences {
  static const sharedPrefAuthTokenKey = 'auth_token_key';

  @override
  Future<String> getAuthToken() async {
    String data = await _getStringFromPreferences(sharedPrefAuthTokenKey);
    return data;
  }

  @override
  Future<void> saveAuthToken(String token) {
    return _saveStringToPreferences(sharedPrefAuthTokenKey, token);
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
  }
}