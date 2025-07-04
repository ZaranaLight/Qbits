import 'package:qbits/common/widget/app_qr_scanner_screen.dart';
import 'package:qbits/qbits.dart';

class EditInverterModel {
  String inverterNo;
  String rs485Id;
  String serialNumber;
  String panelWatt;
  String panelCount;

  EditInverterModel({
    this.inverterNo = '',
    this.rs485Id = '',
    this.serialNumber = '123456789',
    this.panelWatt = '',
    this.panelCount = '',
  });
}

class EditInverterProvider extends ChangeNotifier {
  String selectedModel = 'QB-2KTLS';
  String selectedGMT = 'Philippines';

  final List<String> modelOptions = ['QB-2KTLS', 'QB-3KTLS', 'QB-5KTLS'];

  final List<String> gmtOptions = ['Philippines', 'India', 'China', 'USA'];

  void setModel(String value) {
    selectedModel = value;
    notifyListeners();
  }

  void setGMT(String value) {
    selectedGMT = value;
    notifyListeners();
  }

  final EditInverterModel _editInverterModel = EditInverterModel();

  EditInverterModel get editInverterModel => _editInverterModel;

  void updateInverterNo(String value) {
    _editInverterModel.inverterNo = value;
    notifyListeners();
  }

  void updateRS485Id(String value) {
    _editInverterModel.rs485Id = value;
    notifyListeners();
  }

  void updateSerialNumber(String value) {
    _editInverterModel.serialNumber = value;
    notifyListeners();
  }

  void updatePanelWatt(String value) {
    _editInverterModel.panelWatt = value;
    notifyListeners();
  }

  void updatePanelCount(String value) {
    _editInverterModel.panelCount = value;
    notifyListeners();
  }

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
