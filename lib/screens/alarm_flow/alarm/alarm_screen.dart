import 'package:qbits/qbits.dart';
import 'package:qbits/screens/alarm_flow/alarm/widget/alarm_list_widget.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  static const routeName = "alarm";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AlarmProvider>(
      create: (c) => AlarmProvider(),
      child: AlarmScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmProvider>(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Column(
              children: [
                /// Custom AppBar
                CustomAppBar(
                  title: context.l10n?.alarm ?? "",
                  centerTitle: true,
                  showBackBtn: false,
                ),

                /// TabBar Container
                Container(
                  padding: EdgeInsets.only(
                    right: 14.pw,
                    top: 0.ph,
                    left: 14.pw,
                  ),
                  color: ColorRes.white,
                  child: Column(
                    children: [
                      /// TabBar
                      TabBar(
                        padding: EdgeInsets.zero,
                        isScrollable: false,

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
                                    .transparent, // your desired underline color
                            width: 0.0,
                          ),
                        ),
                        tabs: [
                          Tab(text: context.l10n?.all),
                          Tab(text: context.l10n?.going),
                          Tab(text: context.l10n?.recovered),
                        ],
                        onTap: context.read<AlarmProvider>().changeTab,
                      ),

                      /* /// Expanded TabBarView
                      TabBarView(
                        children: [
                          CustomListView(
                            itemCount: 10,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (p0, p1) => AlarmListWidget(),
                          ),


                        ],
                      ),*/
                    ],
                  ),
                ),

                ///space
                15.pw.spaceVertical,

                /// TabBarView
                Expanded(
                  child: Builder(
                    builder: (context) {
                      switch (provider.selectedIndex) {
                        case 0:
                          return CustomListView(
                            itemCount: 10,
                            separatorBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.pw),
                                width: double.infinity,
                              );
                            },
                            shrinkWrap: true,
                            itemBuilder:
                                (p0, p1) => AlarmListWidget(
                                  alarmType: context.l10n?.all,
                                ),
                          );
                        case 1:
                          return CustomListView(
                            itemCount: 10,
                            separatorBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.pw),
                                width: double.infinity,
                              );
                            },
                            shrinkWrap: true,
                            itemBuilder:
                                (p0, p1) => AlarmListWidget(
                                  alarmType: context.l10n?.going,
                                ),
                          );
                        case 2:
                          return CustomListView(
                            itemCount: 10,
                            separatorBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.pw),
                                width: double.infinity,
                              );
                            },
                            shrinkWrap: true,
                            itemBuilder:
                                (p0, p1) => AlarmListWidget(
                                  alarmType: context.l10n?.recovered,
                                ),
                          );
                        default:
                          return const Center(child: Text('Invalid Tab'));
                      }
                    },
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
