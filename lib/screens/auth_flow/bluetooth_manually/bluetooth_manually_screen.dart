import 'package:qbits/qbits.dart';

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
    return Consumer<BluetoothManuallyProvider>(
      builder: (context, state, child) {
        return Scaffold(
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: Constants.safeAreaPadding.bottom + 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.searchDevice ?? "",
                onTap: state.startScan,
              ),
            ),
          ),
          appBar: CustomAppBar(title: context.l10n?.bluetoothManually ?? ""),
          body: Padding(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              bottom: 20.ph,
              top: 20.ph,
            ),
            child: CustomSingleChildScroll(
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
                          color:
                              state.isScanning ? ColorRes.blue : ColorRes.grey,
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
                  if (state.devices.isNotEmpty)
                    Divider(
                      height: 1.pw,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    ),

                  /// Space
                  14.ph.spaceVertical,

                  CustomListView(
                    itemCount: state.foundDevices.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        width: double.infinity,
                        color: ColorRes.black.withValues(alpha: 0.1),
                      );
                    },
                    itemBuilder: (context, index) {
                      final result = state.foundDevices[index];
                      final device = result.platformName;

                      return InkWell(
                        onTap: () {
                          state.onTapSelectedBluetoothDeviceItem(
                            context,
                            // result,
                          );
                        },
                        borderRadius: BorderRadius.circular(5.pw),

                        child: Row(
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
                              margin: EdgeInsets.symmetric(vertical: 14.pw),
                              child: Icon(
                                Icons.bluetooth_outlined,
                                color: ColorRes.white,
                                size: 17.pw,
                              ),
                            ),

                            ///Space
                            8.pw.spaceHorizontal,

                            ///Device Name
                            Text(
                              result.advName.isNotEmpty
                                  ? result.advName
                                  : (device.isNotEmpty
                                      ? device
                                      : "Unknown Device"),
                              style: styleW600S16.copyWith(fontSize: 18.pw),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  /// Space
                  14.ph.spaceVertical,

                  ///Divider
                  if (state.devices.isNotEmpty)
                    Divider(
                      height: 1.pw,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    ),

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
                              "If Bluetooth devices cannot be found, please turn off the system Bluetooth and then turn it back on",
                          style: styleW400S14.copyWith(color: ColorRes.black),
                        ),
                      ],
                    ),
                  ),

                  /// Space
                  60.ph.spaceVertical,

                  AssetsImg(imagePath: AssetRes.blueToothMobileImg),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
