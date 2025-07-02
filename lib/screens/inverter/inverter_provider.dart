import 'package:qbits/qbits.dart';
import 'package:qbits/screens/inverter/widget/hybrid_parameter_widgets/remote_control_grid_set_widget.dart';

class InverterProvider extends ChangeNotifier {
  bool _isInitialized = false;
  final String? inverterType;

  InverterProvider({this.inverterType}) {
    init();
  }

  void init() {
    if (!_isInitialized) {
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

  final List<String> parameterTitles = ["Inverter", "AC Info", "DC Info"];

  final List<String> hybridParameterTitles = [
    "Electricity Generation",
    "Back-Up",
    "Inverter",
    "Battery",
    "Grid",
    "Meter",
    "System",
    "Alerts",
    "Warning Code",
    "Energy",
    "Generator",
  ];



  ///
  //Hybrid data
  InverterData _inverterData = InverterData.empty();

  InverterData get inverterData => _inverterData;

  Future<void> fetchData() async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    // Update with mock data (replace with actual API call)
    _inverterData = InverterData(
      pvArrays: [
        PvData(voltage: 230.5, current: 5.2, power: 1198.6),
        PvData(voltage: 228.7, current: 4.9, power: 1120.6),
        PvData(voltage: 231.2, current: 5.1, power: 1179.1),
        PvData(voltage: 229.8, current: 5.0, power: 1149.0),
      ],
    );

    notifyListeners();
  }

  void updatePvData(int index, PvData newData) {
    _inverterData.pvArrays[index] = newData;

    notifyListeners();
  }

  // For Electricity Generation
  int? _selectedPvIndex;

  int? get selectedPvIndex => _selectedPvIndex;

  void selectPv(int index) {
    _selectedPvIndex = index;
    notifyListeners();
  }

  ///

  double pv1Voltage = 0;
  double pv1Current = 0;
  double pv1Power = 0;

  double batteryVoltage = 0;
  double batteryCurrent = 0;
  String batteryStatus = "Normal";

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

  final List<InverterParameterModel> _parameters = [
    InverterParameterModel(label: 'Power', value: '0 kW'),
    InverterParameterModel(label: 'Day', value: '2.61 kWh'),
    InverterParameterModel(label: 'In Total', value: '1378 kWh'),
    InverterParameterModel(label: 'Temperature', value: '58.5 ℃'),
    InverterParameterModel(label: 'Frequency', value: '50.25 Hz'),
    InverterParameterModel(label: 'Reactive Power', value: '0 Var'),
    InverterParameterModel(label: 'Power Factor', value: '1'),
    InverterParameterModel(
      label: 'Date Updated',
      value: '2025-05-22 13:28:55:009',
    ),
  ];

  List<InverterParameterModel> get parameters => _parameters;
  final List<InfoRowModel> _acInfoList = [
    InfoRowModel(text: "A", voltage: "234.8", current: "4.73"),
    // Add more rows if needed
  ];

  List<InfoRowModel> get acInfoList => _acInfoList;

  final List<InfoRowModel> _dcInfoList = [
    InfoRowModel(text: "A", voltage: "380.0", current: "5.20"),
  ];

  List<InfoRowModel> get dcInfoList => _dcInfoList;

  ///map statistics

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

  ///Basic Inverter Info
  final List<String> basicTitles = [
    "Station Overview",
    "Collector",
    "Inverter",
  ];

  final List<Widget> basicContent = [
    BasicContentWidget(
      items: [
        BasicInfoModel(key: 'Station Name', value: 'Agra'),
        BasicInfoModel(key: 'Your City', value: 'Agra'),
        BasicInfoModel(key: 'Created', value: '2024-11-06'),
        BasicInfoModel(key: 'Capacity', value: '0 kW'),
      ],
    ),
    BasicContentWidget(
      items: [
        BasicInfoModel(key: 'Collector Type', value: 'WIFI-USB-ESP32'),
        BasicInfoModel(key: 'SN', value: '240801078'),
        BasicInfoModel(key: 'Created', value: '240801078'),
      ],
    ),
    BasicContentWidget(
      items: [
        BasicInfoModel(key: 'Model', value: 'ASP-3.3KTLS'),
        BasicInfoModel(key: 'Modbus Address', value: '1'),
        BasicInfoModel(key: 'Created', value: '2024-11-06'),
        BasicInfoModel(key: 'Panel', value: '0(W)*0(pcs)'),
        BasicInfoModel(key: 'Timezone', value: '8'),
      ],
    ),
  ];
}
