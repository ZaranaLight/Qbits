import 'package:qbits/qbits.dart';

class InverterProvider extends ChangeNotifier {
  InverterProvider() {
    initialize();
  }
  bool loader = false;
  void initialize() {
    if (!_isInitialized) {
      _loadChartData();
      _isInitialized = true;
    }
  }

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

  final List<String> titles = ["F2:09", "F2:09", "F2:09"];

  final List<String> contents = [
    "We’ve trained a model called ChatGPT which interacts in a conversational way. The dialogue format makes it possible for ChatGPT to answer followup questions, admit its mistakes, challenge incorrect premises, and reject inappropriate requests.",
    "We’ve trained a model called ChatGPT which interacts in a conversational way. The dialogue format makes it possible for ChatGPT to answer followup questions, admit its mistakes, challenge incorrect premises, and reject inappropriate requests.",
    "We’ve trained a model called ChatGPT which interacts in a conversational way. The dialogue format makes it possible for ChatGPT to answer followup questions, admit its mistakes, challenge incorrect premises, and reject inappropriate requests.",
  ];

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

  String _formatDate(DateTime date) =>
      "${date.year}-${_pad(date.month)}-${_pad(date.day)}";

  String _formatMonth(DateTime date) => "${date.year}-${_pad(date.month)}";

  String _pad(int value) => value.toString().padLeft(2, '0');

  final List<String> _tabs = ['Day', 'Month', 'Year', 'Total'];

  int _selectedIndex = 0;

  List<FlSpot> _chartData = [];

  List<FlSpot> get chartData => _chartData;

  String get currentTab => _tabs[_selectedIndex];

  int get selectedIndex => _selectedIndex;

  List<String> get tabs => _tabs;

  bool _isInitialized = false;

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
  final List<String> preferenceOptions = ['AC Power', 'Voltage V1', 'Voltage V2'];
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
