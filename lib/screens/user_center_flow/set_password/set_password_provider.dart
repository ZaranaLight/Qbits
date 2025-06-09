import 'package:qbits/qbits.dart';

class SetPasswordProvider extends ChangeNotifier {
  bool loader = false;
  final TextEditingController originalPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  String originalPasswordError = "";
  String newPasswordError = "";
  String confirmNewPasswordError = "";

  Future<void> onTapConfirm(BuildContext context) async {
    if (validation(context)) {
      context.navigator.pop();
      context.navigator.pop();
      context.navigator.pop();
    }
  }

  bool validation(BuildContext context) {
    if (originalPasswordController.text.trim().isEmpty) {
      originalPasswordError = context.l10n?.originalPasswordIsRequired ?? "";
    } else if (!originalPasswordController.text.trim().isValidPassword()) {
      originalPasswordError = context.l10n?.originalPasswordIsNotValid ?? "";
    } else {
      originalPasswordError = "";
    }

    if (newPasswordController.text.trim().isEmpty) {
      newPasswordError = context.l10n?.newPasswordIsRequired ?? "";
    } else if (!newPasswordController.text.trim().isValidPassword()) {
      newPasswordError = context.l10n?.newPasswordIsNotValid ?? "";
    } else {
      newPasswordError = "";
    }

    if (confirmNewPasswordController.text.trim().isEmpty) {
      confirmNewPasswordError =
          context.l10n?.confirmNewPasswordIsRequired ?? "";
    } else if (newPasswordController.text.trim().isEmpty) {
      confirmNewPasswordError = context.l10n?.newPasswordIsRequired ?? "";
    } else if (newPasswordController.text.trim() !=
        confirmNewPasswordController.text.trim()) {
      confirmNewPasswordError =
          context.l10n?.newPasswordAndConfirmNewPasswordIsNotMatching ?? "";
    } else if (!confirmNewPasswordController.text.trim().isValidPassword()) {
      confirmNewPasswordError = context.l10n?.confirmNewIsNotValid ?? "";
    } else {
      confirmNewPasswordError = "";
    }

    notifyListeners();
    return originalPasswordError.isEmpty &&
        newPasswordError.isEmpty &&
        confirmNewPasswordError.isEmpty;
  }
}
