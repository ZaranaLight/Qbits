import 'package:qbits/qbits.dart';
import 'package:qbits/screens/remote_control/remote_tab_widget/advanced_set_widget.dart';
import 'package:qbits/screens/remote_control/remote_tab_widget/battery_set_widget.dart';
import 'package:qbits/screens/remote_control/remote_tab_widget/grid_set_widget.dart';
import 'package:qbits/screens/remote_control/remote_tab_widget/mode_widget.dart';
import 'package:qbits/screens/remote_control/remote_tab_widget/system_set_widget.dart';

class RemoteControlProvider extends ChangeNotifier {
  RemoteControlProvider() {}

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

  ///Basic Inverter Info
  final List<String> remoteControlTitle = [
    "System Set",
    "Mode",
    "Battery Set",
    "Grid Set",
    "Advanced Srt",
  ];

  final List<Widget> remoteControlContent = [
    SystemSetWidget(),
    ModeWidget(),
    BatterySetWidget(),
    GridSetWidget(),
    AdvancedSetWidget(),
  ];
}
