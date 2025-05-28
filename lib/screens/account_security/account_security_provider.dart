import 'package:qbits/qbits.dart';

class AccountSecurityProvider extends ChangeNotifier {
  bool loader = false;
  bool isAutoSignInOn = false;

  void updateAutoSignInSetting(bool status) {
    isAutoSignInOn = status;

    notifyListeners();
  }
}
