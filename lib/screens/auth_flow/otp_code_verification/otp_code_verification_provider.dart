import 'package:qbits/qbits.dart';

class OtpCodeVerificationProvider extends ChangeNotifier {
  bool loader = false;

  bool isOTPValidate = false;
  String otpError = "";

  Future<void> onVerifyTap(BuildContext context) async {
    if (validation(context)) {


      context.navigator.pop();
      context.navigator.pop();
    }
  }

  void onOtpChanged(String value) {
    isOTPValidate = value.length == 6;
    notifyListeners();
  }

  bool validation(BuildContext context) {

    if (isOTPValidate) {
      otpError = "";
    } else {
      otpError = context.l10n?.otpCodeIsRequired ?? "";
    }

    print(otpError);
    notifyListeners();
    return otpError.isEmpty;
  }
}
