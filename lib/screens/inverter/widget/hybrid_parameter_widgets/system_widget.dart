import 'package:qbits/qbits.dart';

class SystemWidget extends StatelessWidget {
  const SystemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 14.pw),
      decoration: BoxDecoration(color: ColorRes.white),
      padding: EdgeInsets.symmetric(horizontal: 12.pw, vertical: 10.pw),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///System Name
          Text(
            "Date Time:",
            style: styleW400S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),

          ///Space
          8.pw.spaceVertical,

          /// Date Time Value
          Text(
            "Thu May 22 2025 13:50:52 GMT+0530 (India Standard) Time",
            style: styleW700S14,
          ),

          ///Space
          20.pw.spaceVertical,

          Row(
            children: [ColumKeyValueWidget(label: "Rated Power", value: "0W")],
          ),

          ///Space
          20.pw.spaceVertical,

          Row(
            children: [
              ColumKeyValueWidget(label: "SN", value: "0W"),
              ColumKeyValueWidget(label: "STM32:", value: "0W"),
            ],
          ),

          ///Space
          20.pw.spaceVertical,

          Row(
            children: [
              ColumKeyValueWidget(label: "DSPM:", value: "0W"),
              ColumKeyValueWidget(label: "DSPS:", value: "0W"),
            ],
          ),

          ///Space
          20.pw.spaceVertical,

          Row(
            children: [
              ColumKeyValueWidget(label: "CPLD:", value: "0W"),
              ColumKeyValueWidget(label: "Countdown Time:", value: "0W"),
            ],
          ),
        ],
      ),
    );
  }
}
