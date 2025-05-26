import 'package:qbits/qbits.dart';

class BluetoothManuallyProvider extends ChangeNotifier {
  bool loader = false;
  final TextEditingController bluetoothNameController = TextEditingController();
  String bluetoothNameError = "";
}
