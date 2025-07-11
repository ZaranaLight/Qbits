import 'dart:math';

import 'package:qbits/apis/auth_apis.dart';
import 'package:qbits/qbits.dart';

class CompanyRegistrationProvider extends ChangeNotifier {
  CompanyRegistrationProvider() {
    generateCode();
  }

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController companyCodeController = TextEditingController(
    text: "",
  );
  final TextEditingController mailController = TextEditingController();
  final TextEditingController verificationCodeController =
      TextEditingController();

  String accountError = "";
  String passwordError = "";
  String confirmPasswordError = "";
  String companyCodeError = "";
  String mailError = "";
  String verificationCodeError = "";
  String? _companyCode;
  bool showCodeField = false;
  bool loader = false;

  String? get companyCode => _companyCode;

  String generateCode() {
    List<String> arr = [];

    for (int i = 0; i < 10; i++) {
      arr.add(i.toString());
    }

    List<String> number = [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "J",
      "K",
      "L",
      "M",
      "N",
      "P",
      "Q",
      "R",
      "S",
      "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z",
    ];
    arr.addAll(number);

    Random rand = Random();
    List<String> result = ['A'];

    for (int i = 0; i < 6; i++) {
      int seed = rand.nextInt(arr.length);
      result.add(arr[seed]);
    }

    final generated = result.join('');
    companyCodeController.text = generated;

    notifyListeners();

    return result.join('');
  }

  void sendCode(BuildContext context) async {
    validation(context);
    if (sendMailValidation(context)) {
      loader = true;
      notifyListeners();
      final result = await AuthApis.sendMailCodeWithCheckAPI(
        email: mailController.text,
      );

      if (result) {
        // if (context.mounted) {
        //   context.navigator.pushNamed(OtpCodeVerificationScreen.routeName);
        // }
      }
      loader = false;
      notifyListeners();
    }
  }

  bool sendMailValidation(BuildContext context) {
    final email = mailController.text.trim();
    if (email.isEmpty ||
        !RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      mailError = "Please enter a valid email";
      showCodeField = false;
    } else {
      mailError = "";
      showCodeField = true;
      // TODO: Add API call here if needed
    }
    notifyListeners();
    return mailError.isEmpty;
  }

  void onPwdVisibilityChanged() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void onCnfPwdVisibilityChanged() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  // Future<void> onRegisterTap(BuildContext context) async {
  //   sendCode(context);
  //   if (validation(context)) {
  //     context.navigator.pushNamedAndRemoveUntil(
  //       DashboardScreen.routeName,
  //       (route) => false,
  //     );
  //   }
  // }

  Future<void> onRegisterTap(BuildContext context) async {
    if (mailController.text.trim().isEmpty) {
      sendCode(context);
    }

    if (validation(context)) {
      loader = true;
      notifyListeners();
      final result = await AuthApis.companyRegisterAPI(
        email: mailController.text,
        password: passwordController.text,
        accountName: accountController.text,
        mailOtp: verificationCodeController.text,
      );
      if (result) {
        // if (context.mounted) {
        //   context.navigator.pushNamed(OtpCodeVerificationScreen.routeName);
        // }
      }
      loader = false;
      notifyListeners();
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
