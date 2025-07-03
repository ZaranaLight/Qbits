import 'package:qbits/qbits.dart';

class CollectorWidget extends StatelessWidget {
  const CollectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantDetailProvider>(
      builder: (context, provider, child) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Divider
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                /// Space between dropdown and content
                5.ph.spaceVertical,
                // /// Device Dropdown
                _buildDeviceDropdown(provider),

                /// Space between dropdown and content
                5.ph.spaceVertical,

                /// Divider
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                /// Space between divider and content
                Expanded(
                  child: CustomListView(
                    itemCount: 10,
                    padding: EdgeInsets.only(
                      bottom: Constants.safeAreaPadding.bottom + 15.ph,
                    ),
                    separatorBuilder:
                        (context, index) => Container(
                          width: double.infinity,
                          height: 1,
                          color: ColorRes.black.withValues(alpha: 0.1),
                        ),
                    itemBuilder: (context, index) {
                      return Material(
                        color: ColorRes.transparent,
                        child: InkWell(
                          onTap: () {
                            context.navigator.pushNamed(
                              CollectorScreen.routeName,
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              /// Space between dropdown and content
                              5.ph.spaceVertical,

                              /// First Row
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Constants.horizontalPadding,
                                ),

                                child: Row(
                                  children: [
                                    Text(
                                      "Online Collector",
                                      style: styleW600S16.copyWith(),
                                    ),

                                    Spacer(),
                                    Container(
                                      width: 18.pw,
                                      height: 18.ph,
                                      decoration: BoxDecoration(
                                        color: ColorRes.lightRed,
                                        borderRadius: BorderRadius.circular(
                                          18.pw,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(5.pw),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ColorRes.red,
                                          borderRadius: BorderRadius.circular(
                                            8.pw,
                                          ),
                                        ),
                                      ),
                                    ),

                                    /// Space
                                    6.ph.spaceHorizontal,

                                    /// Text
                                    Text(
                                      context.l10n?.offline ?? "",
                                      style: styleW500S14.copyWith(
                                        color: ColorRes.black.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// Space between buttons and content
                              10.ph.spaceVertical,

                              /// Second Row
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Constants.horizontalPadding,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.l10n?.production ?? "",
                                      style: styleW500S14.copyWith(
                                        color: ColorRes.black.withValues(
                                          alpha: 0.6,
                                        ),
                                      ),
                                    ),

                                    ///Space
                                    2.ph.spaceVertical,
                                    Text("0 kW", style: styleW600S16),
                                  ],
                                ),
                              ),

                              /// Space between buttons and content
                              16.ph.spaceVertical,

                              // Floating + Button
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildDeviceDropdown(PlantDetailProvider provider) {
    return DropdownButton<String>(
      elevation: 1,
      padding: EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
      isDense: true,
      hint: Text(provider.selectedDeviceOption, style: styleW500S14),
      isExpanded: false,
      underline: const SizedBox(),
      items:
          provider.deviceOption.map((value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (newValue) {
        if (newValue != null) provider.updateSelectedDevice(newValue);
      },
    );
  }
}
