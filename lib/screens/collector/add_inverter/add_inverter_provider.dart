import 'package:qbits/common/widget/app_qr_scanner_screen.dart';
import 'package:qbits/qbits.dart';

class AddInverterModel {
  String inverterNo;
  String rs485Id;
  String serialNumber;
  String panelWatt;
  String panelCount;

  AddInverterModel({
    this.inverterNo = '',
    this.rs485Id = '',
    this.serialNumber = '',
    this.panelWatt = '0',
    this.panelCount = '0',
  });
}

class AddInverterProvider extends ChangeNotifier {
  String bindCollector = "241012992";
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

  String inverterNoError = "";
  String rs485IdError = "";
  String serialNoError = "";
  String panelWattError = "";
  String panelCountError = "";

  bool validation(BuildContext context) {
    if (_addInverterModel.inverterNo.isEmpty) {
      inverterNoError = context.l10n?.inverterNoIsRequired ?? "";
    } else {
      inverterNoError = "";
    }

    if (_addInverterModel.rs485Id.isEmpty) {
      rs485IdError = context.l10n?.rs485IdIsRequired ?? "";
    } else {
      rs485IdError = "";
    }

    if (_addInverterModel.serialNumber.isEmpty) {
      serialNoError = context.l10n?.serialNoIsRequired ?? "";
    } else {
      serialNoError = "";
    }

    if (_addInverterModel.panelWatt.isEmpty) {
      panelWattError = context.l10n?.panelWattIsRequired ?? "";
    } else {
      panelWattError = "";
    }

    if (_addInverterModel.panelCount.isEmpty) {
      panelCountError = context.l10n?.panelCountIsRequired ?? "";
    } else {
      panelCountError = "";
    }

    notifyListeners();
    return inverterNoError.isEmpty &&
        rs485IdError.isEmpty &&
        panelWattError.isEmpty &&
        panelCountError.isEmpty &&
        serialNoError.isEmpty;
  }

  Future<void> onConfirmTap(BuildContext context) async {
    if (validation(context)) {
      context.navigator.pop();
      context.navigator.pop();
    }
  }
}
