import 'package:qbits/qbits.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final MobileScannerController _controller = MobileScannerController();
  bool _torchOn = false;
  bool _scanned = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final qrString = await QrCodeToolsPlugin.decodeFrom(image.path);
      navigatorKey.currentState?.context.navigator.pop(qrString);
    }
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleTorch() {
    _controller.toggleTorch();
    refresh();
    _torchOn = !_torchOn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.l10n?.qrCodeScanning ?? "",
        actions: [
          ///Torch Button
          InkWell(
            onTap: _toggleTorch,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Constants.horizontalPadding,
              ),
              child: SvgAsset(
                imagePath: _torchOn ? AssetRes.bulbOnIcon : AssetRes.bulbIcon,
              ),
            ),
          ),
        ],
      ),

      body: MobileScanner(
        controller: _controller,
        onDetect: (barcodeCapture) {
          if (_scanned) return; // avoid multiple triggers
          final code = barcodeCapture.barcodes.first.rawValue;
          if (code != null) {
            _scanned = true;
            context.navigator.pop(code); // Return scanned QR code
          }
        },
        overlayBuilder: (BuildContext context, BoxConstraints constraints) {
          return Center(
            child: AssetsImg(
              imagePath: AssetRes.qrScanAnimation,
              height: 280.pw,
            ),
          );
        },
      ),

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
                onTap: _pickImageFromGallery,
                borderRadius: BorderRadius.circular(5.pw),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.pw,
                    vertical: 10.ph,
                  ),
                  child: Text(
                    context.l10n?.gallery ?? "",
                    style: styleW500S16.copyWith(color: ColorRes.primaryColor),
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
                    vertical: 10.ph,
                  ),
                  child: Text(
                    context.l10n?.cancel ?? "",
                    style: styleW500S16.copyWith(color: ColorRes.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
