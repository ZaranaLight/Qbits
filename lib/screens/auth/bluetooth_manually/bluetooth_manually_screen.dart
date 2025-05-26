import 'package:qbits/qbits.dart';
import 'package:qbits/screens/auth/bluetooth_manually/bluetooth_manually_provider.dart';

class BluetoothManuallyScreen extends StatelessWidget {
  const BluetoothManuallyScreen({super.key});

  static const routeName = "bluetooth_manually_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<BluetoothManuallyProvider>(
      create: (c) => BluetoothManuallyProvider(),
      child: BluetoothManuallyScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.l10n?.bluetoothManually ?? ""),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.pw,
          right: 16.pw,
          bottom:
              Constants.safeAreaPadding.bottom + Constants.horizontalPadding,
          top: 20.pw,
        ),
        child: Column(
          children: [
            /// Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n?.nearByBluetoothTapToConnect ?? "",
                  style: styleW600S16.copyWith(
                    color: ColorRes.black.withValues(alpha: 0.6),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(6.pw),
                  child: Icon(
                    Icons.bluetooth_audio_outlined,
                    color: ColorRes.white,
                    size: 15.pw,
                  ),
                ),
              ],
            ),

            /// Space
            14.ph.spaceVertical,
          ],
        ),
      ),
    );
  }
}
