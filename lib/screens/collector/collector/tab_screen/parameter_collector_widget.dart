import 'package:qbits/qbits.dart';

class ParameterCollectorWidget extends StatelessWidget {
  const ParameterCollectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CollectorProvider>(
      builder: (context, provider, child) {
        return CustomListView(
          itemCount: provider.collectorParameterTitle.length,

          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder:
              (context, index) => Container(
                width: double.infinity,
                height: 1,
                color: ColorRes.black.withValues(alpha: 0.1),
              ),
          itemBuilder: (context, index) => _buildExpansionTile(provider, index),
        );
      },
    );
  }

  Widget _buildExpansionTile(CollectorProvider provider, int index) {
    final isExpanded = provider.expandedIndex == index;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Divider
        isExpanded
            ? SizedBox()
            : Divider(
              color: ColorRes.black.withValues(alpha: 0.05),
              height: 0.5,
              thickness: 0.5,
            ),

        InkWell(
          onTap: () => provider.toggleExpanded(index),
          child: Container(
            decoration: BoxDecoration(
              color:
                  isExpanded
                      ? ColorRes.black.withValues(alpha: 0.05)
                      : ColorRes.white,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: Constants.horizontalPadding,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// Icon
                      Text(
                        provider.collectorParameterTitle[index],
                        style: styleW500S16,
                      ),
                    ],
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
                    child: provider.collectorParameterContent[index],
                  )
                  : const SizedBox(key: ValueKey('collapsed'), height: 0),
        ),
      ],
    );
  }
}
