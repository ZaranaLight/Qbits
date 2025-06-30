import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:qbits/qbits.dart';

// class BluetoothManuallyScreen extends StatelessWidget {
//   const BluetoothManuallyScreen({super.key});
//
//   static const routeName = "bluetooth_manually_screen";
//
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider<BluetoothManuallyProvider>(
//       create: (c) => BluetoothManuallyProvider(),
//       child: BluetoothManuallyScreen(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BluetoothManuallyProvider>(
//       builder: (context, state, child) {
//         return Scaffold(
//           bottomNavigationBar: SafeArea(
//             top: false,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 bottom: Constants.safeAreaPadding.bottom + 30.ph,
//                 left: Constants.horizontalPadding,
//                 right: Constants.horizontalPadding,
//               ),
//               child: SubmitButton(
//                 title: context.l10n?.searchDevice ?? "",
//                 onTap: state.startScan,
//               ),
//             ),
//           ),
//           appBar: CustomAppBar(title: context.l10n?.bluetoothManually ?? ""),
//           body: Padding(
//             padding: EdgeInsets.only(
//               left: Constants.horizontalPadding,
//               right: Constants.horizontalPadding,
//               bottom: 20.ph,
//               top: 20.ph,
//             ),
//             child: CustomSingleChildScroll(
//               child: Column(
//                 children: [
//                   /// Title
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         context.l10n?.nearByBluetoothTapToConnect ?? "",
//                         style: styleW600S16.copyWith(
//                           color: ColorRes.black.withValues(alpha: 0.6),
//                         ),
//                       ),
//
//                       Container(
//                         decoration: BoxDecoration(
//                           color:
//                               state.isScanning ? ColorRes.blue : ColorRes.grey,
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                         padding: EdgeInsets.all(6.pw),
//                         child: Icon(
//                           Icons.bluetooth_audio_outlined,
//                           color: ColorRes.white,
//                           size: 15.pw,
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   /// Space
//                   14.ph.spaceVertical,
//
//                   ///Divider
//                   if (state.devices.isNotEmpty)
//                     Divider(
//                       height: 1.pw,
//                       color: ColorRes.black.withValues(alpha: 0.1),
//                     ),
//
//                   /// Space
//                   14.ph.spaceVertical,
//
//                   CustomListView(
//                     itemCount: state.foundDevices.length,
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     separatorBuilder: (context, index) {
//                       return Container(
//                         height: 1,
//                         width: double.infinity,
//                         color: ColorRes.black.withValues(alpha: 0.1),
//                       );
//                     },
//                     itemBuilder: (context, index) {
//                       final result = state.foundDevices[index];
//                       final device = result.platformName;
//
//                       return InkWell(
//                         onTap: () {
//                           state.onTapSelectedBluetoothDeviceItem(
//                             context,
//                             // result,
//                           );
//                         },
//                         borderRadius: BorderRadius.circular(5.pw),
//
//                         child: Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: ColorRes.primaryColor,
//                                 borderRadius: BorderRadius.circular(5.pw),
//                               ),
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: 2.pw,
//                                 vertical: 2.pw,
//                               ),
//                               margin: EdgeInsets.symmetric(vertical: 14.pw),
//                               child: Icon(
//                                 Icons.bluetooth_outlined,
//                                 color: ColorRes.white,
//                                 size: 17.pw,
//                               ),
//                             ),
//
//                             ///Space
//                             8.pw.spaceHorizontal,
//
//                             ///Device Name
//                             Text(
//                               result.advName.isNotEmpty
//                                   ? result.advName
//                                   : (device.isNotEmpty
//                                       ? device
//                                       : "Unknown Device"),
//                               style: styleW600S16.copyWith(fontSize: 18.pw),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//
//                   /// Space
//                   14.ph.spaceVertical,
//
//                   ///Divider
//                   if (state.devices.isNotEmpty)
//                     Divider(
//                       height: 1.pw,
//                       color: ColorRes.black.withValues(alpha: 0.1),
//                     ),
//
//                   /// Space
//                   14.ph.spaceVertical,
//
//                   Text.rich(
//                     textAlign: TextAlign.center,
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "Warm Tips:  ",
//                           style: styleW600S14.copyWith(color: ColorRes.black),
//                         ),
//                         TextSpan(
//                           text:
//                               "If Bluetooth devices cannot be found, please turn off the system Bluetooth and then turn it back on",
//                           style: styleW400S14.copyWith(color: ColorRes.black),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   /// Space
//                   60.ph.spaceVertical,
//
//                   AssetsImg(imagePath: AssetRes.blueToothMobileImg),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class BluetoothManuallyScreen extends StatefulWidget {
  static const routeName = "bluetooth_manually_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<BluetoothManuallyProvider>(
      create: (c) => BluetoothManuallyProvider(),
      child: BluetoothManuallyScreen(),
    );
  }

  @override
  _BluetoothManuallyScreenState createState() =>
      _BluetoothManuallyScreenState();
}

class _BluetoothManuallyScreenState extends State<BluetoothManuallyScreen> {
  List<String> deviceNames = [];
  List<BluetoothDevice> devices = [];
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    _scanForDevices();
  }

  void requestBluetoothPermission() async {
    PermissionStatus bluetoothStatus = await Permission.bluetoothScan.request();
    PermissionStatus locationStatus = await Permission.location.request();

    if (bluetoothStatus.isGranted && locationStatus.isGranted) {
      scanDevices();
    } else {}
  }

  void scanDevices() {
    try {
      FlutterBluePlus.startScan();
      FlutterBluePlus.scanResults.listen((results) {
        setState(() {
          // _scannedDevices = results;
          print("Bluetooth scan results: ${results.toString()}");
        });
      });
    } catch (e) {
      print("Error during Bluetooth scanning: $e");
    }
  }

  void _scanForDevices() async {
    setState(() {
      isScanning = true;
      deviceNames.clear();
      devices.clear();
    });

    // Listen to scan results
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        String deviceName = result.device.platformName;

        // Only add devices with names
        if (deviceName.isNotEmpty && !deviceNames.contains(deviceName)) {
          setState(() {
            deviceNames.add(deviceName);
            devices.add(result.device);
          });
        }
      }
    });

    // Start scanning
    await FlutterBluePlus.startScan(timeout: Duration(seconds: 10));

    setState(() {
      isScanning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Bluetooth Device Names'),
      //   actions: [
      //     IconButton(icon: Icon(Icons.refresh), onPressed: _scanForDevices),
      //   ],
      // ),
      appBar: CustomAppBar(title: context.l10n?.bluetoothManually ?? ""),

      body: Column(
        children: [
          if (isScanning) LinearProgressIndicator(),

          // Padding(
          //   padding: EdgeInsets.all(16),
          //   child: Text(
          //     'Found ${deviceNames.length} named devices',
          //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              bottom: 16.ph,
              top: 20.ph,
            ),

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
                    color: isScanning ? ColorRes.blue : ColorRes.grey,
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
          if (deviceNames.isNotEmpty)
            Divider(height: 1.pw, color: ColorRes.black.withValues(alpha: 0.1)),

          Expanded(
            child: CustomListView(
              // separatorBuilder: ,
              itemCount: deviceNames.length,

              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
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
                  title: Text(
                    deviceNames[index],
                    style: styleW600S18.copyWith(color: ColorRes.black),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connected to ${device.platformName}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to connect: $e')));
    }
  }
}
