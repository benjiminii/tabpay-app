import 'package:tabpay_app/tabpay_core/constant/prefs_keys.dart';
import 'package:tabpay_app/tabpay_core/utils/prefs.dart';

class SharedPrefs {
  SharedPrefs._internal();

  static final _instance = SharedPrefs._internal();

  factory SharedPrefs() => _instance;

  bool get isIntroSkip {
    return Prefs.getBool(PrefsKeys.introSkip) ?? false;
  }

  set isIntroSkip(bool value) {
    Prefs.setBool(PrefsKeys.introSkip, value);
  }

  String get biometricPin {
    if (Prefs.getString(PrefsKeys.biometricPin) != null &&
        Prefs.getString(PrefsKeys.biometricPin)!.length == 4) {
      return Prefs.getString(PrefsKeys.biometricPin) ?? "";
    } else {
      return "";
    }
  }

  set biometricPin(String value) {
    Prefs.setString(PrefsKeys.biometricPin, value);
  }
}
