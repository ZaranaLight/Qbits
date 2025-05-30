import 'package:qbits/qbits.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  static const routeName = "alarm";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AlarmProvider>(
      create: (context) => AlarmProvider(),
      child: const AlarmScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmProvider>(
      builder: (context, provider, child) {
        return StackedLoader(
          loading: provider.loader,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              body: Column(
                children: [
                  /// Custom AppBar
                  _buildAppBar(context),

                  /// TabBar with Container
                  _buildTabBarContainer(context, provider),

                  /// Vertical space
                  15.pw.spaceVertical,

                  /// Tab content
                  _buildTabContent(provider, context),

                  /// Vertical space
                  16.pw.spaceVertical,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: context.l10n?.alarm ?? "",
      centerTitle: true,
      showBackBtn: false,
    );
  }

  Widget _buildTabBarContainer(BuildContext context, AlarmProvider provider) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.pw),
      color: ColorRes.white,
      child: Material(
        color: ColorRes.transparent,

        child: Column(
          children: [
            TabBar(
              padding: EdgeInsets.zero,
              isScrollable: false,
              indicatorColor: ColorRes.primaryColor,
              labelColor: ColorRes.primaryColor,
              unselectedLabelColor: ColorRes.darkGrey,
              labelStyle: styleW600S14.copyWith(color: ColorRes.darkGrey),
              unselectedLabelStyle: styleW500S14.copyWith(
                color: ColorRes.darkGrey,
              ),
              dividerColor: ColorRes.white,
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.circular(20.pw),
                borderSide: BorderSide(color: ColorRes.transparent, width: 0.0),
              ),
              tabs: [
                Tab(text: context.l10n?.all),
                Tab(text: context.l10n?.going),
                Tab(text: context.l10n?.recovered),
              ],
              onTap: provider.changeTab,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(AlarmProvider provider, BuildContext context) {
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
