import 'package:qbits/qbits.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const routeName = "dashboard";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<DashboardProvider>(
      create: (c) => DashboardProvider(),
      child: DashboardScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: ColorRes.lightGrey2,
          body: Builder(
            builder: (context) {
              switch (state.pageIndex) {
                case 0:
                  return HomeScreen.builder(context);
                case 1:
                  return PlantScreen.builder(context);
                case 2:
                  return AlarmScreen.builder(context);
                case 3:
                  return ProfileScreen.builder(context);
                default:
                  return HomeScreen.builder(context);
              }
            },
          ),
          bottomNavigationBar: _BottomBar(),
        );
      },
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 9.pw, vertical: 5.ph),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: ColorRes.black2.withValues(alpha: 0.08),
            offset: Offset(0, -4),
            blurRadius: 30,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constrains) {
          return Stack(
            children: [
              Row(
                children: [
                  buildNavItem(AssetRes.homeIcon, context.l10n?.dashboard, 0),
                  buildNavItem(AssetRes.plantIcon, context.l10n?.plant, 1),
                  buildNavItem(AssetRes.alarmIcon, context.l10n?.alarm, 2),
                  buildNavItem(
                    AssetRes.profileIcon,
                    context.l10n?.userCenter,
                    3,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildNavItem(String image, String? text, int index) {
    return Selector<DashboardProvider, int>(
      selector: (con, provider) => provider.pageIndex,
      builder: (context, state, child) {
        bool isSelected = index == state;
        return Expanded(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:
                  () => context.read<DashboardProvider>().onPageChanged(index),
              borderRadius: BorderRadius.circular(5.pw),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Space
                    10.ph.spaceVertical,
                    AnimatedCrossFade(
                      firstChild: SvgAsset(
                        imagePath: image,
                        height: 24.pw,
                        color: ColorRes.lightGreen,
                      ),
                      secondChild: SvgAsset(imagePath: image, height: 24.pw),
                      crossFadeState:
                          isSelected
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                      duration: 300.milliseconds,
                    ),

                    /// Space
                    6.ph.spaceVertical,

                    AnimatedDefaultTextStyle(
                      style:
                          isSelected
                              ? styleW700S10.copyWith(
                                color: ColorRes.primaryColor,
                              )
                              : styleW700S10,
                      duration: 300.milliseconds,
                      child: Text(text ?? ""),
                    ),

                    /// Space
                    6.ph.spaceVertical,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
