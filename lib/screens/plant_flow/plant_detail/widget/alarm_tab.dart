import 'package:qbits/qbits.dart';
import 'package:qbits/screens/alarm_flow/alarm/widget/alarm_list_widget.dart';

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
      child: Column(
        children: [
          SizedBox(
            height: 35.pw,
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
              splashBorderRadius: BorderRadius.circular(20),
              indicator: BoxDecoration(
                color: ColorRes.transparent,
                borderRadius: BorderRadius.circular(20.pw),
                shape: BoxShape.rectangle,
              ),

              labelPadding: EdgeInsets.symmetric(horizontal: 8.pw),
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(20.pw),
                    ),
                    child: Center(child: Text(context.l10n?.all ?? "")),
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
                    child: Center(child: Text(context.l10n?.recovered ?? "")),
                  ),
                ),
              ],
              onTap: provider.changeAlarmTab,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(PlantDetailProvider provider, BuildContext context) {
    return Expanded(
      child: IndexedStack(
        index: provider.selectedAlarmIndex,
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

  Widget _buildAlarmListView(
    int itemCount,
    String alarmType,
    BuildContext context,
  ) {
    return CustomListView(
      itemCount: itemCount,
      separatorBuilder:
          (context, index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 20.pw),
            width: double.infinity,
          ),
      itemBuilder: (context, index) => AlarmListWidget(alarmType: alarmType),
    );
  }
}
