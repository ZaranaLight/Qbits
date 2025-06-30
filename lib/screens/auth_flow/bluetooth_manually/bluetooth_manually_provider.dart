import 'dart:async';

 import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:qbits/qbits.dart';

class BluetoothManuallyProvider extends ChangeNotifier {
  bool loader = false;

  final List<ScanResult> _devices = [];

  bool _isScanning = false;

  List<ScanResult> get devices => _devices;

  bool get isScanning => _isScanning;

  bool _isDisposed = false;

  List<BluetoothDevice> foundDevices = [];
  StreamSubscription<List<ScanResult>>? _scanSubscription;

  // Guarded notify
  void safeNotify() {
    if (!_isDisposed) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    stopScan(); // Stop scan when provider is disposed
    super.dispose();
  }

  /// Start Bluetooth scanning
  Future<void> startScan() async {
    try {
      _isScanning = true;
      foundDevices.clear();
      safeNotify();

      await FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));

      _scanSubscription = FlutterBluePlus.scanResults.listen((results) {
        foundDevices = results.map((r) => r.device).toList();
        safeNotify();
      });

      // Optional: auto-stop after 10 sec
      // Future.delayed(Duration(seconds: 15), () {
      //   print("stopScan");
      //   stopScan();
      // });
    } catch (e) {
      print("Scan error: $e");
      stopScan(); // Ensure we don't leave scanning on
    }
  }

  /// Stop Bluetooth scanning
  void stopScan() {
    if (isScanning) {
      FlutterBluePlus.stopScan();
      _scanSubscription?.cancel();
      _isScanning = false;
      safeNotify();
    }
  }



  void onTapSelectedBluetoothDeviceItem(
    BuildContext context,
    // ScanResult device,
  ) {
    context.navigator.pushNamed(
      IdAuthenticationScreen.routeName,
      // arguments: device,
    );
  }

  close() {
    FlutterBluePlus.stopScan();
    _devices.clear();
    _isScanning = false;
    notifyListeners();
  }
}

