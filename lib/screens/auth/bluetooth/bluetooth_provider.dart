import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qbits/qbits.dart';
import 'package:qbits/screens/auth/id_authentication/id_authentication_screen.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:torch_light/torch_light.dart';

class BluetoothProvider extends ChangeNotifier {
  bool loader = false;

  BluetoothDevice? connectedDevice;

  bool isConnecting = false;

  bool _isFlashOn = false;

  bool get isFlashOn => _isFlashOn;

  String? _qrCodeText;

  String? get qrCodeText => _qrCodeText;

  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  final MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
  );

  MobileScannerController get mobileScannerController => controller;

  ///BluetoothProvider constructor
  Future<void> toggleFlash() async {
    try {
      final isAvailable = await TorchLight.isTorchAvailable();
      if (!isAvailable) {
        return;
      }
      if (_isFlashOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      _isFlashOn = !_isFlashOn;
      notifyListeners();
    } catch (e) {
      print("Torch error: $e");
    }
  }

  /// Request camera permission
  Future<void> connectToDevice(String deviceId) async {
    try {
      isConnecting = true;
      notifyListeners();

      // Start scanning
      FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

      // Listen for devices
      FlutterBluePlus.scanResults.listen((results) async {
        for (ScanResult r in results) {
          if (r.device.remoteId.str == deviceId) {
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

  /// Scanning QR Code from Gallery Image
  Future<void> pickImageAndScan(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      _selectedImage = File(picked.path);
      notifyListeners();
      try {
        final qrText = await QrCodeToolsPlugin.decodeFrom(picked.path);
        _qrCodeText = qrText;
        if (context.mounted) {
          context.navigator.pushNamed(IdAuthenticationScreen.routeName);
        }
      } catch (e) {
        _qrCodeText = "Failed to decode QR";
      }
      notifyListeners();
    }
  }

  void clear() {
    _selectedImage = null;
    _qrCodeText = null;
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose camera controller here
    super.dispose();
  }

  void disconnect() {
    connectedDevice?.disconnect();
    connectedDevice = null;
    notifyListeners();
  }
}
