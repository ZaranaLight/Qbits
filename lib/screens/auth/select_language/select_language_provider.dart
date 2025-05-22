import 'package:qbits/qbits.dart';

class SelectLanguageProvider extends ChangeNotifier {
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

  void toggle(String name) {
    if (_checkboxes.containsKey(name)) {
      _checkboxes[name] = !_checkboxes[name]!;
      notifyListeners();
    }
  }

  void setChecked(String name, bool value) {
    if (_checkboxes.containsKey(name)) {
      _checkboxes[name] = value;
      notifyListeners();
    }
  }

  bool isChecked(String name) => _checkboxes[name] ?? false;

  List<String> get languageCheckBoxNameList => _checkboxes.keys.toList();
}
