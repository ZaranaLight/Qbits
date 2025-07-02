import 'package:qbits/qbits.dart';

class ArchitectureWidget extends StatelessWidget {
  const ArchitectureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.pw),
      child: CustomSingleChildScroll(
        padding: EdgeInsets.only(
          bottom: Constants.safeAreaPadding.bottom + 20.pw,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: ColorRes.white),
              padding: EdgeInsets.only(
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
                top: Constants.horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    context.l10n?.device ?? "",
                    style: styleW500S16.copyWith(
                      color: ColorRes.black.withValues(alpha: 0.6),
                    ),
                  ),

                  /// Space
                  14.ph.spaceVertical,

                  /// First Row
                  Divider(
                    color: ColorRes.black.withValues(alpha: 0.1),
                    height: 0.5,
                  ),
                ],
              ),
            ),
            _buildInverterDataWidget(context),
          ],
        ),
      ),
    );
  }

  _buildInverterDataWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorRes.white),
      padding: EdgeInsets.only(
        left: Constants.horizontalPadding,
        right: Constants.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Space
          14.ph.spaceVertical,

          /// Device Name
          Text(context.l10n?.inverter ?? "", style: styleW600S16),

          /// Space
          14.ph.spaceVertical,

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n?.production ?? "",
                      style: styleW400S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),

                    /// Space
                    8.ph.spaceVertical,

                    /// Production Value
                    Text("0kW", style: styleW700S14),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n?.dataEnergy ?? "",
                      style: styleW400S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),

                    /// Space
                    8.ph.spaceVertical,

                    /// Production Value
                    Text("0kWh", style: styleW700S14),
                  ],
                ),
              ),
            ],
          ),

          /// Space
          14.ph.spaceVertical,
        ],
      ),
    );
  }
}
