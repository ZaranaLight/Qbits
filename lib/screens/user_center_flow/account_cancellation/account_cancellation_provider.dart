import 'package:qbits/qbits.dart';

class AccountCancellationProvider extends ChangeNotifier {
  bool loader = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactInformationController = TextEditingController();
  final TextEditingController qqController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String nameError = "";
  String contactInformationError = "";
  String qqError = "";
  String emailError = "";

  Future<void> onSubmit(BuildContext context) async {
    context.navigator.pop();
    context.navigator.pop();
  }

}
