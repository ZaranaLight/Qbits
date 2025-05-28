import 'package:qbits/qbits.dart';

class InverterProvider extends ChangeNotifier {
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

  // List<FlSpot> get chartData {
  //   switch (_viewType) {
  //     case ChartViewType.day:
  //       return _dayData;
  //     case ChartViewType.month:
  //       return _monthData;
  //     case ChartViewType.year:
  //       return _yearData;
  //     case ChartViewType.total:
  //       return _totalData;
  //   }
  // }

  void setViewType(ChartViewType type) {
    _viewType = type;
    notifyListeners();
  }

  final List<FlSpot> _dayData = [
    FlSpot(0, 0),
    FlSpot(2, 5),
    FlSpot(4, 10),
    FlSpot(6, 7),
    FlSpot(8, 2),
    FlSpot(10, 0),
  ];

  final List<FlSpot> _monthData = [
    FlSpot(0, 10),
    FlSpot(1, 12),
    FlSpot(2, 9),
    FlSpot(3, 14),
    FlSpot(4, 11),
  ];

  final List<FlSpot> _yearData = [
    FlSpot(0, 50),
    FlSpot(1, 80),
    FlSpot(2, 40),
    FlSpot(3, 90),
    FlSpot(4, 70),
  ];

  final List<FlSpot> _totalData = [
    FlSpot(0, 150),
    FlSpot(1, 180),
    FlSpot(2, 170),
    FlSpot(3, 190),
  ];

  DateTime selectedDate = DateTime.now();

  void updateType(ChartViewType type) {
    _viewType = type;
    notifyListeners();
  }

  void updateDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
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
        return "";
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

  void selectTab(int index) {
    _selectedIndex = index;
    _loadChartData();
    notifyListeners();
  }

  void nextTab() {
    _selectedIndex = (_selectedIndex + 1) % _tabs.length;
    _loadChartData();
    notifyListeners();
  }

  void previousTab() {
    _selectedIndex = (_selectedIndex - 1 + _tabs.length) % _tabs.length;
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
}
