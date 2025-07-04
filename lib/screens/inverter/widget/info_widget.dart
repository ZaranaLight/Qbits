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
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: Constants.horizontalPadding,
            ),
            child: Column(
              spacing: 4,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Text",
                        textAlign: TextAlign.center,
                        style: styleW600S14.copyWith(
                          color: ColorRes.black.withValues(alpha: 0.5),
                        ),
                      ),
                    ),
                    6.pw.spaceHorizontal,
                    Expanded(
                      child: Center(
                        child: Text(
                          "Voltage(V)",
                          textAlign: TextAlign.center,
                          style: styleW600S14.copyWith(
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ),
                    6.pw.spaceHorizontal,
                    Expanded(
                      child: Center(
                        child: Text(
                          "Current(A)",
                          textAlign: TextAlign.center,
                          style: styleW600S14.copyWith(
                            color: ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
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
                      vertical: 2.pw,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              item.text,
                              style: styleW500S14.copyWith(
                                color: ColorRes.black,
                              ),
                            ),
                          ),
                        ),
                        6.pw.spaceHorizontal,
                        Expanded(
                          child: Center(
                            child: Text(
                              item.voltage,
                              textAlign: TextAlign.justify,
                              style: styleW500S14.copyWith(color: ColorRes.black),
                            ),
                          ),
                        ),
                        6.pw.spaceHorizontal,

                        Expanded(
                          child: Center(
                            child: Text(
                              item.current,
                              textAlign: TextAlign.right,
                              style: styleW500S14.copyWith(color: ColorRes.black),
                            ),
                          ),
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
