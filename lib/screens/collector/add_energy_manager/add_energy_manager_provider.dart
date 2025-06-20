import 'package:qbits/qbits.dart';

class AddEnergyManagerProvider with ChangeNotifier {
  String bindCollector = "241012992";
  String equipmentNo = "1";
  String equipment = "ASEC1000";
  String model = "";
  String gmt = "GMT 8";
  String serialNumber = "";

  String selectedGMT = 'Philippines';

  final List<String> gmtOptions = ['Philippines', 'India', 'China', 'USA'];
  final List<String> equipmentOption = ['ASEC1000', 'Equipment1', 'Equipment2'];

  void updateSerial(String value) {
    serialNumber = value;
    notifyListeners();
  }

  void updateEquipmentNo(String value) {
    equipmentNo = value;
    notifyListeners();
  }

  void updateEquipmentTap(String value) {
    equipment = value;
    notifyListeners();
  }

  void setGMT(String value) {
    selectedGMT = value;
    notifyListeners();
  }

  void setEquipment(String value) {
    equipment = value;
    notifyListeners();
  }

  void submit() {
    // Submit logic

  }
}
