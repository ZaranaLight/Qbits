import 'package:qbits/qbits.dart';


class RoleChoiceProvider extends ChangeNotifier {
  final String? role;

  RoleChoiceProvider({this.role});

  bool loader = false;

  void onRoleSelected(BuildContext context, String selectedRole) {
    if (context.mounted) {
      context.navigator.pushNamedAndRemoveUntil(
        SignInScreen.routeName,
        (route) => false,
        arguments: selectedRole,
      );
    }
  }
}
