import 'package:qbits/common/widget/app_qr_scanner_screen.dart';
import 'package:qbits/qbits.dart';

class QaProvider extends ChangeNotifier {
  bool loader = false;
  TextEditingController searchController = TextEditingController();

  QaProvider() {
    init();
  }

  void init() {}

  Future<void> scanQRCode(BuildContext context, String scannedQR) async {
    final scannedResult = await context.navigator.push<String>(
      MaterialPageRoute(builder: (_) => QRScannerScreen()),
    );

    if (scannedResult != null && scannedResult.isNotEmpty) {
      if (scannedQR == 'model') {
        searchController.text = scannedResult;
      }

      notifyListeners(); // notify UI about the change
    }
  }
}
