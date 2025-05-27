import 'package:qbits/qbits.dart';

class IdAuthenticationProvider extends ChangeNotifier {
  final ScanResult? scanResult;

  IdAuthenticationProvider({required this.scanResult});

  bool loader = false;
  final TextEditingController accountNumberController = TextEditingController();
  String accountNumberError = "";

  final TextEditingController passwordController = TextEditingController();
  String pwdError = "";
  bool isPwdVisible = false;

  void onPwdVisibilityChanged() {
    isPwdVisible = !isPwdVisible;
    notifyListeners();
  }

  Future<void> onContinueTap(BuildContext context) async {
    if (validation(context)) {
      if (context.mounted) {
        showCustomToast('Authentication Successfully done');
        context.navigator.pushNamed(RoleChoiceScreen.routeName);
      }
    }
  }

  bool validation(BuildContext context) {
    if (accountNumberController.text.trim().isEmpty) {
      accountNumberError = context.l10n?.accountIsRequired ?? "";
    } else {
      accountNumberError = "";
    }

    if (passwordController.text.trim().isEmpty) {
      pwdError = context.l10n?.passwordIsRequired ?? "";
    } else {
      pwdError = "";
    }
    notifyListeners();
    return accountNumberError.isEmpty && pwdError.isEmpty;
  }
}
