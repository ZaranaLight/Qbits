import 'package:carousel_slider/carousel_slider.dart';
import 'package:qbits/common/widget/column_with_rich_text.dart';
import 'package:qbits/qbits.dart';

class DashBoardTab extends StatelessWidget {
  const DashBoardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> customWidgets = [
      SizedBox(
        width: double.infinity,
        child: Image.asset(AssetRes.tempSolarDiagramImg),
      ),
      Container(
        width: double.infinity,
        color: ColorRes.white,
        padding: EdgeInsets.all(16.ph),
        height: 200,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.dailyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.monthlyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),

                    /// Space
                    24.ph.spaceVertical,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.dailyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.monthlyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),
                  ],
                ),
                SvgAsset(imagePath: AssetRes.greenSolarPlateIcon),
              ],
            ),

            /// Space
            24.ph.spaceVertical,

            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.dailyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.monthlyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),

                    /// Space
                    24.ph.spaceVertical,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.dailyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.monthlyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),
                  ],
                ),
                SvgAsset(imagePath: AssetRes.homeInZigzagIcon),
              ],
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        color: ColorRes.white,
        padding: EdgeInsets.all(16.ph),
        height: 200,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.dailyGridFeedIN ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.monthlyGridFeedIN ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),

                    /// Space
                    24.ph.spaceVertical,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.yearlyGridFeedIN ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.totalGridFeedIN ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),
                  ],
                ),
                SvgAsset(imagePath: AssetRes.greenTowerIcon),
              ],
            ),

            /// Space
            24.ph.spaceVertical,

            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.dailyEnergyPurchased ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.monthlyEnergyPurchased ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),

                    /// Space
                    24.ph.spaceVertical,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.yearlyEnergyPurchased ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.totalEnergyPurchased ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),
                  ],
                ),
                SvgAsset(imagePath: AssetRes.redTowerIcon),
              ],
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        color: ColorRes.white,
        padding: EdgeInsets.all(16.ph),
        height: 200,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.dailyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.monthlyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),

                    /// Space
                    24.ph.spaceVertical,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.dailyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.monthlyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),
                  ],
                ),
                SvgAsset(imagePath: AssetRes.greenBatteryIcon),
              ],
            ),

            /// Space
            24.ph.spaceVertical,

            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.dailyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.monthlyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),

                    /// Space
                    24.ph.spaceVertical,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: context.l10n?.dailyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: context.l10n?.monthlyGeneration ?? "",
                          value: "0.0 kwh",
                        ),
                      ],
                    ),
                  ],
                ),
                SvgAsset(imagePath: AssetRes.redBatteryIcon),
              ],
            ),
          ],
        ),
      ),
    ];
    return CustomSingleChildScroll(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Space between tabs and content
          16.ph.spaceVertical,

          CarouselSlider(
            items: customWidgets,
            options: CarouselOptions(
              height: 286.ph,
              enlargeCenterPage: false,
              autoPlay: false,
              viewportFraction: 1.0,
              // Makes each item take full width of the screen
              autoPlayInterval: Duration(seconds: 3),
            ),
          ),

          /// Space between tabs and content
          16.ph.spaceVertical,

          DashboardCircularChartContainer(),

          /// Space between tabs and content
          16.ph.spaceVertical,

          DashboardBarChartTabs(),

          /// End Space
          50.ph.spaceVertical,
        ],
      ),
    );
  }
}

//==============================================================================
class DashboardCircularChartContainer extends StatelessWidget {
  const DashboardCircularChartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.ph, horizontal: 20.pw),
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Left Side Column
          Column(
            children: [
              // Circular Chart
              CircularPercentIndicator(
                radius: 50,
                lineWidth: 7,
                backgroundWidth: 7,
                animation: true,
                reverse: false,
                circularStrokeCap: CircularStrokeCap.round,
                percent: 0.24,
                center: Text("0.24%", style: styleW400S12),
                progressBorderColor: ColorRes.primaryColor,
                progressColor: ColorRes.primaryColor,
                backgroundColor: ColorRes.black.withValues(alpha: 0.06),
              ),

              /// Space
              30.ph.spaceVertical,

              _columnText(
                title: context.l10n?.dailyProduction ?? "",
                value: "1.06 MWh",
                isCoin: true,
                coinValue: "75.6",
              ),

              /// Space
              20.ph.spaceVertical,

              _columnText(
                title: context.l10n?.yearlyProduction ?? "",
                value: "321.83 MWh",
                isCoin: true,
                coinValue: "19642.3",
              ),

              /// Text
            ],
          ),

          /// Right Side Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _columnText(
                title: context.l10n?.totalProductionPower ?? "",
                value: "0.00 KW",
                isCoin: false,
                coinValue: "0",
              ),

              /// Space
              20.ph.spaceVertical,
              _columnText(
                title: context.l10n?.installCapacity ?? "",
                value: "857.65 KW",
                isCoin: false,
                coinValue: "0",
              ),

              /// Space
              20.ph.spaceVertical,
              _columnText(
                title: context.l10n?.monthlyProduction ?? "",
                value: "26.02 MWh",
                isCoin: true,
                coinValue: "1269.1",
              ),

              /// Space
              20.ph.spaceVertical,
              _columnText(
                title: context.l10n?.totalProduction ?? "",
                value: "1.66 GWh",
                isCoin: true,
                coinValue: "371974",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _columnText({
    required String title,
    required String value,
    required bool isCoin,
    required String coinValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title Text
        Text(title, style: styleW500S16),

        /// Space
        4.ph.spaceVertical,

        /// Value Text
        RichText(
          text: TextSpan(
            children: [
              // Before the dot
              TextSpan(
                text: value.contains('.') ? '${value.split('.')[0]}.' : value,
                style: styleW600S16,
              ),

              // After the dot
              if (value.contains('.'))
                TextSpan(
                  text: value.substring(value.indexOf('.') + 1),
                  style: styleW400S16,
                ),
            ],
          ),
        ),

        /// Space
        if (isCoin) 4.ph.spaceVertical,

        /// Coin Value Text
        if (isCoin)
          Row(
            children: [
              /// Coin Value Text
              Text(
                coinValue,
                style: styleW600S14.copyWith(color: ColorRes.carrotOrange),
              ),

              /// Space
              6.ph.spaceHorizontal,

              /// Coin Icon
              SvgAsset(imagePath: AssetRes.coinIcon),
            ],
          ),
      ],
    );
  }
}

//==============================================================================

class DashboardBarChartTabs extends StatefulWidget {
  const DashboardBarChartTabs({super.key});

  @override
  State<DashboardBarChartTabs> createState() => _DashboardBarChartTabsState();
}

class _DashboardBarChartTabsState extends State<DashboardBarChartTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> tabs = ['Day', 'Month', 'Year', 'Total'];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.white,
      padding: EdgeInsets.all(Constants.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Tab Bar
          TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList(),
            labelColor: ColorRes.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: ColorRes.primaryColor,
            dividerColor: ColorRes.white,
          ),
          16.ph.spaceVertical,

          /// Tab Views
          SizedBox(
            height: 190.ph,
            child: TabBarView(
              controller: _tabController,
              children: tabs.map((e) => _buildBarChart()).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return AspectRatio(
      aspectRatio: 1.6,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          groupsSpace: 6,
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
                    style: const TextStyle(fontSize: 12),
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
                      style: const TextStyle(fontSize: 12),
                    ),
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
    );
  }
}
