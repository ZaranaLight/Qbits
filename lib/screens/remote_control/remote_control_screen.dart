import 'package:qbits/qbits.dart';

class RemoteControlScreen extends StatelessWidget {
  const RemoteControlScreen({super.key});

  static const routeName = "remote_control";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<RemoteControlProvider>(
      create: (c) => RemoteControlProvider(),
      child: RemoteControlScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteControlProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: CustomAppBar(title: context.l10n?.remoteControl),

          body: _buildInverterList(provider),
        );
      },
    );
  }

  Widget _buildInverterList(RemoteControlProvider provider) {
    return CustomListView(
      itemCount: provider.remoteControlTitle.length,
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

  Widget _buildExpansionTile(RemoteControlProvider provider, int index) {
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
                      Text(
                        provider.remoteControlTitle[index],
                        style: styleW600S16,
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
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            height: isExpanded ? null : 0,
            child: isExpanded ? provider.remoteControlContent[index] : null,
          ),
        ),
      ],
    );
  }
}
