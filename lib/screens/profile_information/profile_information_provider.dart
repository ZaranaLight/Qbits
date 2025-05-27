import 'package:qbits/qbits.dart';

class ProfileInformationProvider extends ChangeNotifier {
  bool loader = false;
  final TextEditingController emailController = TextEditingController();
  String emailError = "";
  bool isOTPValidate = false;

  Future<void> onContinueTap(BuildContext context) async {
    if (validation(context)) {
      context.navigator.pushNamed(ProfileInfoOTPVerificationScreen.routeName);
    }
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
