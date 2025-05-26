import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qbits/qbits.dart';
import 'package:qbits/screens/auth/id_authentication/id_authentication_screen.dart';

class BluetoothManuallyProvider extends ChangeNotifier {
  bool loader = false;

  final List<ScanResult> _devices = [];

  bool _isScanning = false;

  List<ScanResult> get devices => _devices;

  bool get isScanning => _isScanning;

  Future<void> requestPermissions() async {
    await [
      Permission.location,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();
  }

  Future<void> startScan() async {
    _devices.clear();
    notifyListeners();

    _isScanning = true;
    notifyListeners();

    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((results) {
      for (var result in results) {
        if (!_devices.any((r) => r.device.remoteId == result.device.remoteId)) {
          _devices.add(result);
          notifyListeners();
        }
      }
    });

    FlutterBluePlus.isScanning.listen((scanning) {
      _isScanning = scanning;
      notifyListeners();
    });
  }

  void stopScan() {
    FlutterBluePlus.stopScan();
  }

  void onTapSelectedBluetoothDeviceItem(
    BuildContext context,
    ScanResult device,
  ) {
    context.navigator.pushNamed(
      IdAuthenticationScreen.routeName,
      arguments: device,
    );
  }
}
