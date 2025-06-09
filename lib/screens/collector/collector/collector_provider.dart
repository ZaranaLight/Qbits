import 'package:qbits/qbits.dart';
class CollectorProvider extends ChangeNotifier {
  bool _isInitialized = false;

  CollectorProvider() {
    init();
  }

  void init() {
    if (!_isInitialized) {
      // Load initial data or perform setup
      _loadInitialData();
      _isInitialized = true;
    }
  }

  void _loadInitialData() {
    // Simulate data loading
    Future.delayed(Duration(seconds: 1), () {
      notifyListeners(); // Notify listeners after data is loaded
    });
  }

}