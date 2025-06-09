import 'package:qbits/qbits.dart';
import 'package:qbits/screens/inverter/inverter_tabs_screens/basic_screen.dart';

class InverterScreen extends StatelessWidget {
  const InverterScreen({super.key});

  static const routeName = "inverter";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<InverterProvider>(
      create: (c) => InverterProvider(),
      child: InverterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.l10n?.inverter ?? "",
          actions: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(5.pw),
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
                    labelStyle: styleW600S16.copyWith(color: ColorRes.darkGrey),
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
                      Tab(text: context.l10n?.basic),
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
                children: [
                  ParameterScreen(),
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
  }
}
