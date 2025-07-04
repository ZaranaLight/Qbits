import 'package:qbits/common/widget/common_widgets.dart';
import 'package:qbits/qbits.dart';
import 'package:qbits/screens/collector/add_inverter/add_inverter_provider.dart';

class AddInverterScreen extends StatelessWidget {
  const AddInverterScreen({super.key});

  static const routeName = "add_inverter";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AddInverterProvider>(
      create: (c) => AddInverterProvider(),
      child: AddInverterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<AddInverterProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: Constants.safeAreaPadding.bottom + 30.ph,
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
            ),
            child: SubmitButton(
              title: context.l10n?.confirm ?? "",
              onTap: () {
                provider.onConfirmTap(context);
              },
            ),
          );
        },
      ),
      appBar: CustomAppBar(title: context.l10n?.addInverter ?? ""),
      body: Consumer<AddInverterProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding,
            ),
            child: Column(
              children: [
                /// Space
                20.ph.spaceVertical,

                /// Bind Collector
                _buildRow("Bind Collector", provider.bindCollector),

                /// Space
                20.ph.spaceVertical,

                /// Divider
                Divider(
                  height: 0,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                /// Space
                5.ph.spaceVertical,

                /// Inverter No. and RS485 ID
                _buildTextFormFieldTile(
                  'Inverter No',
                  provider.addInverterModel.inverterNo,
                  provider.updateInverterNo,
                  keyboardType: TextInputType.number,
                ),

                /// Divider
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                /// Error Text for Inverter No
                if (provider.inverterNoError.isNotEmpty)
                  ErrorText(
                    error: provider.inverterNoError,
                    bottomPadding: 7.ph,
                    leftPadding: 0,
                  ),

                /// RS485 ID
                _buildTextFormFieldTile(
                  'RS485 ID',
                  provider.addInverterModel.rs485Id,
                  provider.updateRS485Id,
                  keyboardType: TextInputType.number,
                ),

                /// Divider
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                /// Error Text for Inverter No
                if (provider.rs485IdError.isNotEmpty)
                  ErrorText(
                    error: provider.rs485IdError,
                    bottomPadding: 7.ph,
                    leftPadding: 0,
                  ),

                /// Model Selection with Scanner Icon
                _buildDropdownField(
                  title: "Model",
                  value: provider.selectedModel,
                  options: provider.modelOptions,
                  onChanged: (value) {
                    if (value != null) provider.setModel(value);
                  },
                  trailingIcon: AssetRes.scannerIcon2Icon,
                  onScanTap: () {
                    provider.onTapScanner(context, provider.selectedModel);
                    // QR scan logic here
                  },
                ),

                /// Divider
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                /// GMT Selection
                _buildDropdownField(
                  title: "GMT Selection",
                  value: provider.selectedGMT,
                  options: provider.gmtOptions,
                  onChanged: (value) {
                    if (value != null) provider.setGMT(value);
                  },
                ),

                /// Divider
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                /// Serial Number
                _buildTextFormFieldTile(
                  'SN',
                  provider.addInverterModel.serialNumber,
                  provider.updateSerialNumber,
                ),

                /// Divider
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                /// Error Text for Serial Error
                if (provider.serialNoError.isNotEmpty)
                  ErrorText(
                    error: provider.serialNoError,
                    bottomPadding: 7.ph,
                    leftPadding: 0,
                  ),

                /// Panel Watt and Count
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Panel Label
                          Text(
                            context.l10n?.panel ?? "",
                            style: styleW500S14.copyWith(
                              color: ColorRes.black.withValues(alpha: 0.6),
                            ),
                          ),

                          ///Space
                          30.pw.spaceHorizontal,

                          _buildPanelTextFormFieldTile(
                            '(W)',
                            provider.addInverterModel.panelWatt,
                            provider.updatePanelWatt,
                            keyboardType: TextInputType.number,
                          ),

                          ///Space
                          15.pw.spaceHorizontal,
                          _buildPanelTextFormFieldTile(
                            '(pcs)',
                            provider.addInverterModel.panelCount,
                            provider.updatePanelCount,
                            keyboardType: TextInputType.number,
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Divider(
                        color: ColorRes.black.withValues(alpha: 0.1),
                      ),
                    ),
                  ],
                ),

                /// Error Text for Panel Watt Error
                if (provider.panelWattError.isNotEmpty)
                  ErrorText(
                    error: provider.panelWattError,
                    bottomPadding: 7.ph,
                    leftPadding: 0,
                  ),

                /// Error Text for pPanel Count Error
                if (provider.panelCountError.isNotEmpty)
                  ErrorText(
                    error: provider.panelCountError,
                    bottomPadding: 7.ph,
                    leftPadding: 0,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: styleW500S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.5),
            ),
          ),
        ),

        Expanded(flex: 2, child: Text(value, style: styleW500S14)),
      ],
    );
  }

  Widget _buildTextFormFieldTile(
    String title,
    String value,
    ValueChanged<String> onChanged, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Row(
      children: [
        /// Title
        Expanded(
          child: Text(
            title,
            style: styleW500S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),
        ),

        /// Space
        10.pw.spaceHorizontal,

        /// TextFormField
        Expanded(
          flex: 2,
          child: TextFormField(
            initialValue: value,
            onChanged: onChanged,
            keyboardType: keyboardType,
            onTapOutside:
                (e) =>
                    hideKeyboard(context: navigatorKey.currentState?.context),
            style: styleW600S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10.ph),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  Widget _buildPanelTextFormFieldTile(
    String title,
    String value,
    ValueChanged<String> onChanged, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: ColorRes.primaryColor)),
          ),
          width: 66.pw,
          padding: EdgeInsets.only(bottom: 8),
          child: TextFormField(
            initialValue: value,
            onChanged: onChanged,
            keyboardType: keyboardType,
            textAlign: TextAlign.center,
            style: styleW600S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
            onTapOutside:
                (e) =>
                    hideKeyboard(context: navigatorKey.currentState?.context),
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          // textAlign: TextAlign.center,
          // ),
        ),
        10.pw.spaceHorizontal,
        Text(
          title,
          style: styleW500S14.copyWith(
            color: ColorRes.black.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String title,
    required String value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
    String? trailingIcon,
    void Function()? onScanTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.ph),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: styleW500S14.copyWith(
                color: ColorRes.black.withValues(alpha: 0.6),
              ),
            ),
          ),

          /// Space
          10.pw.spaceHorizontal,
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: value,
                    underline: SizedBox.shrink(),
                    onChanged: onChanged,
                    style: styleW500S14,

                    padding: EdgeInsets.zero,
                    isDense: true,
                    icon: const SizedBox.shrink(),
                    // hides the arrow
                    items:
                        options
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                  ),
                ),
                if (trailingIcon != null)
                  GestureDetector(
                    onTap: onScanTap,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SvgAsset(
                        imagePath: trailingIcon,
                        color: ColorRes.primaryColor,
                        height: 24.ph,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
