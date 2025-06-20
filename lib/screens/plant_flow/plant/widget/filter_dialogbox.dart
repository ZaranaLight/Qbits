import 'package:qbits/qbits.dart';

class FilterDialogBox extends StatelessWidget {
  const FilterDialogBox({super.key});

  static void show({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider(
          create: (_) => PlantProvider(),
          child: const FilterDialogBox(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlantProvider>(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Power (KW)
            Text(context.l10n?.powerKW ?? "Power (KW)", style: styleW500S14),
            8.ph.spaceVertical,
            Wrap(
              spacing: 8.pw,
              runSpacing: 8.ph,
              children: [
                ...['1-5', '5-10', '10-20', '20-50', '50+'].map(
                  (value) => _buildSelectableOption(
                    context,
                    title: value,
                    isSelected: provider.selectedPowerKW == value,
                    onTap: () => provider.selectPowerKW(value),
                  ),
                ),
              ],
            ),

            20.ph.spaceVertical,

            /// In Total (kWh)
            Text(
              context.l10n?.inTotalKWh ?? "In Total (kWh)",
              style: styleW500S14,
            ),
            8.ph.spaceVertical,
            Wrap(
              spacing: 8.pw,
              runSpacing: 8.ph,
              children: [
                ...['1-5kW', '5-10kW', '10-20kW', '20-50kW', '50kW+'].map(
                  (value) => _buildSelectableOption(
                    context,
                    title: value,
                    isSelected: provider.selectedTotalKWh == value,
                    onTap: () => provider.selectTotalKWh(value),
                  ),
                ),
              ],
            ),

            20.ph.spaceVertical,

            /// Follow
            Text(context.l10n?.follow ?? "Follow", style: styleW500S14),
            8.ph.spaceVertical,
            _buildSelectableOption(
              context,
              title: 'Plant I Followed',
              isSelected: provider.followedPlantSelected,
              onTap: provider.toggleFollowedPlant,
            ),

            24.ph.spaceVertical,

            /// Cancel & Confirm Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// Cancel Button
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorRes.primaryColor),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Constants.horizontalPadding,
                          vertical: 6.ph,
                        ),
                        child: Text(
                          context.l10n?.cancel ?? "Cancel",
                          style: styleW500S14.copyWith(
                            color: ColorRes.primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),

                /// Space
                9.pw.spaceHorizontal,

                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorRes.primaryColor,
                    border: Border.all(color: ColorRes.primaryColor),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Constants.horizontalPadding,
                          vertical: 6.ph,
                        ),
                        child: Text(
                          context.l10n?.confirm ?? "",
                          style: styleW500S14.copyWith(color: ColorRes.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableOption(
    BuildContext context, {
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: ColorRes.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.pw, vertical: 10.ph),
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isSelected
                      ? ColorRes.primaryColor
                      : ColorRes.black.withValues(alpha: 0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            title,
            style: styleW500S14.copyWith(
              color: isSelected ? ColorRes.primaryColor : ColorRes.black,
            ),
          ),
        ),
      ),
    );
  }
}
