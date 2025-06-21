import 'package:qbits/qbits.dart';

class InverterWidget extends StatelessWidget {
  const InverterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantDetailProvider>(
      builder: (context, provider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Divider
            Divider(color: ColorRes.black.withValues(alpha: 0.1)),

            /// Space between dropdown and content
            5.ph.spaceVertical,

            /// Device Dropdown
            _buildDeviceDropdown(provider),

            /// Space between dropdown and content
            5.ph.spaceVertical,

            /// Divider
            Divider(color: ColorRes.black.withValues(alpha: 0.1)),

            /// Space between divider and content
            Expanded(
              child: CustomListView(
                itemCount: 2,
                separatorBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.pw,
                      vertical: 8.pw,
                    ),
                    width: double.infinity,
                    child: Divider(
                      color: ColorRes.black.withValues(alpha: 0.1),
                      height: 0,
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return Material(
                    color: ColorRes.transparent,
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          context.navigator.pushNamed(InverterScreen.routeName);
                        } else {
                          context.navigator.pushNamed(
                            InverterScreen.routeName,
                            arguments: {'inverterType': 'Hybrid'},
                          );
                        }
                      },
                      child: Column(
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
                                  "1# ASP-20KTLC",
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
                          20.ph.spaceVertical,

                          /// Second Row
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Constants.horizontalPadding,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(context.l10n?.production ?? ""),

                                      ///Space
                                      2.ph.spaceVertical,
                                      Text("0 kW", style: styleW600S16),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(context.l10n?.dayEnergy ?? ""),

                                      ///Space
                                      2.ph.spaceVertical,
                                      Text("0 kW", style: styleW600S16),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Space between buttons and content
                          16.ph.spaceVertical,
                        ],
                      ),
                    ),
                  );
                },
              ),
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
