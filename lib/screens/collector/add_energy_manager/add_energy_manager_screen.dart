import 'package:qbits/common/widget/common_widgets.dart';
import 'package:qbits/qbits.dart';

class AddEnergyManagerScreen extends StatelessWidget {
  const AddEnergyManagerScreen({super.key});

  static const routeName = "add_energy_manager_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AddEnergyManagerProvider>(
      create: (c) => AddEnergyManagerProvider(),
      child: AddEnergyManagerScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: context.l10n?.addEnergyManager ?? ""),
      bottomNavigationBar: Consumer<AddEnergyManagerProvider>(
        builder: (context, provider, _) {
          return SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.confirm ?? "",
                onTap: () {
                  provider.onConfirmTap(context);
                },
              ),
            ),
          );
        },
      ),

      body: Consumer<AddEnergyManagerProvider>(
        builder: (context, provider, _) {
          return CustomSingleChildScroll(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding,
              vertical: 20.ph,
            ),
            child: Column(
              spacing: 12.ph,

              children: [
                /// Bind Collector
                _buildRow("Bind Collector", provider.bindCollector),

                /// Divider
                Divider(
                  height: 0,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                /// Equipment No
                _buildInputRow(
                  "Equipment No",
                  initialValue: provider.equipmentNo,
                  onChanged: provider.updateEquipmentNo,
                ),

                /// Divider
                Divider(
                  height: 0,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                /// Error Text for Equipment No
                if (provider.equipmentNoError.isNotEmpty)
                  ErrorText(
                    error: provider.equipmentNoError,
                    bottomPadding: 7.ph,
                    leftPadding: 0,
                  ),

                /// Equipment Type
                _buildDropdownField(
                  title: "Equipment",
                  value: provider.equipment,
                  options: provider.equipmentOption,
                  onChanged: (value) {
                    if (value != null) provider.setEquipment(value);
                  },
                ),

                /// Divider
                Divider(
                  height: 0,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                /// GMT Selection
                _buildDropdownField(
                  title: "GMT Selection",
                  value: provider.selectedGMT,
                  options: provider.gmtOptions,
                  onChanged: (value) {
                    if (value != null) provider.setGMT(value);
                  },
                ),

                /// _buildRow("GMT Selection", provider.gmt),
                Divider(
                  height: 0,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                /// Serial Number
                _buildInputRow(
                  "Serial Number",
                  initialValue: provider.serialNumber,
                  onChanged: provider.updateSerial,
                ),

                /// Divider
                Divider(
                  height: 0,
                  color: ColorRes.black.withValues(alpha: 0.1),
                ),

                /// Error Text for Serial Number
                if (provider.serialNoError.isNotEmpty)
                  ErrorText(
                    error: provider.serialNoError,
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

  Widget _buildDropdownField({
    required String title,
    required String value,
    required List<String> options,
    required ValueChanged<String?> onChanged,
    String? trailingIcon,
    void Function()? onScanTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Dropdown Button
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

        Expanded(child: Text(value, style: styleW500S14)),
      ],
    );
  }

  Widget _buildInputRow(
    String label, {
    required String initialValue,
    Function(String)? onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 3.ph),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: styleW500S14.copyWith(
                color: ColorRes.black.withValues(alpha: 0.5),
              ),
            ),
          ),

          Expanded(
            child: TextFormField(
              style: styleW500S14,
              initialValue: initialValue,
              onTapOutside:
                  (e) =>
                      hideKeyboard(context: navigatorKey.currentState?.context),
              onChanged: onChanged,

              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
