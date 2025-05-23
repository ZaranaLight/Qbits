import 'package:qbits/common/widget/common_scanner_screen.dart';
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
                onTap: () {},
                borderRadius: BorderRadius.circular(5.pw),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.pw,
                    vertical: 10.pw,
                  ),
                  child: Text(
                    'Gallery',
                    style: styleW500S16.copyWith(color: ColorRes.primaryColor),
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
                    'Manually',
                    style: styleW500S16.copyWith(color: ColorRes.primaryColor),
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
                    style: styleW500S16.copyWith(color: ColorRes.primaryColor),
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
      body: QRScannerScreen(),
    );
  }
}
