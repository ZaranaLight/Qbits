import 'package:qbits/apis/auth_apis.dart';
import 'package:qbits/qbits.dart';

class OtpCodeVerificationProvider extends ChangeNotifier {
  OtpCodeVerificationProvider({required this.email});

  bool loader = false;
  final String email;
  String? otp = "";
  bool isOTPValidate = false;
  String otpError = "";

  Future<void> onVerifyTap(BuildContext context) async {
    if (validation(context)) {
      loader = true;
      notifyListeners();
      final result = await AuthApis.verifyOTPCodeAPI(
        email: email,
        code: otp ?? "",
      );
      if (result) {
        if (context.mounted) {
          print("OTP verification successful");
        }
      }
      loader = false;
      notifyListeners();
    }
  }

  void onOtpChanged(String value) {
    print("value: ${value.length}");
    isOTPValidate = value.length ==6 ;
    // if (isOTPValidate) {
    //   otpError = "";
    //   otp = value;
    // }
    notifyListeners();
  }

  bool validation(BuildContext context) {
    // if (isOTPValidate) {
    //   otpError = "";
    // } else {
    //   otpError = context.l10n?.otpCodeIsRequired ?? "";
    // }

    notifyListeners();
    return otpError.isEmpty;
  }
}
