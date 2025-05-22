import 'package:qbits/qbits.dart';

class BluetoothScreen extends StatelessWidget {
  const BluetoothScreen({super.key});

  static const routeName = "bluetooth_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<BluetoothProvider>(
      create: (c) => BluetoothProvider(),
      child: BluetoothScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
