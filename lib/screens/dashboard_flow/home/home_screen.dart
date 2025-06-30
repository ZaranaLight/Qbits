import 'package:qbits/qbits.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = "home";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (c) => HomeProvider(),
      child: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, state, child) {
        return Stack(
          children: [
            Container(
              height: 200.ph,
              width: 100.w,
              color: ColorRes.primaryColor,
            ),
            Column(
              children: [
                _AppBar(),

                Expanded(
                  child: StackedLoader(
                    loading: state.loader,
                    child: CustomSingleChildScroll(
                      padding: EdgeInsets.symmetric(
                        horizontal: Constants.horizontalPadding,
                      ),
                      key: UniqueKey(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Space
                          12.ph.spaceVertical,

                          /// My Watchlist Button
                          Container(
                            width: 92.w,
                            decoration: BoxDecoration(
                              color: ColorRes.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  context.navigator.pushNamed(
                                    MyWatchlistScreen.routeName,
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 24.ph,
                                    horizontal: 20.pw,
                                  ),
                                  child: Row(
                                    children: [
                                      /// Bookmark Image
                                      SvgAsset(
                                        imagePath: AssetRes.bookmarkIcon,
                                        height: 24.ph,
                                      ),

                                      /// Space
                                      13.pw.spaceHorizontal,

                                      /// Text
                                      Text(
                                        context.l10n?.myWatchlist ?? "",
                                        style: styleW500S16.copyWith(
                                          color: ColorRes.black.withValues(
                                            alpha: 0.6,
                                          ),
                                        ),
                                      ),

                                      Spacer(),

                                      /// Forward Icon
                                      SvgAsset(
                                        imagePath: AssetRes.forwardIcon,
                                        color: ColorRes.black.withValues(
                                          alpha: 0.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Space
                          20.ph.spaceVertical,

                          /// Circular Chart Container
                          CircularChartContainer(),

                          /// Space
                          16.ph.spaceVertical,

                          /// Total Plants Container
                          TotalPlantsContainer(),

                          /// Space
                          16.ph.spaceVertical,

                          /// Device Library Container
                          DeviceLibraryWidget(),

                          /// Space
                          16.ph.spaceVertical,

                          BarChartContainer(),

                          /// Space
                          16.ph.spaceVertical,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: Constants.horizontalPadding,
          right: Constants.horizontalPadding,
          top: 10.ph,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Text(
                    context.l10n?.dashboard ?? "",
                    style: styleW600S20.copyWith(color: ColorRes.white),
                  ),
                ),

                /// Plus Icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: PopupMenuButton(
                    constraints: BoxConstraints(maxWidth: 90.w),
                    offset: Offset(0, 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      side: BorderSide(color: ColorRes.primaryColor),
                    ),
                    padding: EdgeInsets.all(12.pw),
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(5.pw),
                    itemBuilder: (con) {
                      return [
                        PopupMenuItem(
                          onTap: () {
                            context.navigator.pushNamed(
                              AddPlantScreen.routeName,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgAsset(
                                  imagePath: AssetRes.roundedPlusIcon,
                                  color: ColorRes.primaryColor,
                                  height: 16.ph,
                                ),
                                Text(
                                  context.l10n?.addPlant ?? "",
                                  style: styleW500S14.copyWith(
                                    color: ColorRes.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ];
                    },

                    child: SvgAsset(imagePath: AssetRes.plusIcon),
                  ),
                ),
              ],
            ),

            /// Space
            20.ph.spaceVertical,

            /// Search Text Field
            SearchTextField(
              hintText: context.l10n?.search,
              controller: TextEditingController(),
              prefixIcon: SizedBox(
                height: 10.ph,
                width: 10.ph,
                child: SvgAsset(imagePath: AssetRes.searchIcon),
              ),
              readOnly: true,

              onTap: () {
                context.navigator.pushNamed(SearchScreen.routeName);
              },
            ),

            /// Space
            12.ph.spaceVertical,
          ],
        ),
      ),
    );
  }
}
