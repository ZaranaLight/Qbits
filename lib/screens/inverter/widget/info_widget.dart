import 'package:qbits/qbits.dart';

class ExpandableInfoSection extends StatelessWidget {
  final List<InfoRowModel>? items;

  const ExpandableInfoSection({super.key, this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 12),
            child: Column(
              spacing: 4,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Text",
                      style: styleW600S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.5),
                      ),
                    ),
                    Text(
                      "Voltage(V)",
                      style: styleW600S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.5),
                      ),
                    ),
                    Text(
                      "Current(A)",
                      style: styleW600S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),

                /// Space
                5.ph.spaceVertical,

                /// List of items
                ...?items?.map(
                  (item) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.pw,
                      vertical: 2.pw,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.text,
                          style: styleW500S14.copyWith(color: ColorRes.black),
                        ),
                        Text(
                          item.voltage,
                          style: styleW500S14.copyWith(color: ColorRes.black),
                        ),
                        Text(
                          item.current,
                          style: styleW500S14.copyWith(color: ColorRes.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
