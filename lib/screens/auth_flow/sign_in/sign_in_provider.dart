import 'package:qbits/qbits.dart';

class SignInProvider extends ChangeNotifier {
  bool loader = false;
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String accountError = "";
  String pwdError = "";
  bool isPwdVisible = false;

  void onPwdVisibilityChanged() {
    isPwdVisible = !isPwdVisible;
    notifyListeners();
  }

  void onForgotPwdTap(BuildContext context) {
    context.navigator.pushNamed(ForgotPasswordScreen.routeName);
  }

  void onBluetoothPwdTap(BuildContext context) {
    context.navigator.pushNamed(BluetoothScreen.routeName);
  }

  void onSelectRegionTap(BuildContext context) {
    context.navigator.pushNamed(SelectRegionScreen.routeName);
  }

  void onSelectLanguageTap(BuildContext context) {
    context.navigator.pushNamed(SelectLanguageScreen.routeName);
  }

  Future<void> onSignInTap(BuildContext context) async {
    if (validation(context)) {
      if (context.mounted) {
        context.navigator.pushNamedAndRemoveUntil(
          DashboardScreen.routeName,
          (route) => false,
        );
        showCustomToast('Sign In Success');
      }
    }
  }

  Future<void> onSignUpTap(BuildContext context) async {
    context.navigator.pushNamed(RoleChoiceScreen.routeName);
  }

  bool validation(BuildContext context) {
    if (accountController.text.trim().isEmpty) {
      accountError = context.l10n?.accountIsRequired ?? "";
    } else {
      accountError = "";
    }

    if (passwordController.text.trim().isEmpty) {
      pwdError = context.l10n?.passwordIsRequired ?? "";
    } else {
      pwdError = "";
    }
    notifyListeners();
    return accountError.isEmpty && pwdError.isEmpty;
  }
}
