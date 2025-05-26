import 'package:qbits/qbits.dart';

class IdAuthenticationProvider extends ChangeNotifier {
  bool loader = false;
  final TextEditingController idNumberController = TextEditingController();
  String idNumberError = "";

  void onIdNumberChanged(String value) {
    if (value.isEmpty) {
      idNumberError = "ID number cannot be empty";
    } else if (value.length < 6) {
      idNumberError = "ID number must be at least 6 characters";
    } else {
      idNumberError = "";
    }
    notifyListeners();
  }

  Future<void> onSubmit(BuildContext context) async {
    if (idNumberError.isEmpty) {
      // Handle successful submission
      context.navigator.pop();
    } else {
      // Show error message
      notifyListeners();
    }
  }
}