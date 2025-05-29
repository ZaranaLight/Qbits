import 'package:qbits/qbits.dart';

class DeviceTab extends StatelessWidget {
  const DeviceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantDetailProvider>(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: 2,
          child: CustomSingleChildScroll(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Space between tabs and content
                16.ph.spaceVertical,

                /// TabBar
                Container(
                  color: ColorRes.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                              // Customize border color
                              width: 1.0, // Border thickness
                            ),
                          ),
                        ),
                        child: TabBar(
                          padding: EdgeInsets.symmetric(horizontal: 8.pw),
                          physics: NeverScrollableScrollPhysics(),
                          indicatorColor: ColorRes.primaryColor,
                          labelColor: ColorRes.primaryColor,
                          unselectedLabelColor: ColorRes.darkGrey,
                          labelStyle: styleW600S14.copyWith(
                            color: ColorRes.darkGrey,
                          ),
                          unselectedLabelStyle: styleW500S14.copyWith(
                            color: ColorRes.darkGrey,
                          ),
                          dividerColor: ColorRes.white,
                          tabAlignment: TabAlignment.start,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              color: ColorRes.primaryColor,
                              // your desired underline color
                              width: 2.0,
                            ),
                            insets: EdgeInsets.only(bottom: 8.ph),
                          ),
                          tabs: [
                            Tab(text: context.l10n?.inverter),
                            Tab(text: context.l10n?.collector),
                          ],
                          labelPadding: EdgeInsets.symmetric(horizontal: 10.pw),
                          isScrollable: true,
                          // Set true if long labels
                        ),
                      ),

                      /// Space between buttons and content
                      14.ph.spaceVertical,

                      /// Device Dropdown
                      _buildDeviceDropdown(provider),

                      /// Space between dropdown and content
                      5.ph.spaceVertical,

                      /// Divider
                      Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                      /// Space between divider and content
                      Material(
                        color: ColorRes.transparent,
                        child: InkWell(
                          onTap: () {},
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
                                        color: ColorRes.darkGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// Space between buttons and content
                              20.ph.spaceVertical,
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
                                          2.pw.spaceVertical,
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
                                          2.pw.spaceVertical,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
