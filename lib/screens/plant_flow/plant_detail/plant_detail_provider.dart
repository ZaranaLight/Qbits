import 'package:qbits/qbits.dart';

class PlantDetailProvider extends ChangeNotifier {
  bool loader = false;

  int previousIndex = 0;

  final PageController pageController = PageController();

  PlantDetailProvider() {
    init();
  }

  void init() {
    if (!_isInitialized) {
      _loadChartData();
      _isInitialized = true;
    }
  }

  bool _isFollow = false;

  bool get isFollow => _isFollow;

  setFollow(bool value) {
    _isFollow = value;
    showCustomToast(_isFollow ? "Following the plant" : "Unfollowed the plant");
    notifyListeners();
  }

  int _plantPageControllerIndex = 0;

  int get  plantPageControllerIndex => _plantPageControllerIndex;

  void setPlantPageController(int index) {
    _plantPageControllerIndex = index;
    notifyListeners();
  }

  ChartViewType _viewType = ChartViewType.day;

  ChartViewType get viewType => _viewType;

  DateTime selectedDate = DateTime.now();

  void updateDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void setViewType(ChartViewType type) {
    _viewType = type;

    switch (_viewType) {
      case ChartViewType.day:
        selectedDate = DateTime.now();
        break;

      case ChartViewType.month:
        selectedDate = DateTime(selectedDate.year, selectedDate.month, 1);
        break;

      case ChartViewType.year: // Reset to Jan 1 of selected year
        selectedDate = DateTime(selectedDate.year, 1, 1);
        break;

      case ChartViewType.total:
        selectedDate = DateTime.now(); // or keep as is
        break;
    }

    _loadChartData();

    notifyListeners();
  }

  void selectTab(int index) {
    _selectedIndex = index;

    switch (_tabs[_selectedIndex]) {
      case 'Day':
        _viewType = ChartViewType.day;
        break;
      case 'Month':
        _viewType = ChartViewType.month;
        break;
      case 'Year':
        _viewType = ChartViewType.year;
        break;
      case 'Total':
        _viewType = ChartViewType.total;
        break;
    }

    setViewType(_viewType);
  }

  String get displayDate {
    switch (viewType) {
      case ChartViewType.day:
        return _formatDate(selectedDate);
      case ChartViewType.month:
        return _formatMonth(selectedDate);
      case ChartViewType.year:
        return "${selectedDate.year}";
      default:
        return "-";
    }
  }

  String _formatDate(DateTime date) =>
      "${date.year}-${_pad(date.month)}-${_pad(date.day)}";

  String _formatMonth(DateTime date) => "${date.year}-${_pad(date.month)}";

  String _pad(int value) => value.toString().padLeft(2, '0');

  final List<String> _tabs = ['Day', 'Month', 'Year', 'Total'];

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  List<FlSpot> _chartData = [];

  List<FlSpot> get chartData => _chartData;

  String get currentTab => _tabs[_selectedIndex];

  List<String> get tabs => _tabs;

  bool _isInitialized = false;

  String getXAxisLabel(double value) {
    switch (_viewType) {
      case ChartViewType.day:
        return '${value.toInt()}:00'; // 1 AM, 2 AM, ...
      case ChartViewType.month:
        return '${value.toInt()}'; // 1 to 31
      case ChartViewType.year:
        const months = [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec',
        ];
        int index = value.toInt().clamp(0, 11); // Safe indexing
        return months[index];
      case ChartViewType.total:
        return 'Y${value.toInt()}';
    }
  }

  void updateChart(List<FlSpot> newData) {
    _chartData = newData;
    notifyListeners();
  }

  void _loadChartData() {
    switch (currentTab) {
      case 'Day':
        updateChart([FlSpot(0, 1), FlSpot(2, 4), FlSpot(6, 7), FlSpot(8, 10)]);
        break;
      case 'Month':
        updateChart([FlSpot(0, 3), FlSpot(2, 6), FlSpot(4, 9), FlSpot(8, 8)]);
        break;
      case 'Year':
        updateChart([FlSpot(0, 5), FlSpot(2, 9), FlSpot(4, 13), FlSpot(6, 10)]);
        break;
      case 'Total':
        updateChart([FlSpot(0, 8), FlSpot(4, 12), FlSpot(5, 10), FlSpot(6, 5)]);
        break;
    }
  }

  final List<String> preferenceOptions = [
    'AC Power',
    'Voltage V1',
    'Voltage V2',
  ];

  String _selectedPreference = 'AC Power';

  String get selectedPreference => _selectedPreference;

  double? acPower;
  double? voltageV1;
  double? voltageV2;

  void updateSelectedPreference(String value) {
    _selectedPreference = value;
    _loadFieldData();
    notifyListeners();
  }

  void _loadFieldData() {
    switch (_selectedPreference) {
      case 'AC Power':
        acPower = 345.6;
        break;
      case 'Voltage V1':
        voltageV1 = 230.0;
        break;
      case 'Voltage V2':
        voltageV2 = 235.5;
        break;
    }
  }

  //============Device  ---provider -----------

  final List<String> deviceOption = ['All', 'Normal', 'Fault', 'Offline'];

  String _selectedDeviceOption = 'All';

  String get selectedDeviceOption => _selectedDeviceOption;

  String? all;
  String? normal;
  String? fault;
  String? offline;

  void updateSelectedDevice(String value) {
    _selectedDeviceOption = value;

    notifyListeners();
  }

  //============Alarm   ----------- -----------

  int _selectedAlarmIndex = 0;

  int get selectedAlarmIndex => _selectedAlarmIndex;

  void changeAlarmTab(int index) {
    _selectedAlarmIndex = index;
    notifyListeners();
  }

  // -------------change inverter and collector tab
  int _deviceTabIndex = 0;

  int get deviceTabIndex => _deviceTabIndex;

  void changeDeviceTabTo(int index) {
    _deviceTabIndex = index;
    notifyListeners();
  }
}
