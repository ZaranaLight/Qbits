import 'package:qbits/qbits.dart';

class AlarmListViewWrapper extends StatelessWidget {
  final int itemCount;
  final String alarmTypeKey;

  const AlarmListViewWrapper({
    super.key,
    required this.itemCount,
    required this.alarmTypeKey,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      itemCount: itemCount,
      separatorBuilder:
          (context, index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 20.pw),
            width: double.infinity,
          ),
      itemBuilder: (context, index) => AlarmListWidget(alarmType: alarmTypeKey),
    );
  }
}
