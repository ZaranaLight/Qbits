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
                    InkWell(
                      onTap: () {
                        state.setFollow(!state.isFollow);
                      },
                      borderRadius: BorderRadius.circular(5.pw),
                      child: Padding(
                        padding: EdgeInsets.all(Constants.horizontalPadding),
                        child: SvgAsset(
                          imagePath: AssetRes.starIcon,
                          color:
                              state.isFollow
                                  ? ColorRes.orange2
                                  : ColorRes.grey3,
                        ),
                      ),
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
                          SvgAsset(
                            imagePath: AssetRes.offlineIcon,
                            height: 18.ph,
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

                          Spacer(),

                          Text(
                            "Text",
                            style: styleW400S14.copyWith(
                              color: ColorRes.black.withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),

                      /// Space
                      12.ph.spaceVertical,

                      /// TabBar
                      Material(
                        elevation: 1,
                        borderRadius: BorderRadius.circular(5.pw),
                        shadowColor: Colors.transparent,
                        child: TabBar(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          indicatorColor: ColorRes.primaryColor,
                          labelColor: ColorRes.primaryColor,
                          unselectedLabelColor: ColorRes.black.withValues(alpha: 0.5),
                          labelStyle: styleW600S16.copyWith(
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                          unselectedLabelStyle: styleW500S16.copyWith(
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                          dividerColor: ColorRes.white,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              color:
                                  ColorRes
                                      .primaryColor, // your desired underline color
                              width: 2.0,
                            ),
                            insets: EdgeInsets.only(bottom: 10.ph),
                          ),
                          tabs: [
                            Tab(text: context.l10n?.dashboard),
                            Tab(text: context.l10n?.device),
                            Tab(text: context.l10n?.alarm),
                            Tab(text: context.l10n?.about),
                          ],
                          labelPadding: EdgeInsets.symmetric(horizontal: 0.pw),

                          tabAlignment: TabAlignment.fill,
                          // Set true if long labels
                        ),
                      ),
                    ],
                  ),
                ),

                /// Expanded TabBarView
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
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
