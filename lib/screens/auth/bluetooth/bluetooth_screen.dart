import 'package:qbits/common/widget/app_drop_down.dart';
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
        final bluetoothProvider = context.watch<BluetoothProvider>();
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
                      // state.pickImageAndScan();
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
                    onTap: () {},
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
                onPressed: () {},
                icon: SvgAsset(imagePath: AssetRes.bulbIcon),
              ),
            ],
          ),

          body: Center(
            child:
                bluetoothProvider.isConnecting
                    ? const CircularProgressIndicator()
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Past Jobs
                        AppDropDown<String>(
                          itemAsString: (e) => e,
                          hintText: context.l10n?.email,
                          onChanged: (val) => {},
                          selectedValue: state.selectedCompanySize,
                          header: context.l10n?.email,
                          error: state.companySizeError,
                          optionsList: ["11-20 employees", "21-40 employees"],
                        ),

                        ///Space
                        20.pw.spaceVertical,
                        Text(
                          bluetoothProvider.connectedDevice != null
                              ? 'Connected to: ${bluetoothProvider.connectedDevice!.name}'
                              : 'No device connected',
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: () {
                            context.navigator.pushNamed(
                              QRScannerScreen.routeName,
                            );
                          },
                          icon: const Icon(Icons.qr_code_scanner),
                          label: const Text("Scan QR Code"),
                        ),
                        if (bluetoothProvider.connectedDevice != null)
                          ElevatedButton.icon(
                            onPressed: () => bluetoothProvider.disconnect(),
                            icon: const Icon(Icons.bluetooth_disabled),
                            label: const Text("Disconnect"),
                          ),
                      ],
                    ),
          ),
        );
      },
    );
  }
}
