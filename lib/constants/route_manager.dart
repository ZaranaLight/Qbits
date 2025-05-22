import 'package:qbits/qbits.dart';
import 'package:qbits/screens/auth/bluetooth/bluetooth_screen.dart';
import 'package:qbits/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:qbits/screens/auth/otp_code_verification/otp_code_verification_screen.dart';

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

      /// sign in
      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: SignInScreen.builder,
          settings: settings,
        );

      /// Dashboard Screen
      case DashboardScreen.routeName:
        return MaterialPageRoute(
          builder: DashboardScreen.builder,
          settings: settings,
        );

      /// Home Screen
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: HomeScreen.builder,
          settings: settings,
        );

      /// Select Region Screen
      case SelectRegionScreen.routeName:
        return MaterialPageRoute(
          builder: SelectRegionScreen.builder,
          settings: settings,
        );

      /// Select Language Screen
      case SelectLanguageScreen.routeName:
        return MaterialPageRoute(
          builder: SelectLanguageScreen.builder,
          settings: settings,
        );

      /// Forgot Password Screen
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: ForgotPasswordScreen.builder,
          settings: settings,
        );

      /// OtpCode Verification Screen
      case OtpCodeVerificationScreen.routeName:
        return MaterialPageRoute(
          builder: OtpCodeVerificationScreen.builder,
          settings: settings,
        );

      /// Bluetooth Screen
      case BluetoothScreen.routeName:
        return MaterialPageRoute(
          builder: BluetoothScreen.builder,
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
