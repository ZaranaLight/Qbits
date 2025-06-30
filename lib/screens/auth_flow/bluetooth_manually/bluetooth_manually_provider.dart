import 'package:qbits/qbits.dart';

class BluetoothManuallyProvider extends ChangeNotifier {
  final List<BluetoothDevice> _devices = [];

  bool _isScanning = false;

  List<BluetoothDevice> get devices => _devices;

  bool get isScanning => _isScanning;

  Future<void> startScan() async {
    _isScanning = true;
    _devices.clear();
    notifyListeners();

    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((results) {
      for (var result in results) {
        if (result.device.platformName.isNotEmpty &&
            !_devices.contains(result.device)) {
          _devices.add(result.device);
          notifyListeners();
        }
      }
    });

    FlutterBluePlus.isScanning.listen((scanning) {
      _isScanning = scanning;
      notifyListeners();
    });
  }

  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  void onDeviceTap(BuildContext context, String deviceName) {
    context.navigator.pushNamed(
      IdAuthenticationScreen.routeName,
      arguments: deviceName,
    );
  }
}
