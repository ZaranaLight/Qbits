import 'package:qbits/qbits.dart';

class AddUserProvider extends ChangeNotifier {
  bool loader = false;
  String accountError = "";
  String passwordError = "";
  String phoneNumberError = "";
  String mailError = "";
  bool isPasswordVisible = true;
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  bool validation(BuildContext context) {
    if (accountController.text.trim().isEmpty) {
      accountError = context.l10n?.accountIsRequired ?? "";
    } else {
      accountError = "";
    }

    if (passwordController.text.trim().isEmpty) {
      passwordError = context.l10n?.passwordIsRequired ?? "";
    } else if (!passwordController.text.trim().isValidPassword()) {
      passwordError = context.l10n?.passwordIsNotValid ?? "";
    } else {
      passwordError = "";
    }

    if (phoneNumberController.text.trim().isEmpty) {
      phoneNumberError = context.l10n?.phoneNumberIsRequired ?? "";
    } else if (!phoneNumberController.text.trim().isPhoneValid()) {
      phoneNumberError = context.l10n?.phoneNumberIsInvalid ?? "";
    } else {
      phoneNumberError = "";
    }

    if (mailController.text.trim().isEmpty) {
      mailError = context.l10n?.mailIsRequired ?? "";
    } else if (!mailController.text.trim().isEmailValid()) {
      mailError = context.l10n?.mailIsInvalid ?? "";
    } else {
      mailError = "";
    }

    notifyListeners();
    return accountError.isEmpty &&
        passwordError.isEmpty &&
        mailError.isEmpty &&
        phoneNumberError.isEmpty;
  }

  void onPwdVisibilityChanged() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  AddUserProvider() {
    init();
  }

  void init() {}

  Future<void> onConfirmTap(BuildContext context) async {
    if (validation(context)) {
      if (context.mounted) {
        context.navigator.pop();
        showCustomToast('Added Success');
      }
    }
  }

  /// Add any additional methods or properties needed for the End User flow
}
