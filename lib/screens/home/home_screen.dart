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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  offset: Offset(0, 4),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ),
                              ],
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
                                      ),

                                      /// Space
                                      13.pw.spaceHorizontal,

                                      /// Text
                                      Text(context.l10n?.myWatchlist ?? ""),

                                      Spacer(),

                                      /// Forward Icon
                                      SvgAsset(imagePath: AssetRes.forwardIcon),
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
                          DeviceLiberyContainer(),

                          /// Space
                          16.ph.spaceVertical,

                          BarChartContainer(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),

                /// Title Text
                Text(
                  context.l10n?.dashboard ?? "",
                  style: styleW600S20.copyWith(color: ColorRes.white),
                ),

                /// Plus Icon
                SvgAsset(imagePath: AssetRes.plusIcon),
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
