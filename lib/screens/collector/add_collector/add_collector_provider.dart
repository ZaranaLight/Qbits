import 'package:qbits/common/widget/app_qr_scanner_screen.dart';
import 'package:qbits/qbits.dart';

class AddCollectorProvider extends ChangeNotifier {
  bool loader = false;
  String serialNumberError = "";
  final TextEditingController serialNumberController = TextEditingController();

  Future<void> scanQRCode(BuildContext context, String scannedQR) async {
    final scannedResult = await context.navigator.push<String>(
      MaterialPageRoute(builder: (_) => QRScannerScreen()),
    );

    if (scannedResult != null && scannedResult.isNotEmpty) {
      if (scannedQR == 'model') {
        serialNumberController.text = scannedResult;
      }

      notifyListeners(); // notify UI about the change
    }
  }

  Future<void> onConfirmTap(BuildContext context) async {
    if (validation(context)) {
      if (context.mounted) {
        context.navigator.pop();
        showCustomToast('Added Success');
      }
    }
  }

  bool validation(BuildContext context) {
    if (serialNumberController.text.trim().isEmpty) {
      serialNumberError = context.l10n?.serialNumberIsRequired ?? "";
    } else {
      serialNumberError = "";
    }

    notifyListeners();
    return serialNumberError.isEmpty;
  }
}
