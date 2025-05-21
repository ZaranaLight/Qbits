import 'package:qbits/qbits.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  static Widget builder(BuildContext context) {
    return SplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.primaryColor,
      body: SafeArea(
        child: Center(child: SvgAsset(imagePath: AssetRes.splashLogo)),
      ),
    );
  }
}
