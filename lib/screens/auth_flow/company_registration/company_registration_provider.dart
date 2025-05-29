import 'package:qbits/qbits.dart';

class CompanyRegistrationProvider extends ChangeNotifier {

  bool loader = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String generatedCode = "0123";

  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController companyCodeController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController verificationCodeController = TextEditingController();

  String accountError = "";
  String passwordError = "";
  String confirmPasswordError = "";
  String companyCodeError = "";
  String mailError = "";
  String verificationCodeError = "";

  void onPwdVisibilityChanged() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void onCnfPwdVisibilityChanged() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> onRegisterTap(BuildContext context) async {
    if (validation(context)) {
      context.navigator.pushNamed(DashboardScreen.routeName);
    }
  }

  bool validation(BuildContext context) {
    if (accountController.text.trim().isEmpty) {
      accountError = context.l10n?.accountIsRequired ?? "";
    } else {
      accountError = "";
    }

    if (passwordController.text.trim().isEmpty) {
      passwordError = context.l10n?.passwordIsRequired ?? "";
    } else {
      passwordError = "";
    }

    if (confirmPasswordController.text.trim().isEmpty) {
      confirmPasswordError = context.l10n?.confirmPasswordIsRequired ?? "";
    } else if (passwordController.text.trim().isEmpty) {
      confirmPasswordError = context.l10n?.passwordIsRequired ?? "";
    } else if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      confirmPasswordError =
          context.l10n?.passwordAndConfirmPasswordIsNotMatching ?? "";
    } else {
      confirmPasswordError = "";
    }

    if (companyCodeController.text.trim().isEmpty) {
      companyCodeError = context.l10n?.companyCodeIsRequired ?? "";
    } else {
      companyCodeError = "";
    }

    if (mailController.text.trim().isEmpty) {
      mailError = context.l10n?.mailIsRequired ?? "";
    } else if (!mailController.text.trim().isEmailValid()) {
      mailError = context.l10n?.mailIsNotValid ?? "";
    } else {
      mailError = "";
    }

    if (verificationCodeController.text.trim().isEmpty) {
      verificationCodeError = context.l10n?.verificationCodeIsRequired ?? "";
    } else if (verificationCodeController.text.trim() != generatedCode) {
      verificationCodeError = context.l10n?.verificationCodeIsntMatching ?? "";
    } else {
      verificationCodeError = "";
    }

    notifyListeners();
    return accountError.isEmpty &&
        passwordError.isEmpty &&
        confirmPasswordError.isEmpty &&
        companyCodeError.isEmpty &&
        mailError.isEmpty &&
        verificationCodeError.isEmpty;
  }
}
