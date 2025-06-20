import 'package:qbits/common/widget/app_qr_scanner_screen.dart';
import 'package:qbits/qbits.dart';

class AddInverterModel {
  // Existing fields...
  String inverterNo;
  String rs485Id;
  String serialNumber;
  String panelWatt;
  String panelCount;

  AddInverterModel({
    // Existing default values...
    this.inverterNo = '1',
    this.rs485Id = '1',
    this.serialNumber = '123456789',
    this.panelWatt = '0',
    this.panelCount = '0',
  });
}

class AddInverterProvider extends ChangeNotifier {
  final AddInverterModel _addInverterModel = AddInverterModel();

  AddInverterModel get addInverterModel => _addInverterModel;

  void updateInverterNo(String value) {
    _addInverterModel.inverterNo = value;
    notifyListeners();
  }

  void updateRS485Id(String value) {
    _addInverterModel.rs485Id = value;
    notifyListeners();
  }

  void updateSerialNumber(String value) {
    _addInverterModel.serialNumber = value;
    notifyListeners();
  }

  void updatePanelWatt(String value) {
    _addInverterModel.panelWatt = value;
    notifyListeners();
  }

  void updatePanelCount(String value) {
    _addInverterModel.panelCount = value;
    notifyListeners();
  }

  void setModel(String value) {
    selectedModel = value;
    notifyListeners();
  }

  void setGMT(String value) {
    selectedGMT = value;
    notifyListeners();
  }

  final List<String> modelOptions = ['QB-2KTLS', 'QB-3KTLS', 'QB-5KTLS'];
  final List<String> gmtOptions = ['Philippines', 'India', 'China', 'USA'];

  String selectedModel = 'QB-2KTLS';
  String selectedGMT = 'Philippines';

  Future<void> onTapScanner(BuildContext context, String scannedQR) async {
    final scannedResult = await context.navigator.push<String>(
      MaterialPageRoute(builder: (_) => QRScannerScreen()),
    );
    if (scannedResult != null && scannedResult.isNotEmpty) {
      if (scannedQR == 'model') {
        selectedModel = scannedResult;
      }
      notifyListeners(); // notify UI about the change
    }
  }
}
