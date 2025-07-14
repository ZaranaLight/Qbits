import 'package:geolocator/geolocator.dart';
import 'package:qbits/apis/auth_apis.dart';
import 'package:qbits/common/widget/app_qr_scanner_screen.dart';
import 'package:qbits/qbits.dart';
import 'package:qbits/service/location_service.dart';

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
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController collectorAddressController =
      TextEditingController();
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
    final locationService = GetLocationService();
    Position? position = await locationService.getCurrentLocation();
    if (context.mounted) {
      if (validation(context)) {
        loader = true;
        notifyListeners();
        await Future.delayed(1.seconds);
        final result = await AuthApis.individualRegisterAPI(
          plantName: stationNameController.text,
          phone: phoneNumberController.text,
          accountName: accountController.text,
          plantType: stationTypes.indexOf(selectedStationType),
          password: passwordController.text,
          longitude: position?.longitude.toString() ?? "",
          latitude: position?.latitude.toString() ?? "",
          cityname: cityController.text,
          invertertype: "2",
          collector: collectorAddressController.text,
        );
        if (result) {
          if (context.mounted) {
            context.navigator.pushNamedAndRemoveUntil(
              DashboardScreen.routeName,
              (route) => false,
            );
          }
        }
        loader = false;
        notifyListeners();
      }
    }
  }

  void onChangeTimezone(timezone) {
    selectedTimezone = timezone;
    notifyListeners();
  }

  int get selectedStationTypeIndex {
    if (selectedStationType == '') return -1; // or throw if mandatory
    return stationTypes.indexOf(selectedStationType);
  }

  List<String> stationTypes = [
    "Solar System",
    "Battery Storage System",
    "Solar System (with output-limition)",
  ];

  void onChangeStationType(stationType) {
    selectedStationType = stationType;
    notifyListeners();
  }

  Future<void> scanQRCode(BuildContext context, String scannedQR) async {
    final scannedResult = await context.navigator.push<String>(
      MaterialPageRoute(builder: (_) => QRScannerScreen()),
    );

    if (scannedResult != null && scannedResult.isNotEmpty) {
      if (scannedQR == 'model') {
        modelController.text = scannedResult;
      }

      if (scannedQR == 'collector_address') {
        collectorAddressController.text = scannedResult;
      }
      notifyListeners(); // notify UI about the change
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
    } else if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      confirmPasswordError =
          context.l10n?.passwordAndConfirmPasswordIsNotMatching ?? "";
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
    } else if (!phoneNumberController.text.isPhoneValid()) {
      phoneNumberError = context.l10n?.enterValid10DigitPhoneNumber ?? "";
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
