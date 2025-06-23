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
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: Constants.safeAreaPadding.bottom + 30.ph,
            left: Constants.horizontalPadding,
            right: Constants.horizontalPadding,
          ),
          child: SubmitButton(
            title: context.l10n?.confirm ?? "",
            onTap: () {
              context.navigator.pop();
            },
          ),
        ),
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
                /// Inverter No. and RS485 ID
                _buildTextFormFieldTile(
                  'Inverter No.',
                  provider.addInverterModel.inverterNo,
                  provider.updateInverterNo,
                  keyboardType: TextInputType.number,
                ),

                /// Divider
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                /// RS485 ID
                _buildTextFormFieldTile(
                  'RS485 ID',
                  provider.addInverterModel.rs485Id,
                  provider.updateRS485Id,
                  keyboardType: TextInputType.number,
                ),

                /// Divider
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                /// Model Selection with Scanner Icon
                _buildDropdownField(
                  title: "Model",
                  value: provider.selectedModel,
                  options: provider.modelOptions,
                  onChanged: (value) {
                    if (value != null) provider.setModel(value);
                  },
                  trailingIcon: AssetRes.scannerIcon,
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

                /// Panel Watt and Count
                Row(
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
                    15.pw.spaceHorizontal,

                    _buildPanelTextFormFieldTile(
                      '(W)',
                      provider.addInverterModel.panelWatt,
                      provider.updatePanelWatt,
                      keyboardType: TextInputType.number,
                    ),
                    _buildPanelTextFormFieldTile(
                      '(pcs)',
                      provider.addInverterModel.panelCount,
                      provider.updatePanelCount,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
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
        Expanded(
          child: Text(
            title,
            style: styleW500S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            initialValue: value,
            onChanged: onChanged,
            keyboardType: keyboardType,
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80.pw,
          child: TextFormField(
            initialValue: value,
            onChanged: onChanged,
            keyboardType: keyboardType,
            style: styleW600S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.ph,
              ), // 👈 increase vertical padding
            ),
            textAlign: TextAlign.center,
          ),
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
          Expanded(
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
                        height: 15.ph,
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
