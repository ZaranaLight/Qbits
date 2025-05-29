import 'package:qbits/qbits.dart';

class BarChartContainer extends StatelessWidget {
  const BarChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.ph, horizontal: 20.pw),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          /// Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Month : 26.0K (kwh)",
                style: styleW600S20.copyWith(
                  color: ColorRes.black.withValues(alpha: 70),
                ),
              ),

              /// Forward Icon
              SvgAsset(imagePath: AssetRes.forwardIcon,color: ColorRes.black.withValues(alpha: 0.3),),

            ],
          ),

          /// Space
          30.ph.spaceVertical,

          /// Bar Chart
          AspectRatio(
            aspectRatio: 1.6,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                groupsSpace: 6, // Adjust spacing between bars
                maxY: 6000,
                barTouchData: BarTouchData(enabled: false),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 2000,
                  getDrawingHorizontalLine:
                      (value) => FlLine(
                        color: Colors.grey.withValues(alpha: 0.3),
                        strokeWidth: 1,
                      ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        final labels = {
                          0: '1',
                          1: '3',
                          2: '5',
                          3: '7',
                          4: '9',
                          5: '11',
                        };
                        return Text(
                          labels[value.toInt()] ?? '',
                          style: TextStyle(fontSize: 12),
                        );
                      },
                      interval: 1,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 2000,
                      getTitlesWidget:
                          (value, meta) => Text(
                            '${(value / 1000).toStringAsFixed(0)}k',
                            style: TextStyle(fontSize: 12),
                          ),
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: 4000,
                        width: 5,
                        color: ColorRes.primaryColor,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: 5200,
                        width: 5,
                        color: ColorRes.primaryColor,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 3600,
                        width: 5,
                        color: ColorRes.primaryColor,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(
                        toY: 2900,
                        width: 5,
                        color: ColorRes.primaryColor,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(
                        toY: 4100,
                        width: 5,
                        color: ColorRes.primaryColor,
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 5,
                    barRods: [
                      BarChartRodData(
                        toY: 5100,
                        width: 5,
                        color: ColorRes.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
