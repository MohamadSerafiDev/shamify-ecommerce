import 'package:shared_preferences/shared_preferences.dart';

class SessionManage {
  final String _sessionToken = 'session_token';
  Future<void> saveSessionId(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sessionToken, token);
  }

  Future<String?> getSessionId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_sessionToken);
  }

  Future<void> removeSessionId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionToken);
  }
}
