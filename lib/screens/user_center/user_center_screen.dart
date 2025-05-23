import 'package:qbits/qbits.dart';

class UserCenterScreen extends StatelessWidget {
  const UserCenterScreen({super.key});

  static const routeName = "user_center";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<UserCenterProvider>(
      create: (c) => UserCenterProvider(),
      child: UserCenterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("User Center", style: styleW600S20));
  }
}
