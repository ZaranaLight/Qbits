import 'package:qbits/common/widget/app_alert_dialog.dart';
import 'package:qbits/qbits.dart';
import 'package:qbits/screens/collector/collector/collector_provider.dart';
import 'package:qbits/screens/collector/collector/tab_screen/architecture_widget.dart';
import 'package:qbits/screens/collector/collector/tab_screen/parameter_collector_widget.dart';
import 'package:qbits/screens/collector/edit_collector/edit_collector_screen.dart';

class CollectorScreen extends StatelessWidget {
  const CollectorScreen({super.key});

  static const routeName = "collector";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<CollectorProvider>(
      create: (c) => CollectorProvider(),
      child: CollectorScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer<CollectorProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: CustomAppBar(
              title: context.l10n?.collector ?? "",
              actions: [
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
                            /// Edit
                            InkWell(
                              onTap: () {
                                context.navigator.pop();
                                context.navigator.pushNamed(
                                  EditCollectorScreen.routeName,
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
                  child: TabBar(
                    indicatorColor: ColorRes.primaryColor,
                    labelColor: ColorRes.primaryColor,
                    unselectedLabelColor: ColorRes.black,
                    labelStyle: styleW600S16.copyWith(color: ColorRes.darkGrey),
                    unselectedLabelStyle: styleW500S16.copyWith(
                      color: ColorRes.black,
                    ),
                    dividerColor: ColorRes.white,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: ColorRes.transparent,
                        // your desired underline color
                        width: 2.0,
                      ),
                      insets: EdgeInsets.only(bottom: 14.ph, left: 0),
                    ),
                    tabs: [
                      Tab(text: context.l10n?.parameter),
                      Tab(text: context.l10n?.architecture),
                    ],

                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    onTap: provider.changeDeviceTabTo,
                    // Set true if long labels
                  ),
                ),

                /// Expanded TabBarView
                Expanded(
                  child: TabBarView(
                    children: [
                      ParameterCollectorWidget(),
                      ArchitectureWidget(),
                    ],
                  ),
                ),

                if (provider.deviceTabIndex == 1)
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16,
                      right: 16,
                      bottom: Constants.safeAreaPadding.bottom + 16.pw,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: FloatingActionButton(
                        backgroundColor: ColorRes.green2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.pw),
                        ),
                        onPressed:
                            () => context.navigator.pushNamed(
                              AddCollectorScreen.routeName,
                            ),
                        child: SvgAsset(imagePath: AssetRes.plusIcon),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
