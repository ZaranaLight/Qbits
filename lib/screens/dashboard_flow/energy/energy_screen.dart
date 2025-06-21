import 'package:qbits/qbits.dart';

class EnergyScreen extends StatelessWidget {
  const EnergyScreen({super.key});

  static const routeName = "energy_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<EnergyProvider>(
      create: (c) => EnergyProvider(),
      child: EnergyScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EnergyProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: CustomAppBar(title: context.l10n?.energy ?? ""),
          body: Column(children: [_buildChartSection(provider)]),
        );
      },
    );
  }

  Widget _buildChartSection(EnergyProvider provider) {
    return Consumer<EnergyProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 15.pw),
          decoration: const BoxDecoration(color: ColorRes.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Chart Header
              _buildChartTabs(provider),

              ///Space
              8.ph.spaceVertical,

              ///Date Picker
              _buildDatePicker(context, provider),

              ///Space
              10.ph.spaceVertical,

              ///Energy Usage and Preference Dropdown
              _buildEnergyUsage(),

              ///divider
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              ///Space
              10.ph.spaceVertical,

              /// Chart
              _buildChart(provider),

              /// Space
              15.ph.spaceVertical,
            ],
          ),
        );
      },
    );
  }

  List<BarChartGroupData> convertToBarGroups(List<FlSpot> spots) {
    return spots.map((spot) {
      return BarChartGroupData(
        x: spot.x.toInt(),
        barRods: [
          BarChartRodData(
            toY: spot.y,
            color: ColorRes.primaryColor,
            width: 12,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 20, // your maxY
              color: ColorRes.primaryColor.withValues(alpha: 0.1),
            ),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildChartTabs(EnergyProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            provider.tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final tab = entry.value;
              final isSelected = provider.selectedIndex == index;

              return Material(
                color: ColorRes.transparent,
                child: InkWell(
                  onTap: () => provider.selectTab(index),
                  borderRadius: BorderRadius.circular(5.pw),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.pw,
                          vertical: 5.pw,
                        ),
                        child: Text(
                          tab,
                          style: styleW600S16.copyWith(
                            color:
                                isSelected
                                    ? ColorRes.primaryColor
                                    : ColorRes.black.withValues(alpha: 0.5),
                          ),
                        ),
                      ),

                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        height: 2,
                        width: isSelected ? 11.w : 0,
                        // Animate width
                        color: ColorRes.primaryColor,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context, EnergyProvider provider) {
    return Material(
      color: ColorRes.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: InkWell(
          onTap: () => _showDatePicker(context, provider),
          child: Container(
            decoration: BoxDecoration(
              // color: ColorRes.black.withValues(alpha: 0.05),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8.pw),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavigationArrow(
                  onTap: () => provider.previousTab(),
                  icon: AssetRes.leftArrowIcon,
                ),
                Text(provider.displayDate, style: styleW600S16),
                _buildNavigationArrow(
                  onTap: () => provider.nextTab(),
                  icon: AssetRes.rightArrowIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker(
    BuildContext context,
    EnergyProvider provider,
  ) async {
    DateTime? picked;

    switch (provider.viewType) {
      case ChartViewType.day:
        picked = await showDatePicker(
          context: context,
          initialDate: provider.selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        break;
      case ChartViewType.month:
        picked = await showDatePicker(
          context: context,
          initialDate: provider.selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          helpText: 'Pick Month',
          fieldHintText: 'YYYY-MM',
        );
        break;
      case ChartViewType.year:
        picked = await showDatePicker(
          context: context,
          initialDate: provider.selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          helpText: 'Pick Year',
          fieldHintText: 'YYYY',
        );
        break;
      case ChartViewType.total:
        // TODO: Handle this case.
        throw UnimplementedError();
    }

    if (picked != null) {
      provider.updateDate(picked);
    }
  }

  Widget _buildNavigationArrow({
    required VoidCallback onTap,
    required String icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SvgAsset(imagePath: icon, width: 8),
      ),
    );
  }

  Widget _buildEnergyUsage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(height: 17, width: 5, color: ColorRes.primaryColor),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 14.ph, top: 14.pw, left: 16.pw),
              child: RichText(
                text: TextSpan(
                  text: 'Total: ',
                  style: styleW600S14,
                  children: [
                    TextSpan(
                      text: '15.4 ',
                      style: styleW600S14.copyWith(
                        color: ColorRes.primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: 'kWh',
                      style: styleW600S14.copyWith(color: ColorRes.black2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChart(EnergyProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 450.ph,
        child: BarChart(
          BarChartData(
            maxY: 1500,
            barGroups: convertToBarGroups(provider.chartData),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 500,
              getDrawingHorizontalLine:
                  (value) => FlLine(
                    color: Colors.grey.withValues(alpha: 0.3),
                    strokeWidth: 1,
                  ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: ColorRes.black.withValues(alpha: 0.2)),
            ),

            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 500,
                  getTitlesWidget:
                      (value, _) => Padding(
                        padding: const EdgeInsets.only(right: 5, left: 0),
                        child: Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 2,
                  getTitlesWidget:
                      (value, _) => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          value.toStringAsFixed(0),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
