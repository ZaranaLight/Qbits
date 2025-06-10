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
                // /// Device Dropdown
                _buildDeviceDropdown(provider),

                /// Space between dropdown and content
                5.ph.spaceVertical,

                /// Divider
                Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                /// Space between divider and content
                Material(
                  color: ColorRes.transparent,
                  child: InkWell(
                    onTap: () {
                      context.navigator.pushNamed(CollectorScreen.routeName);
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
                                height: 18.pw,
                                decoration: BoxDecoration(
                                  color: ColorRes.lightRed,
                                  borderRadius: BorderRadius.circular(18.pw),
                                ),
                                padding: EdgeInsets.all(5.pw),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorRes.red,
                                    borderRadius: BorderRadius.circular(8.pw),
                                  ),
                                ),
                              ),

                              /// Space
                              6.ph.spaceHorizontal,

                              /// Text
                              Text(
                                context.l10n?.offline ?? "",
                                style: styleW500S14.copyWith(
                                  color: ColorRes.darkGrey,
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
                              Text(context.l10n?.production ?? ""),

                              ///Space
                              2.pw.spaceVertical,
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
                ),
              ],
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: FloatingActionButton(
            //     backgroundColor: ColorRes.green2,
            //     onPressed:
            //         () => context.navigator.pushNamed(
            //           AddCollectorScreen.routeName,
            //         ),
            //     child: SvgAsset(imagePath: AssetRes.plusIcon),
            //   ),
            // ),
          ],
        );
      },
    );
  }

  Widget _buildDeviceDropdown(PlantDetailProvider provider) {
    return DropdownButton<String>(
      elevation: 0,
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
