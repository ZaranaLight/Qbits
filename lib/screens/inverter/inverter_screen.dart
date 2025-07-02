import 'package:qbits/common/widget/app_alert_dialog.dart';
import 'package:qbits/qbits.dart';
import 'package:qbits/screens/inverter/inverter_tabs_screens/alarm_screen.dart';

class InverterScreen extends StatelessWidget {
    const InverterScreen({super.key});

  static const routeName = "inverter";

  static Widget builder(BuildContext context) {
    Map<String, dynamic> argMap = {};
    if (context.args is Map<String, dynamic>) {
      argMap = context.args as Map<String, dynamic>;
    }
    return ChangeNotifierProvider<InverterProvider>(
      create:
          (c) => InverterProvider(inverterType: argMap['inverterType'] ?? ""),
      child: InverterScreen(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<InverterProvider>(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: CustomAppBar(
              title: context.l10n?.inverter ?? "",
              actions: [
                if (provider.inverterType == "Hybrid")
                  PopupMenuButton(
                    constraints: BoxConstraints(maxWidth: 100.w),
                    offset: Offset(0, 30.ph),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      side: BorderSide(color: ColorRes.white),
                    ),
                    padding: EdgeInsets.all(12.pw),
                    color: ColorRes.white,
                    itemBuilder: (con) {
                      return [
                        PopupMenuItem(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              /// Remote Control
                              InkWell(
                                onTap: () {
                                  context.navigator.pop();
                                  context.navigator.pushNamed(
                                    RemoteControlScreen.routeName,
                                  );
                                },
                                borderRadius: BorderRadius.circular(5.pw),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.pw,
                                    horizontal: 8.pw,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ///Remote Control Icon
                                      SvgAsset(
                                        imagePath: AssetRes.plantIcon,
                                        color: ColorRes.primaryColor,
                                        width: 15.ph,
                                      ),

                                      /// Remote Control Text
                                      Text(
                                        context.l10n?.remoteControl ??
                                            "Remote Control",
                                        style: styleW500S14.copyWith(
                                          color: ColorRes.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              /// Divider
                              Divider(height: 0, color: ColorRes.lightGrey),

                              /// Edit
                              InkWell(
                                onTap: () {
                                  context.navigator.pop();
                                  context.navigator.pushNamed(
                                    EditInverterScreen.routeName,
                                  );
                                },
                                borderRadius: BorderRadius.circular(5.pw),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.pw,
                                    horizontal: 8.pw,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /// Svg Icon
                                      SvgAsset(
                                        imagePath: AssetRes.editIcon,
                                        color: ColorRes.primaryColor,
                                        width: 15.ph,
                                      ),

                                      ///Edit Text
                                      Text(
                                        context.l10n?.edit ?? "Edit",
                                        style: styleW500S14.copyWith(
                                          color: ColorRes.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              /// Divider
                              Divider(height: 0, color: ColorRes.lightGrey),

                              /// Delete
                              InkWell(
                                onTap: () {
                                  context.navigator.pop();
                                  openAppAlertDialog(
                                    context,
                                    title: 'Alert',
                                    onYesTap: () {
                                      context.navigator.pop();
                                    },
                                    subTitle:
                                        'Are you sure you want to delete this inverter?',
                                  );
                                },
                                borderRadius: BorderRadius.circular(5.pw),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.pw,
                                    horizontal: 8.pw,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [

                                      /// Svg Icon
                                      SvgAsset(
                                        imagePath: AssetRes.deleteIcon,
                                        color: ColorRes.red,
                                        width: 15.ph,
                                      ),

                                      ///Edit Text
                                      Text(
                                        context.l10n?.delete ?? "Delete",
                                        style: styleW500S14.copyWith(
                                          color: ColorRes.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                    child: Padding(
                      padding: EdgeInsets.all(16.pw),
                      child: SvgAsset(
                        imagePath: AssetRes.horizontalDots,
                        width: 24.pw,
                      ),
                    ),
                  ),
              ],
            ),
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 4.pw, left: 4.pw),
                  color: ColorRes.white,
                  child: Column(
                    children: [
                      /// TabBar
                      TabBar(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        indicatorColor: ColorRes.primaryColor,
                        labelColor: ColorRes.primaryColor,
                        unselectedLabelColor: ColorRes.black,
                        labelStyle: styleW600S16.copyWith(
                          color: ColorRes.darkGrey,
                        ),
                        unselectedLabelStyle: styleW500S16.copyWith(
                          color: ColorRes.black,
                        ),
                        dividerColor: ColorRes.white,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color:
                                ColorRes
                                    .transparent, // your desired underline color
                            width: 2.0,
                          ),
                          insets: EdgeInsets.only(bottom: 14.ph),
                        ),
                        tabs: [
                          Tab(text: context.l10n?.parameter),
                          Tab(text: context.l10n?.statistics),
                          Tab(text: context.l10n?.alerts),

                          Tab(
                            text:
                                provider.inverterType == "Hybrid"
                                    ? context.l10n?.architecture
                                    : context.l10n?.basic,
                          ),
                        ],
                        labelPadding: EdgeInsets.symmetric(horizontal: 0.pw),

                        isScrollable: false,
                        // Set true if long labels
                      ),
                    ],
                  ),
                ),

                /// Expanded TabBarView
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      provider.inverterType == "Hybrid"
                          ? HybridParameterScreen()
                          : ParameterScreen(),
                      StatisticsScreen(),
                      InverterAlarmListScreen(),
                      BasicScreen(),
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
}
