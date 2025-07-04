import 'package:qbits/qbits.dart';
import 'package:qbits/screens/inverter/widget/hybrid_parameter_widgets/remote_control_grid_set_widget.dart';

class HybridParameterScreen extends StatelessWidget {
  const HybridParameterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterProvider>(
      builder: (context, provider, child) {
        return CustomListView(
          itemCount: provider.hybridParameterTitles.length,
          padding: EdgeInsets.only(
            bottom: Constants.safeAreaPadding.bottom + 20.ph,
          ),
          separatorBuilder:
              (context, index) => Container(
            width: double.infinity,
            height: 0,
            color: ColorRes.black.withValues(alpha: 0.1),
          ),
          itemBuilder: (context, index) => _buildExpansionTile(provider, index),
        );
      },
    );
  }
}

Widget _buildExpansionTile(InverterProvider provider, int index) {
  /// List of widgets to display for each hybrid parameter
  final List<Widget> hybridParameterContent = [
    SolarDataTable(),
    BackUpWidget(),
    HybridInverterWidget(),
    BatteryWidget(),
    RemoteControlGridSetWidget(),
    MeterWidget(),
    SystemWidget(),
    SystemWidget(),
    SystemWidget(),
    MeterWidget(),
    BackUpWidget(),
  ];

  /// Check if the index is within the bounds of the content list
  final isExpanded = provider.expandedIndex == index;

  /// If the index is out of bounds, return an empty container
  return Column(
    children: [
      ///Space before the tile
      16.ph.spaceVertical,

      /// Expansion Tile Header
      Container(
        margin: EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
        color: ColorRes.white,
        child: Material(
          color: ColorRes.transparent,
          child: InkWell(
            onTap: () => provider.toggleExpanded(index),
            child: Padding(
              padding: EdgeInsets.all(12.pw),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      provider.hybridParameterTitles[index],
                      style: styleW700S16,
                    ),
                  ),
                  AnimatedRotation(
                    duration: const Duration(milliseconds: 300),
                    turns: isExpanded ? 0.5 : 0,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: ColorRes.black.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      /// Animated content for the expansion tile
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return SizeTransition(sizeFactor: animation, child: child);
        },
        child:
            isExpanded
                ? SizedBox(
                  key: const ValueKey('expanded'),
                  width: 100.h,
                  child: hybridParameterContent[index],
                )
                : const SizedBox(key: ValueKey('collapsed'), height: 0),
      ),
    ],
  );
}
