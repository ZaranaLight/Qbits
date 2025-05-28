import 'package:qbits/qbits.dart';

class GuestListWidget extends StatelessWidget {
  const GuestListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(8.pw),
      ),
      child: Material(
        color: ColorRes.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8.pw),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Container(
                  width: 107.pw,
                  height: 107.pw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.pw),
                    color: ColorRes.grey3,
                  ),
                ),

                /// Space
                10.pw.spaceHorizontal,

                /// Text
                Expanded(
                  child: Column(
                    spacing: 8.pw,
                    children: [
                      _RowWidget(
                        title: context.l10n?.stationName ?? "",
                        value: "text",
                      ),
                      _RowWidget(
                        title: context.l10n?.realTimePower ?? "",
                        value: "0kW",
                      ),
                      _RowWidget(
                        title: context.l10n?.generationToday ?? "",
                        value: "0kWh",
                      ),
                      _RowWidget(
                        title: context.l10n?.cumulativeGeneration ?? "",
                        value: "542563kWh",
                      ),
                      _RowWidget(title: "Sattation name", value: "text"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RowWidget extends StatelessWidget {
  final String? title;
  final String? value;

  const _RowWidget({this.value, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title ?? "", style: styleW500S12)),
        Text(
          value ?? "",
          textAlign: TextAlign.end,
          style: styleW500S12.copyWith(color: ColorRes.black),
        ),
      ],
    );
  }
}
