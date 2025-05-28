import 'package:qbits/qbits.dart';

class UserCenterProvider extends ChangeNotifier {
  bool loader = false;
  bool isAutoSignInOn = false;

  UserCenterProvider() {
    init();
  }

  void init() {}

  void updateAutoSignInSetting(bool status) {
    isAutoSignInOn = status;
    notifyListeners();
  }
}
