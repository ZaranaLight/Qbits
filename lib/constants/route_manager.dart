import 'package:qbits/qbits.dart';

class RouteManager {
  static String get initialRoute => SplashScreen.routeName;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    /// splash
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: SplashScreen.builder,
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const UnKnownScreen(),
          settings: settings,
        );
    }
  }
}