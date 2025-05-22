import 'package:qbits/qbits.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  bool loader = false;
  final TextEditingController emailController = TextEditingController();
  String emailError = "";

  Future<void> onContinueTap(BuildContext context) async {
    if (validation(context)) {
      context.navigator.pushNamed(OtpCodeVerificationScreen.routeName);
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
}
