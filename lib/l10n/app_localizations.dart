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

  /// No description provided for @selectRegionDescription.
  ///
  /// In en, this message translates to:
  /// **'Select Region Description'**
  String get selectRegionDescription;

  /// No description provided for @pleaseSelectTheRegionThatCorrespondsTo.
  ///
  /// In en, this message translates to:
  /// **'Please Select the region that corresponds to your business scope. The system will provide access to data and services specific to your.'**
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

  /// No description provided for @production.
  ///
  /// In en, this message translates to:
  /// **'Production'**
  String get production;

  /// No description provided for @dayEnergy.
  ///
  /// In en, this message translates to:
  /// **'Day Energy'**
  String get dayEnergy;

  /// No description provided for @plantInfo.
  ///
  /// In en, this message translates to:
  /// **'Plant Info'**
  String get plantInfo;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @longitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude'**
  String get longitude;

  /// No description provided for @latitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude'**
  String get latitude;

  /// No description provided for @ownerPhone.
  ///
  /// In en, this message translates to:
  /// **'Owner’s Phone'**
  String get ownerPhone;

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

  /// No description provided for @guidance.
  ///
  /// In en, this message translates to:
  /// **'Guidance'**
  String get guidance;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Station Owner Is Required'**
  String get required;

  /// No description provided for @qrCodeScanning.
  ///
  /// In en, this message translates to:
  /// **'QR Code Scanning'**
  String get qrCodeScanning;

  /// No description provided for @enterValid10DigitPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid 10-digit phone number'**
  String get enterValid10DigitPhoneNumber;

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

  /// No description provided for @going.
  ///
  /// In en, this message translates to:
  /// **'Going'**
  String get going;

  /// No description provided for @recovered.
  ///
  /// In en, this message translates to:
  /// **'Recovered'**
  String get recovered;

  /// No description provided for @fault.
  ///
  /// In en, this message translates to:
  /// **'Fault'**
  String get fault;

  /// No description provided for @mail.
  ///
  /// In en, this message translates to:
  /// **'Mail'**
  String get mail;

  /// No description provided for @profileInformation.
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get profileInformation;

  /// No description provided for @accountCancellation.
  ///
  /// In en, this message translates to:
  /// **'Account Cancellation'**
  String get accountCancellation;

  /// No description provided for @nameISRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is Required'**
  String get nameISRequired;

  /// No description provided for @contactInformationISRequired.
  ///
  /// In en, this message translates to:
  /// **'Contact information is Required'**
  String get contactInformationISRequired;

  /// No description provided for @qqISRequired.
  ///
  /// In en, this message translates to:
  /// **'QQ is Required'**
  String get qqISRequired;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @howDoIAddressYou.
  ///
  /// In en, this message translates to:
  /// **'How do i address you'**
  String get howDoIAddressYou;

  /// No description provided for @qq.
  ///
  /// In en, this message translates to:
  /// **'QQ'**
  String get qq;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// No description provided for @questionOrSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Question or Suggestion'**
  String get questionOrSuggestion;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @clickToImproveContentInformation.
  ///
  /// In en, this message translates to:
  /// **'Click to improve content information'**
  String get clickToImproveContentInformation;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @autoSignIn.
  ///
  /// In en, this message translates to:
  /// **'Auto Sign In'**
  String get autoSignIn;

  /// No description provided for @endUser.
  ///
  /// In en, this message translates to:
  /// **'End User'**
  String get endUser;

  /// No description provided for @qa.
  ///
  /// In en, this message translates to:
  /// **'QA'**
  String get qa;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @noEquipment.
  ///
  /// In en, this message translates to:
  /// **'No Equipment'**
  String get noEquipment;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @operationGuide.
  ///
  /// In en, this message translates to:
  /// **'Operation Guide'**
  String get operationGuide;

  /// No description provided for @enterMailBox.
  ///
  /// In en, this message translates to:
  /// **'Enter Mail Box'**
  String get enterMailBox;

  /// No description provided for @realTimePower.
  ///
  /// In en, this message translates to:
  /// **'Real Time Power'**
  String get realTimePower;

  /// No description provided for @generationToday.
  ///
  /// In en, this message translates to:
  /// **'Generation Today'**
  String get generationToday;

  /// No description provided for @cumulativeGeneration.
  ///
  /// In en, this message translates to:
  /// **'Cumulative Generation'**
  String get cumulativeGeneration;

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

  /// No description provided for @cameraPermissionContent.
  ///
  /// In en, this message translates to:
  /// **'This app needs access to your camera to take photos and scan images. Please grant camera permission to continue.'**
  String get cameraPermissionContent;

  /// No description provided for @cameraPermission.
  ///
  /// In en, this message translates to:
  /// **'Camera Permission'**
  String get cameraPermission;

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

  /// No description provided for @originalPasswordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Original Password Is Required'**
  String get originalPasswordIsRequired;

  /// No description provided for @newPasswordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'New Password Is Required'**
  String get newPasswordIsRequired;

  /// No description provided for @stationNameIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Station Name Is Required'**
  String get stationNameIsRequired;

  /// No description provided for @modelIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Model Is Required'**
  String get modelIsRequired;

  /// No description provided for @confirmPasswordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password Is Required'**
  String get confirmPasswordIsRequired;

  /// No description provided for @passwordAndConfirmPasswordIsNotMatching.
  ///
  /// In en, this message translates to:
  /// **'Password and Confirm Password Isn\'t Matching'**
  String get passwordAndConfirmPasswordIsNotMatching;

  /// No description provided for @confirmNewPasswordIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password Is Required'**
  String get confirmNewPasswordIsRequired;

  /// No description provided for @newPasswordAndConfirmNewPasswordIsNotMatching.
  ///
  /// In en, this message translates to:
  /// **'New Password and Confirm New Password Isn\'t Matching'**
  String get newPasswordAndConfirmNewPasswordIsNotMatching;

  /// No description provided for @yourCityIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Your City Is Required'**
  String get yourCityIsRequired;

  /// No description provided for @collectorAddressIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Collector Address Is Required'**
  String get collectorAddressIsRequired;

  /// No description provided for @timezoneIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Timezone Is Required'**
  String get timezoneIsRequired;

  /// No description provided for @stationTypeIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Station Type Is Required'**
  String get stationTypeIsRequired;

  /// No description provided for @phoneNumberIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone Number Is Required'**
  String get phoneNumberIsRequired;

  /// No description provided for @phoneNumberIsInvalid.
  ///
  /// In en, this message translates to:
  /// **'Phone Number Is Invalid'**
  String get phoneNumberIsInvalid;

  /// No description provided for @mailIsInvalid.
  ///
  /// In en, this message translates to:
  /// **'Mail Is Invalid'**
  String get mailIsInvalid;

  /// No description provided for @companyCodeIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Company Code Is Required'**
  String get companyCodeIsRequired;

  /// No description provided for @mailIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Mail Is Required'**
  String get mailIsRequired;

  /// No description provided for @mailIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'Mail Is Not Valid'**
  String get mailIsNotValid;

  /// No description provided for @verificationCodeIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Verification Code Is Required'**
  String get verificationCodeIsRequired;

  /// No description provided for @verificationCodeIsntMatching.
  ///
  /// In en, this message translates to:
  /// **'Verification Code Isn\'t Matching'**
  String get verificationCodeIsntMatching;

  /// No description provided for @continueCap.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueCap;

  /// No description provided for @pleaseUseYourPhoneNumberOrEmailToObtain.
  ///
  /// In en, this message translates to:
  /// **'Please use your phone number or email  to obtain the verification code'**
  String get pleaseUseYourPhoneNumberOrEmailToObtain;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @accountSecurity.
  ///
  /// In en, this message translates to:
  /// **'Account Security'**
  String get accountSecurity;

  /// No description provided for @setPassword.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get setPassword;

  /// No description provided for @originalPassword.
  ///
  /// In en, this message translates to:
  /// **'Original Password'**
  String get originalPassword;

  /// No description provided for @enterOriginalPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Original Password'**
  String get enterOriginalPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter New Password'**
  String get enterNewPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @enterConfirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Confirm New Password'**
  String get enterConfirmNewPassword;

  /// No description provided for @setProfitComputeMode.
  ///
  /// In en, this message translates to:
  /// **'Set Profit Compute Mode'**
  String get setProfitComputeMode;

  /// No description provided for @profitComputeMode.
  ///
  /// In en, this message translates to:
  /// **'Profit Compute Mode'**
  String get profitComputeMode;

  /// No description provided for @myProfit.
  ///
  /// In en, this message translates to:
  /// **'My Profit'**
  String get myProfit;

  /// No description provided for @totalEnergy.
  ///
  /// In en, this message translates to:
  /// **'Total Energy'**
  String get totalEnergy;

  /// No description provided for @averageElectricPrice.
  ///
  /// In en, this message translates to:
  /// **'Average Electric Price'**
  String get averageElectricPrice;

  /// No description provided for @parameterSet.
  ///
  /// In en, this message translates to:
  /// **'Parameter Set'**
  String get parameterSet;

  /// No description provided for @energySubsidizedPrice.
  ///
  /// In en, this message translates to:
  /// **'Energy Subsidized Price'**
  String get energySubsidizedPrice;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @failedToDecodeQR.
  ///
  /// In en, this message translates to:
  /// **'Failed to decode QR'**
  String get failedToDecodeQR;

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

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @myWatchlist.
  ///
  /// In en, this message translates to:
  /// **'My Watchlist'**
  String get myWatchlist;

  /// No description provided for @totalProductionPower.
  ///
  /// In en, this message translates to:
  /// **'Total Production Power'**
  String get totalProductionPower;

  /// No description provided for @installCapacity.
  ///
  /// In en, this message translates to:
  /// **'Install Capacity'**
  String get installCapacity;

  /// No description provided for @monthlyProduction.
  ///
  /// In en, this message translates to:
  /// **'Monthly Production'**
  String get monthlyProduction;

  /// No description provided for @totalProduction.
  ///
  /// In en, this message translates to:
  /// **'Total Production'**
  String get totalProduction;

  /// No description provided for @dailyProduction.
  ///
  /// In en, this message translates to:
  /// **'Daily Production'**
  String get dailyProduction;

  /// No description provided for @yearlyProduction.
  ///
  /// In en, this message translates to:
  /// **'Yearly Production'**
  String get yearlyProduction;

  /// No description provided for @totalPlants.
  ///
  /// In en, this message translates to:
  /// **'Total Plants'**
  String get totalPlants;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @deviceLibery.
  ///
  /// In en, this message translates to:
  /// **'Device Libery'**
  String get deviceLibery;

  /// No description provided for @allQuantity.
  ///
  /// In en, this message translates to:
  /// **'All Quantity'**
  String get allQuantity;

  /// No description provided for @correlate.
  ///
  /// In en, this message translates to:
  /// **'Correlate'**
  String get correlate;

  /// No description provided for @uncorrelate.
  ///
  /// In en, this message translates to:
  /// **'Uncorrelate'**
  String get uncorrelate;

  /// No description provided for @dailyActivity.
  ///
  /// In en, this message translates to:
  /// **'Daily Activity'**
  String get dailyActivity;

  /// No description provided for @monthlyActivity.
  ///
  /// In en, this message translates to:
  /// **'Monthly Activity'**
  String get monthlyActivity;

  /// No description provided for @yearlyActivity.
  ///
  /// In en, this message translates to:
  /// **'Yearly Activity'**
  String get yearlyActivity;

  /// No description provided for @noMoreData.
  ///
  /// In en, this message translates to:
  /// **'No More Data'**
  String get noMoreData;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @power.
  ///
  /// In en, this message translates to:
  /// **'Power'**
  String get power;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @searchHistory.
  ///
  /// In en, this message translates to:
  /// **'Search History'**
  String get searchHistory;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @rank.
  ///
  /// In en, this message translates to:
  /// **'Rank'**
  String get rank;

  /// No description provided for @preference.
  ///
  /// In en, this message translates to:
  /// **'Preference'**
  String get preference;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @equative.
  ///
  /// In en, this message translates to:
  /// **'Equative'**
  String get equative;

  /// No description provided for @capacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity'**
  String get capacity;

  /// No description provided for @powerKW.
  ///
  /// In en, this message translates to:
  /// **'Power(kW):'**
  String get powerKW;

  /// No description provided for @inTotalKWh.
  ///
  /// In en, this message translates to:
  /// **'In Total(kWh)'**
  String get inTotalKWh;

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @dayPowerTotal.
  ///
  /// In en, this message translates to:
  /// **'Day - Power - Total'**
  String get dayPowerTotal;

  /// No description provided for @capacityPowerEquative.
  ///
  /// In en, this message translates to:
  /// **'Capacity - Power - Equative'**
  String get capacityPowerEquative;

  /// No description provided for @dayMonthYear.
  ///
  /// In en, this message translates to:
  /// **'Day - Month - Year'**
  String get dayMonthYear;

  /// No description provided for @device.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @dailyGeneration.
  ///
  /// In en, this message translates to:
  /// **'Daily Generation'**
  String get dailyGeneration;

  /// No description provided for @monthlyGeneration.
  ///
  /// In en, this message translates to:
  /// **'Monthly Generation'**
  String get monthlyGeneration;

  /// No description provided for @totalGeneration.
  ///
  /// In en, this message translates to:
  /// **'Total Generation'**
  String get totalGeneration;

  /// No description provided for @yearlyGeneration.
  ///
  /// In en, this message translates to:
  /// **'Yearly Generation'**
  String get yearlyGeneration;

  /// No description provided for @dailyConsumption.
  ///
  /// In en, this message translates to:
  /// **'Daily Consumption'**
  String get dailyConsumption;

  /// No description provided for @monthlyConsumption.
  ///
  /// In en, this message translates to:
  /// **'Monthly Consumption'**
  String get monthlyConsumption;

  /// No description provided for @totalConsumption.
  ///
  /// In en, this message translates to:
  /// **'Total Consumption'**
  String get totalConsumption;

  /// No description provided for @yearlyConsumption.
  ///
  /// In en, this message translates to:
  /// **'Yearly Consumption'**
  String get yearlyConsumption;

  /// No description provided for @dailyGridFeedIN.
  ///
  /// In en, this message translates to:
  /// **'Daily Grid Feed-in'**
  String get dailyGridFeedIN;

  /// No description provided for @yearlyGridFeedIN.
  ///
  /// In en, this message translates to:
  /// **'Yearly Grid Feed-in'**
  String get yearlyGridFeedIN;

  /// No description provided for @monthlyGridFeedIN.
  ///
  /// In en, this message translates to:
  /// **'Monthly Grid Feed-in'**
  String get monthlyGridFeedIN;

  /// No description provided for @totalGridFeedIN.
  ///
  /// In en, this message translates to:
  /// **'Total Grid Feed-in'**
  String get totalGridFeedIN;

  /// No description provided for @monthlyEnergyPurchased.
  ///
  /// In en, this message translates to:
  /// **'Monthly Energy Purchased'**
  String get monthlyEnergyPurchased;

  /// No description provided for @dailyEnergyPurchased.
  ///
  /// In en, this message translates to:
  /// **'Daily Energy Purchased'**
  String get dailyEnergyPurchased;

  /// No description provided for @totalEnergyPurchased.
  ///
  /// In en, this message translates to:
  /// **'Total Energy Purchased'**
  String get totalEnergyPurchased;

  /// No description provided for @yearlyEnergyPurchased.
  ///
  /// In en, this message translates to:
  /// **'Yearly Energy Purchased'**
  String get yearlyEnergyPurchased;

  /// No description provided for @dailyEnergyCharged.
  ///
  /// In en, this message translates to:
  /// **'Daily Energy Charged'**
  String get dailyEnergyCharged;

  /// No description provided for @monthlyEnergyCharged.
  ///
  /// In en, this message translates to:
  /// **'Monthly Energy Charged'**
  String get monthlyEnergyCharged;

  /// No description provided for @yearlyEnergyCharged.
  ///
  /// In en, this message translates to:
  /// **'Yearly Energy Charged'**
  String get yearlyEnergyCharged;

  /// No description provided for @totalEnergyCharged.
  ///
  /// In en, this message translates to:
  /// **'Total Energy Charged'**
  String get totalEnergyCharged;

  /// No description provided for @dailyEnergyDischarged.
  ///
  /// In en, this message translates to:
  /// **'Daily Energy Discharged'**
  String get dailyEnergyDischarged;

  /// No description provided for @monthEnergyDischarged.
  ///
  /// In en, this message translates to:
  /// **'Month Energy Discharged'**
  String get monthEnergyDischarged;

  /// No description provided for @yearlyEnergyDischarged.
  ///
  /// In en, this message translates to:
  /// **'Yearly Energy Discharged'**
  String get yearlyEnergyDischarged;

  /// No description provided for @totalEnergyDischarged.
  ///
  /// In en, this message translates to:
  /// **'Total Energy Discharged'**
  String get totalEnergyDischarged;

  /// No description provided for @inverter.
  ///
  /// In en, this message translates to:
  /// **'Inverter'**
  String get inverter;

  /// No description provided for @addUser.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get addUser;

  /// No description provided for @enterAccount.
  ///
  /// In en, this message translates to:
  /// **'Enter Account'**
  String get enterAccount;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterPassword;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get enterPhoneNumber;

  /// No description provided for @enterMail.
  ///
  /// In en, this message translates to:
  /// **'Enter Mail'**
  String get enterMail;

  /// No description provided for @passwordIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'Password is not valid'**
  String get passwordIsNotValid;

  /// No description provided for @addCollector.
  ///
  /// In en, this message translates to:
  /// **'Add Collector'**
  String get addCollector;

  /// No description provided for @serialNumber.
  ///
  /// In en, this message translates to:
  /// **'Serial Number'**
  String get serialNumber;

  /// No description provided for @enterSerialNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Serial Number'**
  String get enterSerialNumber;

  /// No description provided for @originalPasswordIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'Original Password is not valid'**
  String get originalPasswordIsNotValid;

  /// No description provided for @newPasswordIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'New Password is not valid'**
  String get newPasswordIsNotValid;

  /// No description provided for @confirmNewIsNotValid.
  ///
  /// In en, this message translates to:
  /// **'Confirm new is not valid'**
  String get confirmNewIsNotValid;

  /// No description provided for @serialNumberIsRequired.
  ///
  /// In en, this message translates to:
  /// **'Serial number is required'**
  String get serialNumberIsRequired;

  /// No description provided for @parameter.
  ///
  /// In en, this message translates to:
  /// **'Parameter'**
  String get parameter;

  /// No description provided for @architecture.
  ///
  /// In en, this message translates to:
  /// **'Architecture'**
  String get architecture;

  /// No description provided for @collectorModel.
  ///
  /// In en, this message translates to:
  /// **'Collector Model'**
  String get collectorModel;

  /// No description provided for @runningStatus.
  ///
  /// In en, this message translates to:
  /// **'Running Status'**
  String get runningStatus;

  /// No description provided for @collectorSN.
  ///
  /// In en, this message translates to:
  /// **'Collector SN'**
  String get collectorSN;

  /// No description provided for @dataEnergy.
  ///
  /// In en, this message translates to:
  /// **'Data Energy'**
  String get dataEnergy;

  /// No description provided for @voltage.
  ///
  /// In en, this message translates to:
  /// **'Voltage'**
  String get voltage;

  /// No description provided for @batteryCapacity.
  ///
  /// In en, this message translates to:
  /// **'Battery Capacity'**
  String get batteryCapacity;

  /// No description provided for @workingStatus.
  ///
  /// In en, this message translates to:
  /// **'Working Status'**
  String get workingStatus;

  /// No description provided for @testStatus.
  ///
  /// In en, this message translates to:
  /// **'Test Status'**
  String get testStatus;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get current;

  /// No description provided for @bmsComStatus.
  ///
  /// In en, this message translates to:
  /// **'BMS COM Status'**
  String get bmsComStatus;

  /// No description provided for @bmsTemperature.
  ///
  /// In en, this message translates to:
  /// **'BMS Temperature'**
  String get bmsTemperature;

  /// No description provided for @bmsMaxChargingCurrent.
  ///
  /// In en, this message translates to:
  /// **'BMS Max. Charging\nCurrent'**
  String get bmsMaxChargingCurrent;

  /// No description provided for @bmsMaxDischargingCurrent.
  ///
  /// In en, this message translates to:
  /// **'BMS Max. Discharging\nCurrent'**
  String get bmsMaxDischargingCurrent;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @alerts.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get alerts;

  /// No description provided for @basic.
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get basic;

  /// No description provided for @solar.
  ///
  /// In en, this message translates to:
  /// **'Solar'**
  String get solar;

  /// No description provided for @acInfo.
  ///
  /// In en, this message translates to:
  /// **'Ac Info'**
  String get acInfo;

  /// No description provided for @frequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get frequency;

  /// No description provided for @remoteControl.
  ///
  /// In en, this message translates to:
  /// **'Remote control'**
  String get remoteControl;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @panel.
  ///
  /// In en, this message translates to:
  /// **'Panel'**
  String get panel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @totalProduct.
  ///
  /// In en, this message translates to:
  /// **'Total Product'**
  String get totalProduct;

  /// No description provided for @totalPower.
  ///
  /// In en, this message translates to:
  /// **'Total Power'**
  String get totalPower;

  /// No description provided for @setUp.
  ///
  /// In en, this message translates to:
  /// **'Set Up'**
  String get setUp;

  /// No description provided for @addInverter.
  ///
  /// In en, this message translates to:
  /// **'Add Inverter'**
  String get addInverter;

  /// No description provided for @addEnergyManager.
  ///
  /// In en, this message translates to:
  /// **'Add Energy Manager'**
  String get addEnergyManager;

  /// No description provided for @collector.
  ///
  /// In en, this message translates to:
  /// **'Collector'**
  String get collector;
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
