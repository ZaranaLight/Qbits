import 'package:qbits/qbits.dart';
import 'package:qbits/screens/auth/bluetooth_manually/bluetooth_manually_provider.dart';
import 'package:qbits/screens/auth/id_authentication/id_authentication_screen.dart';

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
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.ph, left: 16.pw, right: 16.pw),
          child: SubmitButton(
            title: context.l10n?.searchDevice ?? "",
            onTap: () {
              context.navigator.pushNamed(IdAuthenticationScreen.routeName);
            },
          ),
        ),
      ),
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

            ///Divider
            Divider(height: 1.pw, color: ColorRes.black.withValues(alpha: 0.1)),

            /// Space
            14.ph.spaceVertical,

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor,
                    borderRadius: BorderRadius.circular(5.pw),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.pw,
                    vertical: 2.pw,
                  ),
                  child: Icon(
                    Icons.bluetooth_outlined,
                    color: ColorRes.white,
                    size: 17.pw,
                  ),
                ),

                ///Space
                8.pw.spaceHorizontal,

                /// Device Name
                Text(
                  'FireBoltt 146',
                  style: styleW600S16.copyWith(fontSize: 18.pw),
                ),
              ],
            ),

            /// Space
            14.ph.spaceVertical,

            ///Divider
            Divider(height: 1.pw, color: ColorRes.black.withValues(alpha: 0.1)),

            /// Space
            14.ph.spaceVertical,

            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "Warm Tips:  ",
                    style: styleW600S14.copyWith(color: ColorRes.black),
                  ),
                  TextSpan(
                    text:
                        "Unable to acquire a buffer item, very likely client tried to acquire more than maxImages buffers",
                    style: styleW400S14.copyWith(color: ColorRes.black),
                  ),
                ],
              ),
            ),

            /// Space
            60.pw.spaceVertical,

            AssetsImg(imagePath: AssetRes.blueToothMobileImg),
          ],
        ),
      ),
    );
  }
}
