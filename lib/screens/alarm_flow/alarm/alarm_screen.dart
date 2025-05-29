import 'package:qbits/qbits.dart';
import 'package:qbits/screens/alarm_flow/alarm/widget/alarm_list_widget.dart';

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
                  const SizedBox(height: 15),

                  /// Tab content
                  _buildTabContent(provider, context),
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
      child: Column(
        children: [
          TabBar(
            padding: EdgeInsets.zero,
            isScrollable: false,
            physics: const NeverScrollableScrollPhysics(),
            indicatorColor: ColorRes.primaryColor,
            labelColor: ColorRes.primaryColor,
            unselectedLabelColor: ColorRes.darkGrey,
            labelStyle: styleW600S14.copyWith(color: ColorRes.darkGrey),
            unselectedLabelStyle: styleW500S14.copyWith(color: ColorRes.darkGrey),
            dividerColor: ColorRes.white,
            indicator: const UnderlineTabIndicator(
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
    );
  }

  Widget _buildTabContent(AlarmProvider provider, BuildContext context) {
    return Expanded(
      child: IndexedStack(
        index: provider.selectedIndex,
        children: [
          // All alarms
          _buildAlarmListView(10, context.l10n?.all ?? "", context),

          // Going alarms
          _buildAlarmListView(2, context.l10n?.going ?? "", context),

          // Recovered alarms
          _buildAlarmListView(5, context.l10n?.recovered ?? "", context),
        ],
      ),
    );
  }

  Widget _buildAlarmListView(int itemCount, String alarmType, BuildContext context) {
    return CustomListView(
      itemCount: itemCount,
      separatorBuilder: (context, index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.pw),
        width: double.infinity,
      ),
      itemBuilder: (context, index) => AlarmListWidget(alarmType: alarmType),
    );
  }
}
