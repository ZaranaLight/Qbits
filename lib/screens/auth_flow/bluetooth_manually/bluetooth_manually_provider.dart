
import 'package:qbits/qbits.dart';

class BluetoothManuallyProvider extends ChangeNotifier {
  bool loader = false;

  final List<ScanResult> _devices = [];

  bool _isScanning = false;

  List<ScanResult> get devices => _devices;

  bool get isScanning => _isScanning;

  Future<void> startScan() async {
    _devices.clear();
    _isScanning = true;
    notifyListeners();

    // Request permissions
    // await requestPermissions();
    // if (Platform.isAndroid &&
    //     Platform.operatingSystemVersion.contains("Android 11")) {
    //   if (!await Geolocator.isLocationServiceEnabled()) {
    //     showErrorMsg(
    //       navigatorKey
    //               .currentState
    //               ?.context
    //               .l10n!
    //               .pleaseEnableLocationFromDeviceSetting ??
    //           "",
    //     );
    //
    //     _isScanning = false;
    //     notifyListeners();
    //     return;
    //   }
    // }
    // Check if Bluetooth is ON
    final state = await FlutterBluePlus.adapterState.first;
    if (state != BluetoothAdapterState.on) {
      _isScanning = false;
      notifyListeners();
      showCustomToast(
        navigatorKey.currentState?.context.l10n?.bluetoothIsOff ?? "",
      );
      return;
    }

    // Start scanning
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((results) {
      for (var result in results) {
        if (!_devices.any(
          (r) => r.device.platformName == result.device.platformName,
        )) {
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

  void onTapSelectedBluetoothDeviceItem(
    BuildContext context,
    ScanResult device,
  ) {
    context.navigator.pushNamed(
      IdAuthenticationScreen.routeName,
      arguments: device,
    );
  }

  close() {
    FlutterBluePlus.stopScan();
    _devices.clear();
    _isScanning = false;
    notifyListeners();
  }
}
