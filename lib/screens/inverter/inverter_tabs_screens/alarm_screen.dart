import 'package:qbits/qbits.dart';

class InverterAlarmListScreen extends StatelessWidget {
  const InverterAlarmListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterProvider>(
      builder: (context, provider, child) {
        return CustomListView(
          itemCount: 10,
          padding: EdgeInsets.only(
            top: 8.pw,
            bottom: Constants.safeAreaPadding.bottom + 20.pw,
          ),
          separatorBuilder:
              (context, index) =>
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.pw),
                width: double.infinity,
              ),
          itemBuilder:
              (context, index) => AlarmListWidget(alarmType: "Remaining"),
        );
      },
    );
  }
}
