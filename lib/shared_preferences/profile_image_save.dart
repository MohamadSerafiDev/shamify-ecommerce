import 'package:shared_preferences/shared_preferences.dart';

class ProfileImageSave {
  final String _imagePath = 'image_path';
  Future<void> savePath(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imagePath, path);
  }

  Future<String?> getPath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_imagePath);
  }

  Future<void> removePath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_imagePath);
  }
}
