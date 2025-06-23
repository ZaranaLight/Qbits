import 'package:qbits/qbits.dart';

class CircularChartContainer extends StatelessWidget {
  const CircularChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.ph, horizontal: 20.pw),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 40.pw,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Left Side Column
          Column(
            children: [
              // Circular Chart
              CircularPercentIndicator(
                radius: 45,
                lineWidth: 7,
                backgroundWidth: 7,
                animation: true,
                reverse: false,
                circularStrokeCap: CircularStrokeCap.round,
                percent: 0.24,
                center: Text("0.24%", style: styleW400S12),
                progressBorderColor: ColorRes.primaryColor,
                progressColor: ColorRes.primaryColor,
                backgroundColor: ColorRes.black.withValues(alpha: 0.06),
              ),

              /// Space
              45.ph.spaceVertical,

              _columnText(
                title: context.l10n?.dailyProduction ?? "",
                value: "1.06 MWh",
              ),

              /// Space
              20.ph.spaceVertical,

              _columnText(
                title: context.l10n?.yearlyProduction ?? "",
                value: "321.83 MWh",
              ),

              /// Text
            ],
          ),

          /// Right Side Column
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _columnText(
                  title: context.l10n?.totalProductionPower ?? "",
                  value: "0.00 KW",
                ),

                /// Space
                20.ph.spaceVertical,
                _columnText(
                  title: context.l10n?.installCapacity ?? "",
                  value: "857.65 KW",
                ),

                /// Space
                20.ph.spaceVertical,
                _columnText(
                  title: context.l10n?.monthlyProduction ?? "",
                  value: "26.02 MWh",
                ),

                /// Space
                20.ph.spaceVertical,
                _columnText(
                  title: context.l10n?.totalProduction ?? "",
                  value: "1.66 GWh",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _columnText({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title Text
        Text(title, style: styleW500S16.copyWith(color: ColorRes.black.withValues(alpha: 0.6))),

        /// Space
        4.ph.spaceVertical,

        /// Value Text
        RichText(
          text: TextSpan(
            children: [
              // Before the dot
              TextSpan(
                text: value.contains('.') ? '${value.split('.')[0]}.' : value,
                style: styleW600S16,
              ),

              // After the dot
              if (value.contains('.'))
                TextSpan(
                  text: value.substring(value.indexOf('.') + 1),
                  style: styleW400S16.copyWith(
                    color: ColorRes.black.withValues(alpha: 0.7),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
