import 'package:qbits/qbits.dart';

class OtpCodeVerificationProvider extends ChangeNotifier {
  bool loader = false;

  bool isOTPValidate = false;

  Future<void> onVerifyTap(BuildContext context) async {
    context.navigator.pop();
    context.navigator.pop();
  }

  void onOtpChanged(String value) {
    isOTPValidate = value.length == 6;
    notifyListeners();
  }
}
