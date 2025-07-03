import 'package:qbits/qbits.dart';
import 'package:qbits/screens/collector/add_collector/add_collector_provider.dart';

class AddCollectorScreen extends StatelessWidget {
  const AddCollectorScreen({super.key});

  static const routeName = "add_collector_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddCollectorProvider(),
      child: const AddCollectorScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddCollectorProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.confirm ?? "",
                onTap: () => {provider.onConfirmTap(context)},
              ),
            ),
          ),
          appBar: CustomAppBar(title: context.l10n?.addCollector),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              top: 20.ph,
              bottom: Constants.safeAreaPadding.bottom + 20.ph,
            ),
            child: Column(
              children: [
                /// Original Password
                AppTextField(
                  controller: provider.serialNumberController,
                  header: context.l10n?.serialNumber ?? "",
                  hintText: context.l10n?.enterSerialNumber ?? "",
                  error: provider.serialNumberError,
                  suffixIcon: InkWell(
                    onTap: () => provider.scanQRCode(context, 'model'),
                    child: SvgAsset(
                      imagePath: AssetRes.scannerIcon,
                      color: ColorRes.black.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
