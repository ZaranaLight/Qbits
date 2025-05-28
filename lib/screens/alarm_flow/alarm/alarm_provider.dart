import 'package:qbits/qbits.dart';


class AlarmProvider extends ChangeNotifier {
  bool loader = false;

  AlarmProvider() {
    init();
  }
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
  void init() {}
}
