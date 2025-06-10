import 'package:qbits/qbits.dart';
import 'package:qbits/screens/collector/collector/collector_provider.dart';
import 'package:qbits/screens/collector/collector/tab_screen/architecture_widget.dart';
import 'package:qbits/screens/collector/collector/tab_screen/parameter_collector_widget.dart';

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
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.l10n?.collector ?? "",
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
                    color:
                        ColorRes
                            .transparent, // your desired underline color
                    width: 2.0,
                  ),
                  insets: EdgeInsets.only(bottom: 14.ph,  left: 0),
                ),
                tabs: [
                  Tab(text: context.l10n?.parameter),
                  Tab(text: context.l10n?.architecture),
                ],

                isScrollable: true,
                tabAlignment: TabAlignment.start,
                // Set true if long labels
              ),
            ),

            /// Expanded TabBarView
            Expanded(
              child: TabBarView(
                children: [ParameterCollectorWidget(), ArchitectureWidget()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
