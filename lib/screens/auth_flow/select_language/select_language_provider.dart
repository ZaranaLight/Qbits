import 'package:qbits/qbits.dart';

class SelectLanguageProvider extends ChangeNotifier {
  SelectLanguageProvider({this.initialLanguage}) {
    if (initialLanguage != null && _checkboxes.containsKey(initialLanguage)) {
      _checkboxes.updateAll((key, value) => key == initialLanguage);
    }
  }

  final String? initialLanguage;
  bool loader = false;
  final Map<String, bool> _checkboxes = {
    "Arabic": false,
    "English": false,
    "Chinese": false,
    "French": false,
    "Russian": false,
    "Spanish": false,
    "Japanese": false,
    "Turkish": false,
  };

  Map<String, bool> get checkboxes => _checkboxes;

  void selectOnly(String selectedName) {
    _checkboxes.updateAll((key, value) => key == selectedName);
    notifyListeners();
  }

  String get selectedLanguage =>
      _checkboxes.entries
          .firstWhere((e) => e.value, orElse: () => const MapEntry("", false))
          .key;

  bool isChecked(String name) => _checkboxes[name] ?? false;

  List<String> get languageCheckBoxNameList => _checkboxes.keys.toList();
}
