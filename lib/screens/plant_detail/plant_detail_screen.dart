import 'package:qbits/qbits.dart';

class PlantDetailScreen extends StatelessWidget {
  const PlantDetailScreen({super.key});

  static const routeName = "plant_detail";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<PlantDetailProvider>(
      create: (c) => PlantDetailProvider(),
      child: PlantDetailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Consumer<PlantDetailProvider>(
        builder: (context, state, child) {
          return Scaffold(
            body: Column(
              children: [
                CustomAppBar(
                  title: context.l10n?.confirm ?? "",
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 16.pw),
                      child: SvgAsset(imagePath: AssetRes.starIcon),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.only(
                    right: 14.pw,
                    top: 14.ph,
                    left: 14.pw,
                  ),
                  color: ColorRes.white,
                  child: Column(
                    children: [
                      /// First Row
                      Row(
                        children: [
                          SvgAsset(imagePath: AssetRes.offlineIcon),

                          /// Space
                          6.ph.spaceHorizontal,

                          /// Text
                          Text(
                            context.l10n?.offline ?? "",
                            style: styleW500S14.copyWith(
                              color: ColorRes.darkGrey,
                            ),
                          ),

                          Spacer(),

                          Text(
                            context.l10n?.offline ?? "",
                            style: styleW400S14.copyWith(
                              color: ColorRes.darkGrey,
                            ),
                          ),
                        ],
                      ),

                      /// Space
                      12.ph.spaceVertical,

                      /// TabBar
                      TabBar(
                        padding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.start,
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
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color:
                                ColorRes
                                    .primaryColor, // your desired underline color
                            width: 2.0,
                          ),
                        ),
                        tabs: [
                          Tab(text: context.l10n?.dashboard),
                          Tab(text: context.l10n?.device),
                          Tab(text: context.l10n?.alarm),
                          Tab(text: context.l10n?.about),
                        ],
                        isScrollable: true, // Set true if long labels
                      ),
                    ],
                  ),
                ),

                /// Expanded TabBarView
                Expanded(
                  child: TabBarView(
                    children: [
                      DashBoardTab(),
                      DeviceTab(),
                      AlarmTab(),
                      AboutTab(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
