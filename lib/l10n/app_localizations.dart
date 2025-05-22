import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @international.
  ///
  /// In en, this message translates to:
  /// **'International'**
  String get international;

  /// No description provided for @languageSelection.
  ///
  /// In en, this message translates to:
  /// **'Language Selection'**
  String get languageSelection;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @bluetooth.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth'**
  String get bluetooth;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @selectRegion.
  ///
  /// In en, this message translates to:
  /// **'Select Region'**
  String get selectRegion;

  /// No description provided for @pleaseSelectTheRegionThatCorrespondsTo.
  ///
  /// In en, this message translates to:
  /// **'Please Select the region that corresponds to \nyour business scope. The system will provide\naccess to dataand services specific to your.'**
  String get pleaseSelectTheRegionThatCorrespondsTo;

  /// No description provided for @china.
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get china;

  /// No description provided for @africa.
  ///
  /// In en, this message translates to:
  /// **'Africa'**
  String get africa;

  /// No description provided for @oceania.
  ///
  /// In en, this message translates to:
  /// **'Oceania'**
  String get oceania;

  /// No description provided for @northAmerica.
  ///
  /// In en, this message translates to:
  /// **'North America'**
  String get northAmerica;

  /// No description provided for @southAmerica.
  ///
  /// In en, this message translates to:
  /// **'South America'**
  String get southAmerica;

  /// No description provided for @antarctica.
  ///
  /// In en, this message translates to:
  /// **'Antarctica'**
  String get antarctica;

  /// No description provided for @doNotKnowHowToChoose.
  ///
  /// In en, this message translates to:
  /// **'Don’t know how to choose?'**
  String get doNotKnowHowToChoose;

  /// No description provided for @europe.
  ///
  /// In en, this message translates to:
  /// **'Europe'**
  String get europe;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @chinese.
  ///
  /// In en, this message translates to:
  /// **'Chinese'**
  String get chinese;

  /// No description provided for @russian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @japanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;

  /// No description provided for @turkish.
  ///
  /// In en, this message translates to:
  /// **'Turkish'**
  String get turkish;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @oTPCodeVerification.
  ///
  /// In en, this message translates to:
  /// **'OTP Code Verification'**
  String get oTPCodeVerification;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @manually.
  ///
  /// In en, this message translates to:
  /// **'Manually'**
  String get manually;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @bluetoothManually.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth Manually'**
  String get bluetoothManually;

  /// No description provided for @nearByBluetoothTapToConnect.
  ///
  /// In en, this message translates to:
  /// **'Nearby Bluetooth, tap to connect'**
  String get nearByBluetoothTapToConnect;

  /// No description provided for @fireBolt146.
  ///
  /// In en, this message translates to:
  /// **'FireBoltt 146'**
  String get fireBolt146;

  /// No description provided for @warmTips.
  ///
  /// In en, this message translates to:
  /// **'Warm Tips'**
  String get warmTips;

  /// No description provided for @searchDevice.
  ///
  /// In en, this message translates to:
  /// **'Search Device'**
  String get searchDevice;

  /// No description provided for @idAuthentication.
  ///
  /// In en, this message translates to:
  /// **'ID Authentication'**
  String get idAuthentication;

  /// No description provided for @inputAccountNo.
  ///
  /// In en, this message translates to:
  /// **'Input Account No.'**
  String get inputAccountNo;

  /// No description provided for @inputPassword.
  ///
  /// In en, this message translates to:
  /// **'Input Password'**
  String get inputPassword;

  /// No description provided for @roleChoice.
  ///
  /// In en, this message translates to:
  /// **'Role Choice'**
  String get roleChoice;

  /// No description provided for @pleaseSelectYourRole.
  ///
  /// In en, this message translates to:
  /// **'Please select your role?'**
  String get pleaseSelectYourRole;

  /// No description provided for @individual.
  ///
  /// In en, this message translates to:
  /// **'Individual'**
  String get individual;

  /// No description provided for @stationOwner.
  ///
  /// In en, this message translates to:
  /// **'Station Owner'**
  String get stationOwner;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @installer.
  ///
  /// In en, this message translates to:
  /// **'Installer'**
  String get installer;

  /// No description provided for @stationName.
  ///
  /// In en, this message translates to:
  /// **'Station Name'**
  String get stationName;

  /// No description provided for @model.
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @yourCity.
  ///
  /// In en, this message translates to:
  /// **'Your City'**
  String get yourCity;

  /// No description provided for @collectorAddress.
  ///
  /// In en, this message translates to:
  /// **'Collector Address'**
  String get collectorAddress;

  /// No description provided for @timezone.
  ///
  /// In en, this message translates to:
  /// **'Timezone'**
  String get timezone;

  /// No description provided for @gMT0.
  ///
  /// In en, this message translates to:
  /// **'GMT 0'**
  String get gMT0;

  /// No description provided for @stationType.
  ///
  /// In en, this message translates to:
  /// **'Station Type'**
  String get stationType;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @tip.
  ///
  /// In en, this message translates to:
  /// **'Tip'**
  String get tip;

  /// No description provided for @companyCode.
  ///
  /// In en, this message translates to:
  /// **'Company Code'**
  String get companyCode;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @mail.
  ///
  /// In en, this message translates to:
  /// **'Mail'**
  String get mail;

  /// No description provided for @enterMailBox.
  ///
  /// In en, this message translates to:
  /// **'Enter Mail Box'**
  String get enterMailBox;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @otp.
  ///
  /// In en, this message translates to:
  /// **'Otp'**
  String get otp;

  /// No description provided for @enterVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Verification Code'**
  String get enterVerificationCode;

  /// No description provided for @accountIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Account Is Required'**
  String get accountIsRequired;

  /// No description provided for @emailIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Email Is Required'**
  String get emailIsRequired;

  /// No description provided for @emailIdIsInvalid.
  ///
  /// In en, this message translates to:
  /// **'Email Id Is Invalid'**
  String get emailIdIsInvalid;

  /// No description provided for @passwordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Password Is Required'**
  String get passwordIsRequired;

  /// No description provided for @continueCap.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueCap;

  /// No description provided for @pleaseUseYourPhoneNumberOrEmailToObtain.
  ///
  /// In en, this message translates to:
  /// **'Please use your phone number or email  to obtain \nthe verification code'**
  String get pleaseUseYourPhoneNumberOrEmailToObtain;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @plant.
  ///
  /// In en, this message translates to:
  /// **'Plant'**
  String get plant;

  /// No description provided for @alarm.
  ///
  /// In en, this message translates to:
  /// **'Alarm'**
  String get alarm;

  /// No description provided for @userCenter.
  ///
  /// In en, this message translates to:
  /// **'User Center'**
  String get userCenter;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
