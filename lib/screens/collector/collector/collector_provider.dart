import 'package:qbits/qbits.dart';
import 'package:qbits/screens/collector/collector/model/collector_tabs_model.dart';
import 'package:qbits/screens/collector/collector/widget/basic_widget.dart';

class CollectorProvider extends ChangeNotifier {
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

  bool _isInitialized = false;

  CollectorModel get collectorModel => _collector;

  CollectorModel get collector => _collector;

  final List<String> collectorParameterTitle = ["Basic"];

  final List<Widget> collectorParameterContent = [BasicWidget()];

  final CollectorModel _collector = CollectorModel(
    model: 'WIFI-USB-ESP32',
    status: 'Offline',
    sn: '241012992',
  );

  int? _expandedIndex;

  int? get expandedIndex => _expandedIndex;

  void toggleExpanded(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = null; // collapse if already expanded
    } else {
      _expandedIndex = index; // expand this one
    }
    notifyListeners();
  }

  void _loadInitialData() {
    // Simulate data loading
    Future.delayed(Duration(seconds: 1), () {
      notifyListeners(); // Notify listeners after data is loaded
    });
  }
  int _deviceTabIndex = 0;

  int get deviceTabIndex => _deviceTabIndex;

  void changeDeviceTabTo(int index) {
    _deviceTabIndex = index;
    notifyListeners();
  }

}
