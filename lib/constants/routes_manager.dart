import 'package:qbits/qbits.dart';
import 'package:qbits/screens/collector/edit_collector/edit_collector_screen.dart';

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

      /// Select Region Description Screen
      case SelectRegionDescriptionScreen.routeName:
        return MaterialPageRoute(
          builder: SelectRegionDescriptionScreen.builder,
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

      /// Plant Info Screen
      case PlantInfoScreen.routeName:
        return MaterialPageRoute(
          builder: PlantInfoScreen.builder,
          settings: settings,
        );

      /// Alarm Screen
      case AlarmScreen.routeName:
        return MaterialPageRoute(
          builder: AlarmScreen.builder,
          settings: settings,
        );

      /// Profile Screen
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          builder: ProfileScreen.builder,
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

      /// Add Collector Screen
      case AddCollectorScreen.routeName:
        return MaterialPageRoute(
          builder: AddCollectorScreen.builder,
          settings: settings,
        );

      /// Edit Collector Screen
      case EditCollectorScreen.routeName:
        return MaterialPageRoute(
          builder: EditCollectorScreen.builder,
          settings: settings,
        );

      /// Company Registration Screen
      case CompanyRegistrationScreen.routeName:
        return MaterialPageRoute(
          builder: CompanyRegistrationScreen.builder,
          settings: settings,
        );

      /// Alarm Inverter Screen
      case AlarmInverterScreen.routeName:
        return MaterialPageRoute(
          builder: AlarmInverterScreen.builder,
          settings: settings,
        );

      ///   Inverter Screen
      case InverterScreen.routeName:
        return MaterialPageRoute(
          builder: InverterScreen.builder,
          settings: settings,
        );

      ///  Edit Inverter Screen
      case EditInverterScreen.routeName:
        return MaterialPageRoute(
          builder: EditInverterScreen.builder,
          settings: settings,
        );

      ///  Remote Control Screen
      case RemoteControlScreen.routeName:
        return MaterialPageRoute(
          builder: RemoteControlScreen.builder,
          settings: settings,
        );

      // ///  Parameter Screen
      // case ParameterScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: ParameterScreen.builder,
      //     settings: settings,
      //   );

      /// Profile Information Screen
      case ProfileInformationScreen.routeName:
        return MaterialPageRoute(
          builder: ProfileInformationScreen.builder,
          settings: settings,
        );

      /// Profile Info OTP Verification Screen
      case ProfileInfoOTPVerificationScreen.routeName:
        return MaterialPageRoute(
          builder: ProfileInfoOTPVerificationScreen.builder,
          settings: settings,
        );

      /// Account Security Screen
      case AccountSecurityScreen.routeName:
        return MaterialPageRoute(
          builder: AccountSecurityScreen.builder,
          settings: settings,
        );

      /// Account Cancellation Screen
      case AccountCancellationScreen.routeName:
        return MaterialPageRoute(
          builder: AccountCancellationScreen.builder,
          settings: settings,
        );

      ///User Center Screen
      case UserCenterScreen.routeName:
        return MaterialPageRoute(
          builder: UserCenterScreen.builder,
          settings: settings,
        );

      ///AddUserFormScreen
      case AddUserFormScreen.routeName:
        return MaterialPageRoute(
          builder: AddUserFormScreen.builder,
          settings: settings,
        );

      /// Set Password Screen
      case SetPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: SetPasswordScreen.builder,
          settings: settings,
        );

      /// Profit Compute Mode Screen
      case ProfitComputeModeScreen.routeName:
        return MaterialPageRoute(
          builder: ProfitComputeModeScreen.builder,
          settings: settings,
        );

      /// Currency Screen
      case CurrencyScreen.routeName:
        return MaterialPageRoute(
          builder: CurrencyScreen.builder,
          settings: settings,
        );

      /// End User Screen
      case EndUserScreen.routeName:
        return MaterialPageRoute(
          builder: EndUserScreen.builder,
          settings: settings,
        );

      /// Guest Screen
      case GuestScreen.routeName:
        return MaterialPageRoute(
          builder: GuestScreen.builder,
          settings: settings,
        );

      /// CollectorScreen
      case CollectorScreen.routeName:
        return MaterialPageRoute(
          builder: CollectorScreen.builder,
          settings: settings,
        );

      /// Qa Screen
      case QaScreen.routeName:
        return MaterialPageRoute(builder: QaScreen.builder, settings: settings);

      default:
        return MaterialPageRoute(
          builder: (context) => const UnKnownScreen(),
          settings: settings,
        );
    }
  }
}
