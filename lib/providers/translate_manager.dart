import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslateManager with ChangeNotifier {
  Locale? _translateMode;
  Locale? defaultTranslateMode;

  TranslateManager() {
    _getTranslateSharedPrefs();
  }

  Locale? get translateMode {
    return _translateMode;
  }

  set translateMode(Locale? localeMode) {
    _translateMode = localeMode;
    _saveTranslateSharedPrefs(localeMode);
    notifyListeners();
  }

  void _getTranslateSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeModeFromPrefs = prefs.getString('translate') ?? "es_ES";
    try {
      final List<String> local = themeModeFromPrefs.split('_');
      _translateMode = Locale(local[0], local[1]);
    } catch (e) {
      _translateMode = defaultTranslateMode;
    }
    notifyListeners();
  }

  _saveTranslateSharedPrefs(Locale? translate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('translate', translate.toString());
  }
}
