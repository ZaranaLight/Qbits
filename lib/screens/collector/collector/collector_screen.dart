import 'package:qbits/qbits.dart';

class CollectorScreen extends StatelessWidget {
  const CollectorScreen({super.key});

  static const routeName = "collector";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<EndUserProvider>(
      create: (c) => EndUserProvider(),
      child: CollectorScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
