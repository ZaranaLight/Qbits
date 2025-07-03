 import 'package:qbits/qbits.dart';
import 'package:qbits/screens/collector/collector/widget/bottom_sheet_dialog_widget.dart';
import 'package:qbits/screens/collector/collector/widget/more_option_widget.dart';

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
              actions: [const MoreOptionsPopup()],
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
                        backgroundColor: ColorRes.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.pw),
                        ),
                        onPressed: () {
                          DeviceTypeBottomSheet.show(context);
                        },
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
