import 'package:mobile_scanner/mobile_scanner.dart';
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
                        context.l10n?.gallery ?? "",
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
                        context.l10n?.manually ?? "",
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
                        context.l10n?.cancel ?? "",
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
                onPressed: state.toggleTorch,
                color: ColorRes.white,
                icon: SvgAsset(
                  imagePath:
                      state.isFlashOn ? AssetRes.bulbOnIcon : AssetRes.bulbIcon,
                ),
              ),
            ],
          ),
          body: Center(
            child: Stack(
              children: [
                MobileScanner(
                  controller: state.mobileScannerController,
                  onDetect: (barcodeCapture) {
                    final code = barcodeCapture.barcodes.first.rawValue;
                    if (code != null && code.isNotEmpty) {
                      context.read<BluetoothProvider>().connectToDevice(code);
                      Navigator.pop(context, code); // sen
                    }
                  },
                  overlayBuilder: (
                    BuildContext context,
                    BoxConstraints constraints,
                  ) {
                    return Center(
                      child: AssetsImg(
                        imagePath: AssetRes.qrScanAnimation,
                        height: 280.pw,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class BluetoothScreen extends StatefulWidget {
//   const BluetoothScreen({super.key});
//
//   static const routeName = "bluetooth_screen";
//
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider<BluetoothProvider>(
//       create: (c) => BluetoothProvider(),
//       child: BluetoothScreen(),
//     );
//   }
//
//   @override
//   State<BluetoothScreen> createState() => _BluetoothScreenState();
// }
//
// class _BluetoothScreenState extends State<BluetoothScreen> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<BluetoothProvider>(
//       builder: (context, state, child) {
//         return Scaffold(
//           backgroundColor: ColorRes.white,
//           bottomNavigationBar: SafeArea(
//             top: false,
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: Constants.horizontalPadding + 10.pw,
//                 vertical: 12.ph,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       state.pickImageAndScan(context);
//                     },
//                     borderRadius: BorderRadius.circular(5.pw),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 15.pw,
//                         vertical: 10.pw,
//                       ),
//                       child: Text(
//                         'Gallery',
//                         style: styleW500S16.copyWith(
//                           color: ColorRes.primaryColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       context.navigator.pushNamed(
//                         BluetoothManuallyScreen.routeName,
//                       );
//                     },
//                     borderRadius: BorderRadius.circular(5.pw),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 15.pw,
//                         vertical: 10.pw,
//                       ),
//                       child: Text(
//                         'Manually',
//                         style: styleW500S16.copyWith(
//                           color: ColorRes.primaryColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       context.navigator.pop();
//                     },
//                     borderRadius: BorderRadius.circular(5.pw),
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 15.pw,
//                         vertical: 10.pw,
//                       ),
//                       child: Text(
//                         'Cancel',
//                         style: styleW500S16.copyWith(
//                           color: ColorRes.primaryColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           appBar: CustomAppBar(
//             title: context.l10n?.bluetooth ?? "",
//             actions: [
//               IconButton(
//                 onPressed: state.toggleTorch,
//                 icon: SvgAsset(
//                   imagePath: state.isFlashOn ? AssetRes.eyeIcon : AssetRes.bulbIcon,
//                 ),
//               ),
//               // IconButton(
//               //   onPressed: _toggleTorch,
//               //   icon: SvgAsset(
//               //     imagePath:
//               //         state.isFlashOn ? AssetRes.eyeIcon : AssetRes.bulbIcon,
//               //   ),
//               // ),
//             ],
//           ),
//           body: Center(
//             child: Stack(
//               children: [
//                 MobileScanner(
//                   controller: _controller,
//                   onDetect: (barcodeCapture) {
//                     final code = barcodeCapture.barcodes.first.rawValue;
//                     if (code != null && code.isNotEmpty) {
//                       context.read<BluetoothProvider>().connectToDevice(code);
//                       Navigator.pop(context, code); // sen
//                     }
//                   },
//                   overlayBuilder: (
//                     BuildContext context,
//                     BoxConstraints constraints,
//                   ) {
//                     return Center(
//                       child: AssetsImg(
//                         imagePath: AssetRes.qrScanAnimation,
//                         height: 280.pw,
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
