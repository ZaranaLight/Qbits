import 'package:qbits/qbits.dart';

class AddEnergyManagerProvider with ChangeNotifier {
  String bindCollector = "241012992";
  String equipmentNo = "";
  String equipment = "ASEC1000";
  String model = "";
  String gmt = "GMT 8";
  String serialNumber = "";
  String selectedGMT = 'Philippines';

  String bindCollectorError = "";
  String equipmentNoError = "";
  String serialNoError = "";
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

  void setGMT(String value) {
    selectedGMT = value;
    notifyListeners();
  }

  void setEquipment(String value) {
    equipment = value;
    notifyListeners();
  }

  bool validation(BuildContext context) {
    if (equipmentNo.isEmpty) {
      equipmentNoError = context.l10n?.equipmentNoIsRequired ?? "";
    } else {
      equipmentNoError = "";
    }
    if (serialNumber.isEmpty) {
      serialNoError = context.l10n?.serialNoIsRequired ?? "";
    } else {
      serialNoError = "";
    }

    notifyListeners();
    return bindCollectorError.isEmpty &&
        equipmentNoError.isEmpty &&
        serialNoError.isEmpty;
  }

  Future<void> onConfirmTap(BuildContext context) async {
    if (validation(context)) {
      context.navigator.pop();
      context.navigator.pop();
    }
  }
}
