import 'package:qbits/qbits.dart';

class HybridParameterScreen extends StatelessWidget {
  const HybridParameterScreen({super.key});

  static const routeName = "hybrid_parameter";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InverterProvider(),
      child: const HybridParameterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              bottom: Constants.safeAreaPadding.bottom + 20.pw,
            ),
            child: _buildInverterList(provider),
          ),
        );
      },
    );
  }
}

Widget _buildInverterList(InverterProvider provider) {
  return CustomListView(
    itemCount: provider.hybridParameterTitles.length,
    shrinkWrap: true,
    physics: BouncingScrollPhysics(),

    separatorBuilder:
        (context, index) => Container(
          width: double.infinity,
          height: 0,
          color: ColorRes.black.withValues(alpha: 0.1),
        ),
    itemBuilder: (context, index) => _buildExpansionTile(provider, index),
  );
}

Widget _buildExpansionTile(InverterProvider provider, int index) {
  final isExpanded = provider.expandedIndex == index;
  return Column(
    children: [
      ///Space before the tile
      16.pw.spaceVertical,

      Container(
        margin: EdgeInsets.symmetric(horizontal: 14.pw),

        color: ColorRes.white,
        child: Material(
          color: ColorRes.transparent,
          child: InkWell(
            onTap: () => provider.toggleExpanded(index),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.pw, vertical: 12.pw),
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
                  child: provider.hybridParameterContent[index],
                )
                : const SizedBox(key: ValueKey('collapsed'), height: 0),
      ),
    ],
  );
}
