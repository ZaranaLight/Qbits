import 'package:qbits/qbits.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
            children: [
              ///Space
              16.ph.spaceVertical,

              ///Chart Section
              _buildChartSection(provider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChartSection(InverterProvider provider) {
    return Consumer<InverterProvider>(
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
              _buildDatePicker(provider),

              ///Space
              10.ph.spaceVertical,

              ///Energy Usage and Preference Dropdown
              _buildEnergyUsage(),

              ///divider
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              ///Space
              6.ph.spaceVertical,

              ///Preference Dropdown
              _buildPreferenceDropdown(provider),

              ///Space
              10.ph.spaceVertical,

              ///kWh Label
              _buildKWhLabel(),

              ///Space
              6.ph.spaceVertical,

              /// Chart
              _buildChart(provider),

              /// Space
              15.ph.spaceVertical,

              /// Chart Legend
              _buildChartLegend(provider),

              /// Space
              15.ph.spaceVertical,
            ],
          ),
        );
      },
    );
  }

  Widget _buildChartTabs(InverterProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            provider.tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final tab = entry.value;
              final isSelected = provider.selectedIndex == index;

              return InkWell(
                onTap: () => provider.selectTab(index),
                child: AnimatedSwitcher(
                  duration: 250.milliseconds,
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.bounceIn,
                        ),
                      ),
                      child: child,
                    );
                  },
                  child: Container(
                    key: ValueKey(isSelected),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 6,
                    ),
                    child: Text(
                      tab,
                      style: styleW700S16.copyWith(
                        color:
                            isSelected
                                ? ColorRes.primaryColor
                                : ColorRes.black.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildDatePicker(InverterProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap:
            () => _showDatePicker(navigatorKey.currentState!.context, provider),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.pw),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Navigation Arrows
              _buildNavigationArrow(
                onTap: () {
                  switch (provider.viewType) {
                    case ChartViewType.day:
                      provider.updateDate(
                        provider.selectedDate.subtract(const Duration(days: 1)),
                      );
                      break;
                    case ChartViewType.month:
                      provider.updateDate(
                        DateTime(
                          provider.selectedDate.year,
                          provider.selectedDate.month - 1,
                        ),
                      );
                      break;
                    case ChartViewType.year:
                      provider.updateDate(
                        DateTime(provider.selectedDate.year - 1, 1),
                      );
                      break;
                    case ChartViewType.total:
                      // No-op
                      break;
                  }
                },
                icon: AssetRes.leftArrowIcon2,
              ),

              /// Date Display
              Row(
                children: [
                  Text(provider.displayDate, style: styleW600S16),
                  4.pw.spaceHorizontal,
                  SvgAsset(imagePath: AssetRes.calenderIcon, height: 16.ph),
                ],
              ),

              /// Navigation Arrows
              _buildNavigationArrow(
                onTap: () {
                  switch (provider.viewType) {
                    case ChartViewType.day:
                      provider.updateDate(
                        provider.selectedDate.add(const Duration(days: 1)),
                      );
                      break;
                    case ChartViewType.month:
                      provider.updateDate(
                        DateTime(
                          provider.selectedDate.year,
                          provider.selectedDate.month + 1,
                        ),
                      );
                      break;
                    case ChartViewType.year:
                      provider.updateDate(
                        DateTime(provider.selectedDate.year + 1, 1),
                      );
                      break;
                    case ChartViewType.total:
                      // You might choose to do nothing or refresh
                      break;
                  }
                },
                icon: AssetRes.rightArrowIcon2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDatePicker(
    BuildContext context,
    InverterProvider provider,
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
        child: SvgAsset(imagePath: icon),
      ),
    );
  }

  Widget _buildEnergyUsage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Energy',
            style: styleW400S17.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),
          Text(
            '15.4 kWh',
            style: styleW600S17.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreferenceDropdown(InverterProvider provider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.pw),
        color: ColorRes.primaryColor.withValues(alpha: 0.1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<String>(
        elevation: 1,
        padding: EdgeInsets.zero,
        isDense: true,
        hint: Text("Preference", style: styleW500S14),
        isExpanded: false,
        underline: const SizedBox(),
        items:
            provider.preferenceOptions.map((value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
        onChanged: (newValue) {
          if (newValue != null) provider.updateSelectedPreference(newValue);
        },
      ),
    );
  }

  Widget _buildKWhLabel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text('kWh', style: styleW400S12),
    );
  }

  Widget _buildChart(InverterProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 200.pw,
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 10,
            minY: 0,
            maxY: 20,
            lineBarsData: [
              LineChartBarData(
                spots: provider.chartData,
                isCurved: true,
                barWidth: 2,
                isStrokeCapRound: true,
                color: ColorRes.primaryColor,
                belowBarData: BarAreaData(
                  show: true,
                  color: ColorRes.primaryColor.withValues(alpha: 0.2),
                ),
                dotData: const FlDotData(show: false),
              ),
            ],
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 2,
                  getTitlesWidget:
                      (value, meta) => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          value.toStringAsFixed(0),
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 10,
                  getTitlesWidget:
                      (value, meta) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          value.toInt().toString(),
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                ),
              ),
            ),
            gridData: const FlGridData(show: true),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: ColorRes.black.withValues(alpha: 0.2)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChartLegend(InverterProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10.pw,
            height: 10.pw,
            decoration: BoxDecoration(
              color: ColorRes.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          /// Space
          6.pw.spaceHorizontal,

          Text(provider.selectedPreference, style: styleW600S14),
        ],
      ),
    );
  }
}
