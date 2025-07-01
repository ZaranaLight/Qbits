import 'package:qbits/qbits.dart';

class ProfileInformationProvider extends ChangeNotifier {
  bool loader = false;
  final TextEditingController emailController = TextEditingController();
  String emailError = "";
  bool isOTPValidate = false;
  String otpError = "";

  Future<void> onContinueTap(BuildContext context) async {
    if (validation(context)) {
      context.navigator.pushNamed(ProfileInfoOTPVerificationScreen.routeName);
    }
  }

  Future<void> onOTPVerify(BuildContext context) async {
    if (validationOTPVerify(context)) {
      context.navigator.pop();
      context.navigator.pop();
    }
  }

  bool validationOTPVerify(BuildContext context) {
    if (!isOTPValidate) {
      otpError = context.l10n?.otpCodeIsRequired ?? "";
    } else {
      otpError = "";
    }

    notifyListeners();
    return otpError.isEmpty;
  }

  bool validation(BuildContext context) {
    if (emailController.text.trim().isEmpty) {
      emailError = context.l10n?.emailIsRequired ?? "";
    } else if (!emailController.text.trim().isEmailValid()) {
      emailError = context.l10n?.emailIdIsInvalid ?? "";
    } else {
      emailError = "";
    }

    notifyListeners();
    return emailError.isEmpty;
  }

  Future<void> onVerifyTap(BuildContext context) async {
    context.navigator.pop();
    context.navigator.pop();
  }

  void onOtpChanged(String value) {
    isOTPValidate = value.length == 6;
    notifyListeners();
  }
}
