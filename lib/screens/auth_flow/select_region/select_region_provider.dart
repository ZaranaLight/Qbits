import 'package:qbits/qbits.dart';

class SelectRegionProvider extends ChangeNotifier {
  bool loader = false;
  final Map<String, bool> _checkboxes = {
    "China": false,
    "Europe": false,
    "International": false,
    "Africa": false,
    "Oceania": false,
    "North America": false,
    "South America": false,
    "Antarctica": false,
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

  List<String> get regionCheckBoxNameList => _checkboxes.keys.toList();
}
