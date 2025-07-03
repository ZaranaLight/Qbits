import 'package:qbits/qbits.dart';

class AlarmListWidget extends StatelessWidget {
  final String? alarmType;

  const AlarmListWidget({super.key, this.alarmType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.pw),
        color: ColorRes.white,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
        vertical: 8.ph,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Alarm Name
                    Expanded(
                      child: Text(
                        'Loram ispam dummy text',
                        style: styleW500S14,
                      ),
                    ),

                    20.pw.spaceHorizontal,

                    ///Alarm Status
                    Expanded(
                      child: Text(
                        alarmType.toString(),
                        textAlign: TextAlign.right,
                        style: styleW600S14.copyWith(
                          color: ColorRes.primaryColor,
                        ),
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

              Padding(
                padding: EdgeInsets.all(12.pw),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Alarm Name
                    Text('ASP-15KTLCASP-15KTLC', style: styleW600S14),

                    ///Space
                    4.ph.spaceVertical,

                    ///Alarm Description
                    Text(
                      'Phace C voltage is too low Phace B voltage is too low Phace A voltage is',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    ///Horizontal space
                    20.pw.spaceHorizontal,

                    ///Alarm Date and Time
                    Expanded(
                      child: Text(
                        getFormattedDateTime(),
                        textAlign: TextAlign.right,
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
