import 'package:qbits/qbits.dart';

class SignInProvider extends ChangeNotifier {
  SignInProvider({this.initialRegion, this.initialLanguage}) {
    selectedRegion = initialRegion?.trim().isNotEmpty == true
        ? initialRegion!
        : "International";
    selectedLanguage = initialLanguage ?? "";
  }

  bool loader = false;
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String accountError = "";
  String pwdError = "";
  final String? initialRegion;
  final String? initialLanguage;
  String selectedRegion = '';
  String selectedLanguage = '';
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

  void updateSelectedRegion(String region) {
    selectedRegion = region;
    notifyListeners();
  }

  void updateSelectedLanguage(String lang) {
    selectedLanguage = lang;
    notifyListeners();
  }

  void onSelectRegionTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => SelectRegionScreen.builder(
              context,
              initialRegion: selectedRegion,
              onRegionSelected: (region) {
                updateSelectedRegion(region); // <-- update on return
              },
            ),
      ),
    );
  }

  void onSelectLanguageTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => SelectLanguageScreen.builder(
              context,
              initialLanguage: selectedLanguage,
              onLanguageSelected: (region) {
                updateSelectedLanguage(region); // <-- update on return
              },
            ),
      ),
    );
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
