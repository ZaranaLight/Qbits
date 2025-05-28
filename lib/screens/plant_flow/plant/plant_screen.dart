import 'package:qbits/qbits.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({super.key});

  static const routeName = "plant";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<PlantProvider>(
      create: (c) => PlantProvider(),
      child: PlantScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Consumer<PlantProvider>(
        builder: (context, state, child) {
          return Column(
            children: [
              const _AppBar(),

              /// Expanded TabBarView
              Expanded(
                child: TabBarView(
                  children: [
                    _TabContent(),
                    _TabContent(),
                    _TabContent(),
                    _TabContent(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
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
                    onTap: () {},
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
                  Tab(text: context.l10n?.all),
                  Tab(text: context.l10n?.normal),
                  Tab(text: context.l10n?.alarm),
                  Tab(text: context.l10n?.offline),
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
  }
}

/// Tab content as reusable widget
class _TabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      mainAxisSize: MainAxisSize.min,
      children: [
        /// Space between tabs and content
        16.ph.spaceVertical,

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.pw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ellipseButton(
                text: context.l10n?.rank ?? "",
                imagePath: AssetRes.dropDownArrowIcon,
                onTap: () {
                  RankDialogBox.show(context: context);
                },
              ),

              ///
              16.pw.spaceHorizontal,

              _ellipseButton(
                text: context.l10n?.preference ?? "",
                imagePath: AssetRes.dropDownArrowIcon,
                onTap: () {
                  PreferenceDialogBox.show(context: context);
                },
              ),

              ///
              16.pw.spaceHorizontal,

              _ellipseButton(
                text: context.l10n?.filter ?? "",
                imagePath: AssetRes.filterIcon,
                onTap: () {
                  FilterDialogBox.show(context: context);
                },
              ),
            ],
          ),
        ),

        /// Space between buttons and content
        16.ph.spaceVertical,

        Expanded(
          child:   Container(
            padding: EdgeInsets.symmetric(vertical: 16.pw),
            decoration: BoxDecoration(
                color: ColorRes.white
            ),
            child: CustomListView(
              itemCount: 10,
              separatorBuilder: (ctx, ind) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 20.ph),
                  height: 1.ph,
                  width: 100.pw,
                  color: ColorRes.black.withValues(alpha: 0.1),
                );
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.pw),
                  child: MyWatchlistCell(),
                );
              },
            ),
          ),
        ),

        /// Space
        20.ph.spaceVertical,
      ],
    );
  }

  Widget _ellipseButton({
    required String text,
    required String imagePath,
    required Function()? onTap,
  }) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.ph, horizontal: 10.pw),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text, style: styleW500S14),
                  4.pw.spaceHorizontal,
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
