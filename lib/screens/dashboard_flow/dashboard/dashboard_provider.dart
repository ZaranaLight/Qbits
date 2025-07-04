import 'package:qbits/qbits.dart';

class DashboardProvider extends ChangeNotifier {
  bool loader = false;
  int pageIndex = 0;

  void onPageChanged(int index) {
    pageIndex = index;
    notifyListeners();
  }

}
