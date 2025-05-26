import 'package:qbits/qbits.dart';

class IndividualRegistrationProvider extends ChangeNotifier {

  bool loader = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final TextEditingController stationNameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController collectorAddressController = TextEditingController();
  final TextEditingController timezoneController = TextEditingController();
  final TextEditingController stationTypeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String stationNameError = "";
  String modelError = "";
  String accountError = "";
  String passwordError = "";
  String confirmPasswordError = "";
  String cityError = "";
  String collectorAddressError = "";
  String timezoneError = "";
  String stationTypeError = "";
  String phoneNumberError = "";

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
    if (stationNameController.text.trim().isEmpty) {
      stationNameError = context.l10n?.accountIsRequired ?? "";
    } else {
      stationNameError = "";
    }

    if (modelController.text.trim().isEmpty) {
      modelError = context.l10n?.passwordIsRequired ?? "";
    } else {
      modelError = "";
    }

    if (accountController.text.trim().isEmpty) {
      accountError = context.l10n?.passwordIsRequired ?? "";
    } else {
      accountError = "";
    }

    if (passwordController.text.trim().isEmpty) {
      passwordError = context.l10n?.passwordIsRequired ?? "";
    } else {
      passwordError = "";
    }

    if (confirmPasswordController.text.trim().isEmpty) {
      confirmPasswordError = context.l10n?.passwordIsRequired ?? "";
    } else if (passwordController.text.trim().isEmpty) {
      confirmPasswordError = context.l10n?.passwordIsRequired ?? "";
    } else if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      confirmPasswordError = context.l10n?.passwordAndConfirmPasswordIsNotMatching ?? "";
    } else {
      confirmPasswordError = "";
    }

    if (cityController.text.trim().isEmpty) {
      cityError = context.l10n?.yourCityIsRequired ?? "";
    } else {
      cityError = "";
    }

    if (collectorAddressController.text.trim().isEmpty) {
      collectorAddressError = context.l10n?.passwordIsRequired ?? "";
    } else {
      collectorAddressError = "";
    }

    if (timezoneController.text.trim().isEmpty) {
      timezoneError = context.l10n?.passwordIsRequired ?? "";
    } else {
      timezoneError = "";
    }

    if (stationTypeController.text.trim().isEmpty) {
      stationTypeError = context.l10n?.passwordIsRequired ?? "";
    } else {
      stationTypeError = "";
    }

    if (phoneNumberController.text.trim().isEmpty) {
      phoneNumberError = context.l10n?.passwordIsRequired ?? "";
    } else {
      phoneNumberError = "";
    }

    notifyListeners();
    return stationNameError.isEmpty &&
           modelError.isEmpty &&
           accountError.isEmpty &&
           passwordError.isEmpty &&
           confirmPasswordError.isEmpty &&
           cityError.isEmpty &&
           collectorAddressError.isEmpty &&
           timezoneError.isEmpty &&
           stationTypeError.isEmpty &&
           phoneNumberError.isEmpty;
  }
}
