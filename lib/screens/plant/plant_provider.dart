import 'package:flutter/cupertino.dart';

class PlantProvider extends ChangeNotifier {
  String? _selectedTitle;
  String? get selectedTitle => _selectedTitle;
  String? selectedPowerKW;
  String? selectedTotalKWh;
  bool followedPlantSelected = false;

  void select(String title) {
    _selectedTitle = title;
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
}
