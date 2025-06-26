import 'package:qbits/qbits.dart';

class SelectRegionProvider extends ChangeNotifier {
  SelectRegionProvider({this.initialRegion}) {
    if (initialRegion != null && _checkboxes.containsKey(initialRegion)) {
      _checkboxes.updateAll((key, value) => key == initialRegion);
    }
  }

  final String? initialRegion;

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

  void selectOnly(String selectedName) {
    _checkboxes.updateAll((key, value) => key == selectedName);
    notifyListeners();
  }

  String get selectedRegion =>
      _checkboxes.entries
          .firstWhere((e) => e.value, orElse: () => const MapEntry("", false))
          .key;

  bool isChecked(String name) => _checkboxes[name] ?? false;

  List<String> get regionCheckBoxNameList => _checkboxes.keys.toList();
}
