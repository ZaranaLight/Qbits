import 'package:qbits/qbits.dart';

class AlarmTab extends StatelessWidget {
  const AlarmTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Consumer<PlantDetailProvider>(
        builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Space between tabs and content
              10.ph.spaceVertical,

              /// TabBar with Container
              _buildTabBarContainer(context, provider),

              /// Tab content
              _buildTabContent(provider, context),

              /// Vertical space
              20.pw.spaceVertical,
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabBarContainer(
    BuildContext context,
    PlantDetailProvider provider,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.pw),
      child: Material(
        color: ColorRes.transparent,
        child: Column(
          children: [
            SizedBox(
              height: 35.pw,
              child: Material(
                color: ColorRes.transparent,
                child: TabBar(
                  tabAlignment: TabAlignment.fill,
                  padding: EdgeInsets.symmetric(
                    horizontal: Constants.horizontalPadding,
                  ),
                  isScrollable: false,
                  physics: const NeverScrollableScrollPhysics(),
                  labelColor: ColorRes.primaryColor,
                  unselectedLabelColor: ColorRes.darkGrey,
                  labelStyle: styleW500S16.copyWith(color: ColorRes.darkGrey),
                  unselectedLabelStyle: styleW500S16.copyWith(
                    color: ColorRes.transparent,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: ColorRes.transparent,
                  indicatorColor: ColorRes.transparent,
                  overlayColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.pressed)) {
                      return ColorRes.grey3.withValues(
                        alpha: 0.2,
                      ); // Custom ripple color
                    }
                    return null;
                  }),
                  splashBorderRadius: BorderRadius.circular(25),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10.pw),
                  indicator: BoxDecoration(
                    color: ColorRes.grey.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(25.pw),
                    shape: BoxShape.rectangle,
                  ),
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.pw),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(20.pw),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Center(child: Text(context.l10n?.all ?? "")),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(20.pw),
                        ),
                        child: Center(child: Text(context.l10n?.going ?? "")),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(20.pw),
                        ),
                        child: Center(
                          child: Text(context.l10n?.recovered ?? ""),
                        ),
                      ),
                    ),
                  ],
                  onTap: provider.changeAlarmTab,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(PlantDetailProvider provider, BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          // All alarms
          AlarmListViewWrapper(itemCount: 10, alarmTypeKey: 'all'),

          // Going alarms
          AlarmListViewWrapper(itemCount: 2, alarmTypeKey: 'going'),

          // Recovered alarms
          AlarmListViewWrapper(itemCount: 5, alarmTypeKey: 'recovered'),
        ],
      ),
    );
  }
}
