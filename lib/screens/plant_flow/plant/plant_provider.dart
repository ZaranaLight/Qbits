import 'package:qbits/qbits.dart';

class PlantProvider extends ChangeNotifier {
  String? _selectedTitle;

  String? get selectedTitle => _selectedTitle;

  String? selectedPowerKW;

  String? selectedTotalKWh;

  bool followedPlantSelected = false;

  String? _selectedRank;

  String? get selectedRank => _selectedRank;
  bool? isAscending;

  void select(String title) {
    _selectedTitle = title;
    navigatorKey.currentState?.context.navigator.pop();
    notifyListeners();
  }

  bool isSelected(String title) => _selectedTitle == title;

  void selectPowerKW(String value) {
    selectedPowerKW = value;
    notifyListeners();
  }

  void selectTotalKWh(String value) {
    selectedTotalKWh = value;
    notifyListeners();
  }

  void toggleFollowedPlant() {
    followedPlantSelected = !followedPlantSelected;
    notifyListeners();
  }

  void selectRank(String title, bool ascending) {
    _selectedRank = '$title ${ascending ? "↑" : "↓"}';
    isAscending = ascending;
    navigatorKey.currentState?.context.navigator.pop();
    notifyListeners();
  }

  // bool isRankSelected(String rank, bool ascending) {
  //   return _selectedRank == rank && isAscending == ascending;
  // }

  bool get hasSelectedRank => _selectedRank != null;

  bool isRankSelected(String rank, bool ascending) {
    final current = '$rank ${ascending ? "↑" : "↓"}';
    return _selectedRank == current;
  }
}
