import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:qbits/qbits.dart';
import 'package:qbits/screens/plant_flow/plant_detail/widgets/slider/diagram_3_widget.dart';
import 'package:qbits/screens/plant_flow/plant_detail/widgets/slider/diagram_4_widget.dart';
import 'package:qbits/screens/plant_flow/plant_detail/widgets/slider/diagram_5_widget.dart';

class DashBoardTab extends StatelessWidget {
  const DashBoardTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> customWidgets = [
      Diagram1Widget(),
      Diagram2Widget(),
      Diagram3Widget(),
      Diagram4Widget(),
      Diagram5Widget(),
    ];

    return Consumer<PlantDetailProvider>(
      builder: (context, provider, child) {
        return CustomSingleChildScroll(
          padding: EdgeInsets.only(bottom: Constants.safeAreaPadding.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Space
              16.ph.spaceVertical,

              /// Carousel Slider
              Stack(
                children: [
                  ExpandablePageView(
                    controller: provider.pageController,
                    children: customWidgets,
                    onPageChanged:
                        (value) => provider.setPlantPageController(value),
                  ),

                  /// Dots Indicator
                  Positioned(
                    bottom: 20.ph,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        customWidgets.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width:
                              provider.plantPageControllerIndex == index
                                  ? 12.0
                                  : 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                provider.plantPageControllerIndex == index
                                    ? ColorRes.primaryColor
                                    : Colors.black.withValues(alpha: 0.1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              /// Space
              16.ph.spaceVertical,

              /// Circular Chart Container
              const DashboardCircularChartContainer(),

              /// Space
              16.ph.spaceVertical,

              ///Chart Section
              _buildChartSection(provider),

              /// Space
              50.ph.spaceVertical,
            ],
          ),
        );
      },
    );
  }

  Widget _buildChartSection(PlantDetailProvider provider) {
    return Consumer<PlantDetailProvider>(
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

  Widget _buildChartTabs(PlantDetailProvider provider) {
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
                      style:
                          isSelected
                              ? styleW700S16.copyWith(
                                color: ColorRes.primaryColor,
                              )
                              : styleW500S16.copyWith(
                                color: ColorRes.black.withValues(alpha: 0.8),
                              ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildDatePicker(PlantDetailProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Material(
        color: ColorRes.transparent,
        child: InkWell(
          onTap:
              () =>
                  _showDatePicker(navigatorKey.currentState!.context, provider),
          child: Container(
            decoration: BoxDecoration(
              color: ColorRes.black.withValues(alpha: 0.05),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavigationArrow(
                  onTap: () {
                    switch (provider.viewType) {
                      case ChartViewType.day:
                        provider.updateDate(
                          provider.selectedDate.subtract(
                            const Duration(days: 1),
                          ),
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
                  icon: AssetRes.leftArrowIcon,
                ),
                Text(provider.displayDate, style: styleW600S16),
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
    PlantDetailProvider provider,
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
    return Material(
      color: ColorRes.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SvgAsset(imagePath: icon, width: 8),
        ),
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
            style: styleW400S16.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),
          Text(
            '15.4 kWh',
            style: styleW600S16.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreferenceDropdown(PlantDetailProvider provider) {
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

  Widget _buildChart(PlantDetailProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 200.pw,
        child: BarChart(
          BarChartData(
            maxY: 20,
            barGroups: convertToBarGroups(provider.chartData),
            gridData: FlGridData(show: true),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: ColorRes.black.withValues(alpha: 0.2)),
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 10,
                  getTitlesWidget:
                      (value, _) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
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
                          provider.getXAxisLabel(value),
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

  Widget _buildChartLegend(PlantDetailProvider provider) {
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
