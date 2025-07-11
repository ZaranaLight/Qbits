import 'package:qbits/qbits.dart';

class EditCollectorScreen extends StatelessWidget {
  const EditCollectorScreen({super.key});

  static const routeName = "edit_collector_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditCollectorProvider(),
      child: const EditCollectorScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditCollectorProvider>(
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
          appBar: CustomAppBar(title: "Edit Collector"),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              top: 20.pw,
              bottom: Constants.safeAreaPadding.bottom + 20.pw,
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
