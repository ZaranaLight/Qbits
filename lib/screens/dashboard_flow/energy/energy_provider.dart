import 'dart:math';

import 'package:qbits/qbits.dart';

class EnergyProvider extends ChangeNotifier {
  EnergyProvider() {
    initialize();
  }

  bool _isInitialized = false;

  void initialize() {
    if (!_isInitialized) {
      _loadChartData();
      _isInitialized = true;
    }
  }

  bool loader = false;

  ChartViewType _viewType = ChartViewType.day;

  ChartViewType get viewType => _viewType;

  DateTime selectedDate = DateTime.now();

  void updateDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void setViewType(ChartViewType type) {
    _viewType = type;

    // Adjust selectedDate based on viewType
    switch (_viewType) {
      case ChartViewType.day:
        // Keep the selectedDate as is or set to today if needed
        selectedDate = DateTime.now();
        break;

      case ChartViewType.month:
        // Reset to the first day of the selected month
        selectedDate = DateTime(selectedDate.year, selectedDate.month, 1);
        break;

      case ChartViewType.year:
        // Reset to Jan 1 of selected year
        selectedDate = DateTime(selectedDate.year, 1, 1);
        break;

      case ChartViewType.total:
        // You might want to clear date or do nothing
        // For example:
        selectedDate = DateTime.now(); // or keep as is
        break;
    }

    // Optionally reset tab index if your tabs depend on this
    // _selectedIndex = 0;

    // Load data for the new view type
    _loadChartData();

    notifyListeners();
  }

  void selectTab(int index) {
    _selectedIndex = index;

    // Sync viewType with tab index
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

    // Adjust selectedDate on tab change
    setViewType(_viewType); // this will load data & notify

    // No need for notifyListeners here because setViewType calls it
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


  double getMaxY() {
    if (chartData.isEmpty) return 1000;
    final maxVal = chartData.map((e) => e.y).reduce(max);
    return (maxVal / 500).ceil() * 500; // Round to nearest 500
  }

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

  String _formatDate(DateTime date) =>
      "${date.year}-${_pad(date.month)}-${_pad(date.day)}";

  String _formatMonth(DateTime date) => "${date.year}-${_pad(date.month)}";

  String _pad(int value) => value.toString().padLeft(2, '0');

  final List<String> _tabs = ['Month', 'Year', 'Total'];
  final List<String> _deviceTabs = ['Inverter', 'Collector'];

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  void selectAlarmTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  List<FlSpot> _chartData = [];

  List<FlSpot> get chartData => _chartData;

  String get currentTab => _tabs[_selectedIndex];

  List<String> get tabs => _tabs;

  List<String> get deviceTabs => _deviceTabs;

  void nextTab() {
    _selectedIndex = (_selectedIndex + 1) % _tabs.length;
    selectTab(_selectedIndex);
    _loadChartData();
    notifyListeners();
  }

  void previousTab() {
    _selectedIndex = (_selectedIndex - 1 + _tabs.length) % _tabs.length;
    selectTab(_selectedIndex);

    _loadChartData();
    notifyListeners();
  }

  void updateChart(List<FlSpot> newData) {
    _chartData = newData;
    notifyListeners();
  }

  void _loadChartData() {
    switch (currentTab) {
      case 'Month':
        updateChart([
          FlSpot(0, 300),
          FlSpot(2, 600),
          FlSpot(4, 900),
          FlSpot(8, 800),
          FlSpot(4, 100),
          FlSpot(4, 900),
          FlSpot(7, 800),
          FlSpot(8, 900),
          FlSpot(4, 100),
          FlSpot(4, 500),
          FlSpot(8, 900),
        ]);
        break;
      case 'Year':
        updateChart([
          FlSpot(0, 500),
          FlSpot(2, 900),
          FlSpot(4, 130),
          FlSpot(2, 900),
          FlSpot(6, 100),
          FlSpot(5, 100),
          FlSpot(6, 100),
          FlSpot(3, 700),
          FlSpot(6, 500),
          FlSpot(6, 400),
          FlSpot(6, 500),
        ]);
        break;
      case 'Total':
        updateChart([
          FlSpot(0, 800),
          FlSpot(4, 120),
          FlSpot(5, 1000),
          FlSpot(5, 1000),
          FlSpot(6, 500),
          FlSpot(8, 700),
          FlSpot(8, 700),
          FlSpot(2, 800),
          FlSpot(2, 800),
          FlSpot(6, 900),
          FlSpot(7, 100),
        ]);
        break;
    }
  }

  final List<String> preferenceOptions = [
    'AC Power',
    'Voltage V1',
    'Voltage V2',
  ];

  // Currently selected preference
  String _selectedPreference = 'AC Power';

  String get selectedPreference => _selectedPreference;

  // Data related to each preference
  double? acPower;
  double? voltageV1;
  double? voltageV2;

  // Handle dropdown selection
  void updateSelectedPreference(String value) {
    _selectedPreference = value;
    _loadFieldData(); // Optional: load data for selected field
    notifyListeners();
  }

  // Simulate loading or fetching data
  void _loadFieldData() {
    switch (_selectedPreference) {
      case 'AC Power':
        acPower = 345.6; // Mock data or fetched from backend
        break;
      case 'Voltage V1':
        voltageV1 = 230.0;
        break;
      case 'Voltage V2':
        voltageV2 = 235.5;
        break;
    }
  }
}
