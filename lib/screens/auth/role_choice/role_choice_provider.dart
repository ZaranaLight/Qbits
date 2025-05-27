import 'package:qbits/qbits.dart';

class RoleChoiceProvider extends ChangeNotifier {
  UserRole? role;
  bool loader = false;

  RoleChoiceProvider({this.role});

  void setRole(UserRole newRole) {
    role = newRole;
    notifyListeners();
  }

  void navigateBasedOnRole(BuildContext context) {
    switch (role) {
      case UserRole.individual:
        context.navigator.pushNamed(IndividualRegistrationScreen.routeName);
        break;
      case UserRole.company:
        Navigator.pushNamed(context, CompanyRegistrationScreen.routeName);
        break;
      default:
        debugPrint("Role is not selected.");
    }
  }
}
