import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

enum SupportState {
  unknown,
  supported,
  unsupported,
}

class FingerPrintHelper {
  FingerPrintHelper._internal();

  factory FingerPrintHelper() => _instance;

  static final FingerPrintHelper _instance = FingerPrintHelper._internal();

  final LocalAuthentication auth = LocalAuthentication();

  Future<SupportState> isDeviceSupport() async =>
      await auth.isDeviceSupported().then((bool isSupported) {
        return isSupported ? SupportState.supported : SupportState.unsupported;
      });

  Future<bool> checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException {
      canCheckBiometrics = false;
      //print(e);
    }

    return canCheckBiometrics;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException {
      availableBiometrics = <BiometricType>[];
      //print(e);
    }

    return availableBiometrics;
  }

  Future<bool> isAuthenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException {
      // debugPrint(e.toString());
    }
    return authenticated;
  }

  Future<bool> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason: 'Scan your fingerprint (or face) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
    } on PlatformException {
      // debugPrint(e.toString());
    }

    return authenticated;
  }

  Future<bool> cancelAuthentication() async => await auth.stopAuthentication();
}
