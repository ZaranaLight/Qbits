import 'package:qbits/qbits.dart';
import 'package:qbits/screens/inverter/model/basic_info_model.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterProvider>(
      builder: (context, provider, child) {
        return Scaffold(body: _buildFaultList(provider));
      },
    );
  }

  Widget _buildFaultList(InverterProvider provider) {
    return CustomListView(
      itemCount: provider.basicTitles.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder:
          (context, index) => Container(
            width: double.infinity,
            height: 1,
            color: ColorRes.black.withValues(alpha: 0.1),
          ),
      itemBuilder: (context, index) => _buildExpansionTile(provider, index),
    );
  }

  Widget _buildExpansionTile(InverterProvider provider, int index) {
    final isExpanded = provider.expandedIndex == index;
    return Column(
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
                      Text(provider.basicTitles[index], style: styleW500S16),
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
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            height: isExpanded ? null : 0,
            child: isExpanded ? provider.basicContent[index] : null,
          ),
        ),
      ],
    );
  }
}

class BasicContentWidget extends StatelessWidget {
  final List<BasicInfoModel>? items;
  const BasicContentWidget({super.key,   this.items});

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterProvider>(
      builder: (context, provider, child) {
        return Container(
          color: ColorRes.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...?items?.map((item) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: Constants.horizontalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.key,
                        style: styleW600S14.copyWith(
                          color: ColorRes.black.withValues(alpha: 0.5),
                        ),
                      ),
                      Text(item.value, style: styleW600S14),
                    ],
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
