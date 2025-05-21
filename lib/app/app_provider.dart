import 'package:qbits/qbits.dart';

class AppProvider extends ChangeNotifier {
  Locale? locale;

  List<Locale> get languageList => [Locale("en", "US"), Locale("es", "ES")];

  AppProvider() {
    init();
  }

  void init() {
    final locale = getLanStrToLocale(
      PrefService.getString(PrefKeys.localLanguage),
    );
    this.locale = locale;
    notifyListeners();
  }

  Future<void> changeLanguage(Locale locale) async {
    this.locale = locale;
    notifyListeners();
    await PrefService.set(PrefKeys.localLanguage, getLanLocaleToStr(locale));
  }

  Locale getLanStrToLocale(String lan) {
    if (lan.isEmpty) {
      return const Locale("en", "US");
    }
    String lanCode = lan.split('_').first;
    String countryCode = lan.split('_').last;
    return Locale(lanCode, countryCode);
  }

  String getLanLocaleToStr(Locale locale) {
    return "${locale.languageCode}_${locale.countryCode}";
  }
}
