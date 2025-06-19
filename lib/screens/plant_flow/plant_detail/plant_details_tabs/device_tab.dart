import 'package:qbits/qbits.dart';

class DeviceTab extends StatelessWidget {
  const DeviceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantDetailProvider>(
      builder: (context, provider, _) {
        return Container(
          decoration: BoxDecoration(color: ColorRes.white),
          margin: EdgeInsets.only(top: 16.pw),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool showBoth = constraints.maxWidth > 600;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Space between TabBar and content
                  _buildTabSelector(context, provider),

                  /// Tab content
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.easeIn,
                      transitionBuilder: (child, animation) {
                        final offsetAnimation = Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: Offset.zero,
                        ).animate(animation);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                      switchOutCurve: Curves.easeInOut,
                      child:
                          provider.deviceTabIndex == 0
                              ? InverterWidget(
                                key: ValueKey(context.l10n?.inverter ?? ""),
                              )
                              : CollectorWidget(
                                key: ValueKey(context.l10n?.collector ?? ""),
                              ),

                    ),
                  ),

                  // Floating + Button
                  if (!showBoth && provider.deviceTabIndex == 1)
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
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTabSelector(BuildContext context, PlantDetailProvider provider) {
    return Row(
      children: [
        _tabItem(context, provider, 0, context.l10n?.inverter ?? ""),
        _tabItem(context, provider, 1, context.l10n?.collector ?? ""),
      ],
    );
  }

  Widget _tabItem(
    BuildContext context,
    PlantDetailProvider provider,
    int idx,
    String label,
  ) {
    final selected = provider.deviceTabIndex == idx;
    return Material(
      color: ColorRes.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(5.pw),
        onTap: () => provider.changeDeviceTabTo(idx),
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.pw,
            right: 16.pw,
            top: 15.pw,
            bottom: 14.pw,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Text
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style:
                    selected
                        ? styleW500S16.copyWith(color: ColorRes.primaryColor)
                        : styleW500S16.copyWith(
                          color: ColorRes.black.withValues(alpha: 0.5),
                        ),
                child: Text(label),
              ),

              /// Space between text and underline
              4.pw.spaceVertical,

              /// Underline
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: 2,
                width: selected ? 60.pw : 0,
                decoration: BoxDecoration(
                  color: ColorRes.primaryColor,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
