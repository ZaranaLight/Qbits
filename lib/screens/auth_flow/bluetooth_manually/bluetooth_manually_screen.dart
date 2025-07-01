import 'package:qbits/qbits.dart';

class BluetoothManuallyScreen extends StatefulWidget {
  static const routeName = "bluetooth_manually_screen";

  const BluetoothManuallyScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<BluetoothManuallyProvider>(
      create: (c) => BluetoothManuallyProvider(),
      child: BluetoothManuallyScreen(),
    );
  }

  @override
  State<BluetoothManuallyScreen> createState() =>
      _BluetoothManuallyScreenState();
}

class _BluetoothManuallyScreenState extends State<BluetoothManuallyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      context.read<BluetoothManuallyProvider>().startScan();
    });
  }

  @override
  dispose() {
    super.dispose();
    context.read<BluetoothManuallyProvider>().stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BluetoothManuallyProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: CustomAppBar(title: context.l10n?.bluetoothManually ?? ""),
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
                onTap: provider.startScan,
              ),
            ),
          ),
          body: StackedLoader(
            loading: provider.isScanning,
            child: CustomSingleChildScroll(
              padding: EdgeInsets.symmetric(
                horizontal: Constants.horizontalPadding,
              ),
              child: Column(
                children: [
                  /// Space
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.ph, top: 20.ph),
                    child: Row(
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
                                provider.isScanning
                                    ? ColorRes.blue
                                    : ColorRes.grey,
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
                  ),

                  ///Divider
                  if (provider.devices.isNotEmpty)
                    Divider(
                      height: 1.pw,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    ),

                  /// Device List
                  CustomListView(
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        width: double.infinity,
                        color: ColorRes.black.withValues(alpha: 0.1),
                      );
                    },
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: provider.devices.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          provider.onDeviceTap(
                            context,
                            provider.devices[index].platformName,
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
                              provider.devices[index].advName,
                              style: styleW600S16.copyWith(fontSize: 18.pw),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  ///Divider
                  if (provider.devices.isNotEmpty)
                    Divider(
                      height: 1.pw,
                      color: ColorRes.black.withValues(alpha: 0.1),
                    ),

                  /// Space
                  14.ph.spaceVertical,

                  /// Warm Tips
                  Text.rich(
                    textAlign: TextAlign.justify,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${context.l10n?.warmTips ?? ""}:  ",
                          style: styleW600S14.copyWith(color: ColorRes.black),
                        ),
                        TextSpan(
                          text:
                              context.l10n?.ifBluetoothDeviceConnectBeFound ??
                              "",
                          style: styleW400S14.copyWith(color: ColorRes.black),
                        ),
                      ],
                    ),
                  ),

                  /// Space
                  10.ph.spaceVertical,

                  AssetsImg(imagePath: AssetRes.blueToothMobileImg),

                  /// Space
                  14.ph.spaceVertical,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

///
// class BluetoothManuallyScreen extends StatefulWidget {
//   static const routeName = "bluetooth_manually_screen";
//
//   const BluetoothManuallyScreen({super.key});
//
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider<BluetoothManuallyProvider>(
//       create: (c) => BluetoothManuallyProvider(),
//       child: BluetoothManuallyScreen(),
//     );
//   }
//
//   @override
//   _BluetoothManuallyScreenState createState() =>
//       _BluetoothManuallyScreenState();
// }
//
// class _BluetoothManuallyScreenState extends State<BluetoothManuallyScreen> {
//   List<String> deviceNames = [];
//   List<BluetoothDevice> devices = [];
//   bool isScanning = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _scanForDevices();
//   }
//
//   void requestBluetoothPermission() async {
//     PermissionStatus bluetoothStatus = await Permission.bluetoothScan.request();
//     PermissionStatus locationStatus = await Permission.location.request();
//
//     if (bluetoothStatus.isGranted && locationStatus.isGranted) {
//       scanDevices();
//     } else {}
//   }
//
//   void scanDevices() {
//     try {
//       FlutterBluePlus.startScan();
//       FlutterBluePlus.scanResults.listen((results) {
//         setState(() {
//           // _scannedDevices = results;
//           print("Bluetooth scan results: ${results.toString()}");
//         });
//       });
//     } catch (e) {
//       print("Error during Bluetooth scanning: $e");
//     }
//   }
//
//   void _scanForDevices() async {
//     setState(() {
//       isScanning = true;
//       deviceNames.clear();
//       devices.clear();
//     });
//
//     // Listen to scan results
//     FlutterBluePlus.scanResults.listen((results) {
//       for (ScanResult result in results) {
//         String deviceName = result.device.platformName;
//
//         // Only add devices with names
//         if (deviceName.isNotEmpty && !deviceNames.contains(deviceName)) {
//           setState(() {
//             deviceNames.add(deviceName);
//             devices.add(result.device);
//           });
//         }
//       }
//     });
//
//     // Start scanning
//     await FlutterBluePlus.startScan(timeout: Duration(seconds: 10));
//
//     setState(() {
//       isScanning = false;
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: context.l10n?.bluetoothManually ?? ""),
//       bottomNavigationBar: SafeArea(
//         top: false,
//         child: Padding(
//           padding: EdgeInsets.only(
//             bottom: Constants.safeAreaPadding.bottom + 30.ph,
//             left: Constants.horizontalPadding,
//             right: Constants.horizontalPadding,
//           ),
//           child: SubmitButton(
//             title: context.l10n?.searchDevice ?? "",
//             onTap: () {
//               _scanForDevices();
//             },
//           ),
//         ),
//       ),
//       body: StackedLoader(
//         loading: isScanning,
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: Constants.horizontalPadding,
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(bottom: 16.ph, top: 20.ph),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       context.l10n?.nearByBluetoothTapToConnect ?? "",
//                       style: styleW600S16.copyWith(
//                         color: ColorRes.black.withValues(alpha: 0.6),
//                       ),
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: isScanning ? ColorRes.blue : ColorRes.grey,
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       padding: EdgeInsets.all(6.pw),
//                       child: Icon(
//                         Icons.bluetooth_audio_outlined,
//                         color: ColorRes.white,
//                         size: 15.pw,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               ///Divider
//               if (deviceNames.isNotEmpty)
//                 Divider(
//                   height: 1.pw,
//                   color: ColorRes.black.withValues(alpha: 0.1),
//                 ),
//
//               CustomListView(
//                 separatorBuilder: (context, index) {
//                   return Container(
//                     height: 1,
//                     width: double.infinity,
//                     color: ColorRes.black.withValues(alpha: 0.1),
//                   );
//                 },
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: deviceNames.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {
//                       // state.onTapSelectedBluetoothDeviceItem(
//                       //   context,
//                       //   // result,
//                       // );
//                     },
//                     borderRadius: BorderRadius.circular(5.pw),
//                     child: Row(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             color: ColorRes.primaryColor,
//                             borderRadius: BorderRadius.circular(5.pw),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 2.pw,
//                             vertical: 2.pw,
//                           ),
//                           margin: EdgeInsets.symmetric(vertical: 14.pw),
//                           child: Icon(
//                             Icons.bluetooth_outlined,
//                             color: ColorRes.white,
//                             size: 17.pw,
//                           ),
//                         ),
//
//                         ///Space
//                         8.pw.spaceHorizontal,
//
//                         ///Device Name
//                         Text(
//                           deviceNames[index],
//                           style: styleW600S16.copyWith(fontSize: 18.pw),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//
//               ///Divider
//               if (deviceNames.isNotEmpty)
//                 Divider(
//                   height: 1.pw,
//                   color: ColorRes.black.withValues(alpha: 0.1),
//                 ),
//
//               /// Space
//               14.ph.spaceVertical,
//
//               /// Warm Tips
//               Text.rich(
//                 textAlign: TextAlign.justify,
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "${context.l10n?.warmTips ?? ""}:  ",
//                       style: styleW600S14.copyWith(color: ColorRes.black),
//                     ),
//                     TextSpan(
//                       text: context.l10n?.ifBluetoothDeviceConnectBeFound ?? "",
//                       style: styleW400S14.copyWith(color: ColorRes.black),
//                     ),
//                   ],
//                 ),
//               ),
//
//               /// Space
//               10.ph.spaceVertical,
//
//               AssetsImg(imagePath: AssetRes.blueToothMobileImg),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
