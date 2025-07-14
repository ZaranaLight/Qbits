import 'package:qbits/qbits.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({super.key});

  static const routeName = "plant";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<PlantProvider>(
      create: (_) => PlantProvider(),
      child: const PlantScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          top: false,
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                /// AppBar with Search and Tabs
                const _AppBar(),

                /// Space
                16.ph.spaceVertical,

                /// Filter, Rank, and Preference Buttons
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///Rank,
                      _ellipseButton(
                        context: context,
                        text: provider.selectedRank ?? context.l10n?.rank ?? "",
                        imagePath: AssetRes.dropDownArrowIcon,
                        onTap: () => RankDialogBox.show(context: context),
                      ),

                      /// Preference
                      _ellipseButton(
                        context: context,
                        text: context.l10n?.preference ?? "",
                        imagePath: AssetRes.dropDownArrowIcon,
                        onTap: () => PreferenceDialogBox.show(context: context),
                      ),

                      /// Filter
                      _ellipseButton(
                        context: context,
                        text: context.l10n?.filter ?? "",
                        imagePath: AssetRes.filterIcon,
                        onTap: () => FilterDialogBox.show(context: context),
                      ),
                    ],
                  ),
                ),

                ///Space
                16.ph.spaceVertical,

                /// TabBarView for content
                Expanded(
                  child: TabBarView(
                    children: [
                      ///All Tab Content
                      _TabContent(),

                      ///Normal Tab Content
                      _TabContent(),

                      ///Alarm Tab Content
                      _TabContent(),

                      ///Offline Tab Content
                      _TabContent(),
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

  /// Reusable Ellipse Button
  Widget _ellipseButton({
    required BuildContext context,
    required String text,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: BoxConstraints(minWidth: 110.pw),
        height: double.infinity,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.ph, horizontal: 7.pw),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Text and Icon
                  Flexible(child: Text(text, style: styleW500S14)),

                  /// Space
                  4.pw.spaceHorizontal,

                  /// Icon
                  SvgAsset(imagePath: imagePath),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// AppBar with Search and Tabs
class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantProvider>(
      builder: (context, provider, child) {
        return Container(
          color: ColorRes.primaryColor,
          child: SafeArea(
            child: Column(
              children: [
                /// First Row
                Padding(
                  padding: EdgeInsets.only(
                    left: Constants.horizontalPadding,
                    right: Constants.horizontalPadding,
                    top: 10.ph,
                  ),
                  child: Row(
                    children: [
                      /// Menu Icon (Leading)
                      InkWell(
                        onTap: () {},
                        child: SvgAsset(
                          imagePath: AssetRes.plantIcon,
                          color: ColorRes.white,
                        ),
                      ),

                      /// Space
                      10.pw.spaceHorizontal,

                      /// Expanded Search TextField
                      Expanded(
                        child: SearchTextField(
                          hintText: context.l10n?.search,
                          controller: TextEditingController(),
                          prefixIcon: SvgAsset(imagePath: AssetRes.searchIcon),
                          readOnly: true,
                          onTap: () {
                            context.navigator.pushNamed(SearchScreen.routeName);
                          },
                        ),
                      ),

                      /// Space
                      10.pw.spaceHorizontal,

                      /// Right Icon (e.g. Plus)
                      InkWell(
                        onTap: () {
                          context.navigator.pushNamed(AddPlantScreen.routeName);
                        },
                        child: SvgAsset(imagePath: AssetRes.roundedPlusIcon),
                      ),
                    ],
                  ),
                ),

                /// Space between search row and tabs
                12.ph.spaceVertical,

                /// TabBar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.horizontalPadding,
                  ),
                  child: TabBar(
                    indicatorColor: ColorRes.white,
                    labelColor: ColorRes.white,
                    unselectedLabelColor: Colors.white70,
                    labelStyle: styleW600S14.copyWith(color: ColorRes.black),
                    unselectedLabelStyle: styleW600S14.copyWith(
                      color: ColorRes.black,
                    ),
                    dividerColor: ColorRes.primaryColor,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: ColorRes.white, // your desired underline color
                        width: 2.0,
                      ),
                    ),
                    tabs: [
                      Tab(
                        child: Column(
                          children: [
                            Text("7"),

                            6.ph.spaceVertical,
                            Text(context.l10n?.all ?? ""),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [
                            Text("0"),

                            6.ph.spaceVertical,
                            Text(context.l10n?.normal ?? ""),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [
                            Text("1"),

                            6.ph.spaceVertical,
                            Text(context.l10n?.alarm ?? ""),
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [
                            Text("1"),

                            6.ph.spaceVertical,
                            Text(context.l10n?.offline ?? ""),
                          ],
                        ),
                      ),
                    ],
                    isScrollable: false, // Set true if long labels
                  ),
                ),

                /// Space between tabs and content
                12.ph.spaceVertical,
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Tab content as reusable plant_details_tabs
class _TabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantProvider>(
      builder: (context, provider, child) {
        return ChangeNotifierProvider(
          create: (context) => PlantProvider(),
          child: StackedLoader(
            loading: provider.loader,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Watchlist Section
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: ColorRes.white),
                    child: CustomListView(
                      itemCount:
                          provider.loader
                              ? 0
                              : provider.planListResponse.length + 1,
                      onRefresh: () => provider.getPlantListAPI(),
                      emptyWidget: UnKnownScreen(),
                      showEmptyWidget:
                          !provider.loader && provider.planListResponse.isEmpty,
                      separatorBuilder:
                          (ctx, ind) => Container(
                            height: 1.ph,
                            width: 100.pw,
                            color: ColorRes.black.withValues(alpha: 0.1),
                          ),
                      itemBuilder: (context, index) {
                        if (index >= provider.planListResponse.length) {
                          if (!provider.hasMoreData) {
                            return Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: Text(
                                  'No more items',
                                  style: styleW500S12.copyWith(
                                    color: ColorRes.grey,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (!provider.isApiCalling) {
                            provider.getPlantListAPI();
                          }
                          return SizedBox(
                            height: 100.ph,
                            child: const SmallLoader(),
                          );
                        }

                        // AttendanceModel model = state.attendanceList[index];
                        return PlantListWidget(
                          planListResponse: provider.planListResponse[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PlantListWidget extends StatelessWidget {
  final PlanListResponseModel? planListResponse;

  const PlantListWidget({super.key, this.planListResponse});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorRes.transparent,
      child: InkWell(
        onTap: () {
          context.navigator.pushNamed(PlantDetailScreen.routeName);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Constants.horizontalPadding,
          ),
          margin: EdgeInsets.symmetric(vertical: 20.ph),
          width: 100.w,
          child: Row(
            children: [
              /// Image
              AssetsImg(
                imagePath: AssetRes.tempSolarImg,
                height: 80.ph,
                width: 100.pw,
              ),

              /// Space
              10.pw.spaceHorizontal,

              /// Expanded Column
              Expanded(
                child: Column(
                  spacing: 14,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              planListResponse?.plantInfo?.plantName ?? "",
                              style: styleW600S14,
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(5.pw),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgAsset(
                              imagePath: AssetRes.starIcon,
                              width: 20.pw,
                              color:
                                  planListResponse?.watch ?? false
                                      ? ColorRes.orange4
                                      : ColorRes.grey3,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildData(
                          title: context.l10n?.day ?? "",
                          value:
                              "${planListResponse?.plantInfo?.eday.toKwh}kwh",
                        ),
                        _buildData(
                          title: context.l10n?.power ?? "",
                          value: "${planListResponse?.plantInfo?.acpower}kw",
                        ),
                        _buildData(
                          title: context.l10n?.total ?? "",
                          value:
                              "${planListResponse?.plantInfo?.etot.toMwh}MWh",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildData({required String title, required String value}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Text(
            title,
            style: styleW500S12.copyWith(
              color: ColorRes.black.withValues(alpha: 0.5),
            ),
          ),

          /// Space
          4.ph.spaceVertical,

          /// Value
          Text(value, style: styleW600S14),
        ],
      ),
    );
  }
}
