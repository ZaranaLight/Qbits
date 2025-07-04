import 'package:qbits/qbits.dart';

class AlertListWidget extends StatelessWidget {
  final String? alarmType;

  const AlertListWidget({super.key, this.alarmType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.pw),
        color: ColorRes.white,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
        vertical: 8.pw,
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.pw),
        child: InkWell(
          onTap:
              () => {
                context.navigator.pushNamed(AlarmInverterScreen.routeName),
              },
          borderRadius: BorderRadius.circular(8.pw),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12.pw),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Alarm Status
                    Expanded(
                      child: Text(
                        "Loram ispam dummy text",
                        style: styleW500S14,
                      ),
                    ),

                    /// Space
                    8.pw.spaceHorizontal,

                    ///Alarm Status
                    Text(
                      alarmType ?? "",
                      textAlign: TextAlign.right,
                      style: styleW600S14.copyWith(
                        color: ColorRes.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              ///Divider
              Divider(
                height: 1.pw,
                color: ColorRes.black.withValues(alpha: 0.1),
              ),

              ///Alarm Name
              Padding(
                padding: EdgeInsets.all(12.pw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Alarm Description
                    Text(
                      'Low DC voltage',
                      style: styleW400S14.copyWith(color: ColorRes.orange2),
                    ),
                  ],
                ),
              ),

              ///Divider
              Divider(
                height: 1.pw,
                color: ColorRes.black.withValues(alpha: 0.1),
              ),

              ///Date and Time
              Padding(
                padding: EdgeInsets.all(12.pw),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Alarm Date and Time
                    Expanded(
                      child: Text(
                        getFormattedDateTime(),
                        style: styleW400S12.copyWith(
                          color: ColorRes.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),

                    /// Space
                    10.pw.spaceHorizontal,

                    ///Alarm Date and Time
                    Expanded(
                      child: Text(
                        getFormattedDateTime(),
                        textAlign: TextAlign.end,
                        style: styleW400S12.copyWith(
                          color: ColorRes.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
