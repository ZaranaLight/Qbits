import 'package:qbits/qbits.dart';

class PreferenceDialogBox extends StatelessWidget {
  const PreferenceDialogBox({super.key});

  static void show({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider(
          create: (_) => PlantProvider(),
          child: const PreferenceDialogBox(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
      ),

      contentPadding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            /// Space
            12.ph.spaceVertical,

            _buildRow(title: context.l10n?.dayPowerTotal ?? ""),

            /// Divider
            Container(
              height: 1,
              decoration: BoxDecoration(
                color: ColorRes.black.withValues(alpha: 0.1),
              ),
            ),

            _buildRow(title: context.l10n?.capacityPowerEquative ?? ""),

            /// Divider
            Container(
              height: 1,
              decoration: BoxDecoration(
                color: ColorRes.black.withValues(alpha: 0.1),
              ),
            ),

            _buildRow(title: context.l10n?.dayMonthYear ?? ""),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({required String title}) {
    return Consumer<PlantProvider>(
      builder: (_, provider, __) {
        final isSelected = provider.isSelected(title);

        return InkWell(
          onTap: () => provider.select(title),
          child: Container(
            padding: EdgeInsets.only(
              top: 14.ph,
              bottom: 14.ph,
              left: 5.pw,
              right: 5.pw,
            ),

            child: Row(
              children: [
                /// Title
                Text(
                  title,
                  style:
                      isSelected
                          ? styleW600S14.copyWith(
                            color: isSelected ? ColorRes.primaryColor : null,
                          )
                          : styleW500S14,
                ),

                /// Space
                9.pw.spaceHorizontal,

                /// SVG Icon
                isSelected
                    ? SvgAsset(
                      imagePath: AssetRes.rightTickIcon,
                      color: ColorRes.primaryColor,
                    )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
