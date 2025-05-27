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

      /// sign in
      case SignInScreen.routeName:
        return MaterialPageRoute(
          builder: SignInScreen.builder,
          settings: settings,
        );

      /// Id Authentication Screen
      case IdAuthenticationScreen.routeName:
        return MaterialPageRoute(
          builder: IdAuthenticationScreen.builder,
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

      /// RoleChoiceScreen
      case RoleChoiceScreen.routeName:
        return MaterialPageRoute(
          builder: RoleChoiceScreen.builder,
          settings: settings,
        );

      /// Search Screen
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: SearchScreen.builder,
          settings: settings,
        );

      /// My Watchlist Screen
      case MyWatchlistScreen.routeName:
        return MaterialPageRoute(
          builder: MyWatchlistScreen.builder,
          settings: settings,
        );

      /// Plant Screen
      case PlantScreen.routeName:
        return MaterialPageRoute(
          builder: PlantScreen.builder,
          settings: settings,
        );

      /// Alarm Screen
      case AlarmScreen.routeName:
        return MaterialPageRoute(
          builder: AlarmScreen.builder,
          settings: settings,
        );

      /// User Center Screen
      case UserCenterScreen.routeName:
        return MaterialPageRoute(
          builder: UserCenterScreen.builder,
          settings: settings,
        );

      /// Plant Detail Screen
      case PlantDetailScreen.routeName:
        return MaterialPageRoute(
          builder: PlantDetailScreen.builder,
          settings: settings,
        );

      /// Bluetooth Manually Screen
      case BluetoothManuallyScreen.routeName:
        return MaterialPageRoute(
          builder: BluetoothManuallyScreen.builder,
          settings: settings,
        );

      /// Individual Registration Screen
      case IndividualRegistrationScreen.routeName:
        return MaterialPageRoute(
          builder: IndividualRegistrationScreen.builder,
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
