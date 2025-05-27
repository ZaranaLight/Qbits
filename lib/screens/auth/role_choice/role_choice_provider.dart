import 'package:qbits/qbits.dart';
import 'package:qbits/screens/auth/company_registartion/company_registartion_screen.dart';

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
        context.navigator.pushNamed(CompanyRegistrationScreen.routeName);
        break;
      default:
        debugPrint("Role is not selected.");
    }
  }
}
