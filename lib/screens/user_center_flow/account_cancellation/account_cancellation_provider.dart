import 'package:qbits/qbits.dart';

class AccountCancellationProvider extends ChangeNotifier {
  bool loader = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactInformationController =
      TextEditingController();
  final TextEditingController qqController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String nameError = "";
  String contactInformationError = "";
  String qqError = "";
  String emailError = "";

  Future<void> onSubmit(BuildContext context) async {
    if (validation(context)) {
      context.navigator.pop();
      context.navigator.pop();
    }
  }

  bool validation(BuildContext context) {
    if (nameController.text.trim().isEmpty) {
      nameError = context.l10n?.nameISRequired ?? "";
    } else {
      nameError = "";
    }

    if (contactInformationController.text.trim().isEmpty) {
      contactInformationError =
          context.l10n?.contactInformationISRequired ?? "";
    } else {
      contactInformationError = "";
    }

    if (qqController.text.trim().isEmpty) {
      qqError = context.l10n?.qqISRequired ?? "";
    } else {
      qqError = "";
    }

    if (emailController.text.trim().isEmpty) {
      emailError = context.l10n?.emailIsRequired ?? "";
    }else if (!emailController.text.trim().isEmailValid()) {
      emailError = context.l10n?.emailIdIsInvalid ?? "";
    } else {
      emailError = "";
    }

    notifyListeners();
    return nameError.isEmpty &&
        contactInformationError.isEmpty &&
        qqError.isEmpty &&
        emailError.isEmpty;
  }
}
