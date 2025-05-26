import 'package:qbits/common/widget/common_scanner_screen.dart';
import 'package:qbits/qbits.dart';
import 'package:qbits/screens/auth/bluetooth_manually/bluetooth_manually_screen.dart';

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
    return Consumer<BluetoothProvider>(
      builder: (context, state, child) {
        final controller =
            context.read<BluetoothProvider>().mobileScannerController;
        return Scaffold(
          backgroundColor: ColorRes.white,
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Constants.horizontalPadding + 10.pw,
                vertical: 12.ph,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      state.pickImageAndScan(context);
                    },
                    borderRadius: BorderRadius.circular(5.pw),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.pw,
                        vertical: 10.pw,
                      ),
                      child: Text(
                        'Gallery',
                        style: styleW500S16.copyWith(
                          color: ColorRes.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.navigator.pushNamed(
                        BluetoothManuallyScreen.routeName,
                      );
                    },
                    borderRadius: BorderRadius.circular(5.pw),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.pw,
                        vertical: 10.pw,
                      ),
                      child: Text(
                        'Manually',
                        style: styleW500S16.copyWith(
                          color: ColorRes.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.navigator.pop();
                    },
                    borderRadius: BorderRadius.circular(5.pw),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.pw,
                        vertical: 10.pw,
                      ),
                      child: Text(
                        'Cancel',
                        style: styleW500S16.copyWith(
                          color: ColorRes.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: CustomAppBar(
            title: context.l10n?.bluetooth ?? "",
            actions: [
              IconButton(
                onPressed: () {
                  controller.toggleTorch();
                },
                icon: SvgAsset(
                  imagePath:
                      state.isFlashOn ? AssetRes.eyeIcon : AssetRes.bulbIcon,
                ),
              ),
            ],
          ),
          body: Center(
            child:
                state.isConnecting
                    ? const CircularProgressIndicator()
                    : CustomQRScanner(
                      onCodeDetected: (code) {
                        context.read<BluetoothProvider>().connectToDevice(code);
                        Navigator.pop(context, code); // send result back
                      },
                    ),
          ),
        );
      },
    );
  }
}
