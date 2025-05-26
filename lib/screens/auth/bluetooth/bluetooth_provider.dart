import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qbits/common/widget/media_picker.dart';
import 'package:qbits/qbits.dart';

class BluetoothProvider extends ChangeNotifier {
  ///dropdown varibale and function

    String? selectedCompanySize;
    String? companySizeError;



    ///
  bool loader = false;
  File? bluetoothImage;



  BluetoothDevice? connectedDevice;
  bool isConnecting = false;

  Future<void> connectToDevice(String deviceId) async {
    try {
      isConnecting = true;
      notifyListeners();

      // Start scanning
      FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

      // Listen for devices
      FlutterBluePlus.scanResults.listen((results) async {
        for (ScanResult r in results) {
          if (r.device.id.id == deviceId) {
            await FlutterBluePlus.stopScan();
            await r.device.connect();
            connectedDevice = r.device;
            isConnecting = false;
            notifyListeners();
            break;
          }
        }
      });
    } catch (e) {
      isConnecting = false;
      notifyListeners();
      debugPrint("Connection error: $e");
    }
  }

  void disconnect() {
    connectedDevice?.disconnect();
    connectedDevice = null;
    notifyListeners();
  }



  MobileScannerController? mobileScannerController;

  final MobileScannerController cameraController = MobileScannerController();
  String? _scannedText;

  String? get scannedText => _scannedText;

  Future<void> scanFromImage(File imageFile) async {
    try {
      final result = await mobileScannerController?.analyzeImage(
        imageFile.path,
      );
      if (result != null && result.barcodes.isNotEmpty) {
        _scannedText = result.barcodes.first.rawValue ?? 'No data found';
      } else {
        _scannedText = 'No QR code detected';
      }
    } catch (e) {
      _scannedText = 'Error scanning image: $e';
    }
    notifyListeners();
  }

  void clear() {
    _scannedText = null;
    notifyListeners();
  }

  Future<void> scanImageFromFile(File file) async {
    try {
      final result = await mobileScannerController?.analyzeImage(file.path);
      if (result != null && result.barcodes.isNotEmpty) {
        _scannedData = result.barcodes.first.rawValue;
      } else {
        _scannedData = "No QR code found.";
      }
    } catch (e) {
      _scannedData = "Error: $e";
    }
    notifyListeners();
  }




  String? connectionStatus;



  Future<void> onGalleryTap(BuildContext context) async {
    try {
      loader = true;
      notifyListeners();
      final result = await openMediaPicker(context);

      if (result != null) {
        bluetoothImage = result;
        print("Bluetooth Image: ${bluetoothImage?.path}");

        // mobileScannerController = MobileScannerController(
        //   torchEnabled: false,
        //   facing: CameraFacing.back,
        //   detectionSpeed: DetectionSpeed.noDuplicates,
        // );
        // print('MobileScannerController initialized');
        // print(mobileScannerController?.analyzeImage(bluetoothImage!.path));
        context.navigator.pop();
        showCustomToast(
          'Successfully Connected ${mobileScannerController?.analyzeImage(bluetoothImage!.path.toString())}',
        );
      }
    } catch (exception, stack) {
      showCatchToast(exception, stack);
    }

    loader = false;
    notifyListeners();
  }

  String? _scannedData;

  String? get scannedData => _scannedData;

  void clearData() {
    _scannedData = null;
    notifyListeners();
  }
}
