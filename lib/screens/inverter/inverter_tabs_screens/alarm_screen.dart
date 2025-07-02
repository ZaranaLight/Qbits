import 'package:qbits/qbits.dart';
import 'package:qbits/screens/inverter/widget/alerts_list_widget.dart';

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
              (context, index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 20.pw),
                width: double.infinity,
              ),
          itemBuilder:
              (context, index) => Column(
                children: [
                  AlertListWidget(alarmType: "Recovered"),
                  if (index + 1 == 10)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '---- No More Data ----',
                            style: styleW400S14.copyWith(
                              color: ColorRes.black.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
        );
      },
    );
  }
}
