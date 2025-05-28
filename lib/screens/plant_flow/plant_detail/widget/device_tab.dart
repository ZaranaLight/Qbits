import 'package:qbits/qbits.dart';

class DeviceTab extends StatelessWidget {
  const DeviceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSingleChildScroll(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Space between tabs and content
          16.ph.spaceVertical,

          DashboardCircularChartContainer(),

          /// Space between buttons and content
          16.ph.spaceVertical,

          /// Space
          20.ph.spaceVertical,
        ],
      ),
    );
  }
}
