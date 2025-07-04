import 'package:qbits/qbits.dart';

class EditInverterScreen extends StatelessWidget {
  const EditInverterScreen({super.key});

  static const routeName = "edit_inverter";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<EditInverterProvider>(
      create: (c) => EditInverterProvider(),
      child: EditInverterScreen(),
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
      appBar: CustomAppBar(title: 'Edit 1'),
      body: Consumer<EditInverterProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.pw),
            child: Column(
              children: [
                5.ph.spaceVertical,
                _buildTextFormFieldTile(
                  'Inverter No.',
                  provider.editInverterModel.inverterNo,
                  provider.updateInverterNo,
                  keyboardType: TextInputType.number,
                ),
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),
                _buildTextFormFieldTile(
                  'RS485 ID',
                  provider.editInverterModel.rs485Id,
                  provider.updateRS485Id,
                  keyboardType: TextInputType.number,
                ),
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),
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
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),
                _buildDropdownField(
                  title: "GMT Selection",
                  value: provider.selectedGMT,
                  options: provider.gmtOptions,
                  onChanged: (value) {
                    if (value != null) provider.setGMT(value);
                  },
                ),
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),
                _buildTextFormFieldTile(
                  'SN',
                  provider.editInverterModel.serialNumber,
                  provider.updateSerialNumber,
                ),
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n?.panel ?? "",
                      style: styleW500S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),
                    30.pw.spaceHorizontal,
                    _buildPanelTextFormFieldTile(
                      '(W)',
                      provider.editInverterModel.panelWatt,
                      provider.updatePanelWatt,
                      keyboardType: TextInputType.number,
                    ),
                    30.pw.spaceHorizontal,
                    _buildPanelTextFormFieldTile(
                      '(pcs)',
                      provider.editInverterModel.panelCount,
                      provider.updatePanelCount,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),

                // _buildPanelField(),
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
    return SizedBox(
      height: 42.ph,

      child: Row(
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
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPanelTextFormFieldTile(
    String title,
    String value,
    ValueChanged<String> onChanged, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      height: 42.ph,

      child: Row(
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
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12,
                ), // 👈 increase vertical padding
              ),
              textAlign: TextAlign.center,
            ),
          ),
          10.pw.spaceHorizontal,
          Text(title, style: styleW500S14),
        ],
      ),
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.ph),

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
