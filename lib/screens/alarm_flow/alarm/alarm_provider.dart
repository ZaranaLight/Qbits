import 'package:qbits/qbits.dart';

class AlarmProvider extends ChangeNotifier {
  bool loader = false;
  final PageController pageController = PageController();

  void init() {}

  AlarmProvider() {
    init();
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeTab(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int? hoveredIndex;

  void setHoveredIndex(int? index) {
    hoveredIndex = index;
    notifyListeners();
  }
}
