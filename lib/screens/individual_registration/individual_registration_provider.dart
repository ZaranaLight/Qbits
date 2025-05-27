import 'package:qbits/qbits.dart';

class IndividualRegistrationProvider extends ChangeNotifier {

  bool loader = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String selectedTimezone = '';
  String selectedStationType = '';

  final TextEditingController stationNameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController collectorAddressController = TextEditingController();
  final TextEditingController timezoneController = TextEditingController();
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

  void onChangeTimezone(timezone) {
    selectedTimezone = timezone;
    notifyListeners();
  }

  void onChangeStationType(stationType) {
    selectedStationType = stationType;
    notifyListeners();
  }

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
      stationNameError = context.l10n?.stationNameIsRequired ?? "";
    } else {
      stationNameError = "";
    }

    if (modelController.text.trim().isEmpty) {
      modelError = context.l10n?.modelIsRequired ?? "";
    } else {
      modelError = "";
    }

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
      collectorAddressError = context.l10n?.collectorAddressIsRequired ?? "";
    } else {
      collectorAddressError = "";
    }

    if (selectedTimezone == '' || selectedTimezone.isEmpty) {
      timezoneError = context.l10n?.timezoneIsRequired ?? "";
    } else {
      timezoneError = "";
    }

    if (selectedStationType == '' || selectedStationType.isEmpty) {
      stationTypeError = context.l10n?.stationTypeIsRequired ?? "";
    } else {
      stationTypeError = "";
    }

    if (phoneNumberController.text.trim().isEmpty) {
      phoneNumberError = context.l10n?.phoneNumberIsRequired ?? "";
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
