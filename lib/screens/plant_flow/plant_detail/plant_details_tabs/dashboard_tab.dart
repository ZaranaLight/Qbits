import 'package:qbits/qbits.dart';

class DashBoardTab extends StatelessWidget {
  DashBoardTab({super.key});

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> customWidgets = [
      ///Solar Diagram
      SizedBox(
        width: double.infinity,
        child: Image.asset(AssetRes.tempSolarDiagramImg),
      ),

      /// Info Containers
      _buildInfoContainer(
        context,
        iconPath: AssetRes.greenSolarPlateIcon,
        topLeftTitle: context.l10n?.dailyGeneration ?? "",
        topRightTitle: context.l10n?.monthlyGeneration ?? "",
        bottomLeftTitle: context.l10n?.dailyGeneration ?? "",
        bottomRightTitle: context.l10n?.monthlyGeneration ?? "",
      ),

      /// Info Containers
      _buildInfoContainer(
        context,
        iconPath: AssetRes.greenSolarPlateIcon,
        topLeftTitle: context.l10n?.dailyGeneration ?? "",
        topRightTitle: context.l10n?.monthlyGeneration ?? "",
        bottomLeftTitle: context.l10n?.dailyGeneration ?? "",
        bottomRightTitle: context.l10n?.monthlyGeneration ?? "",
      ),

      /// Info Containers
      _buildInfoContainer(
        context,
        iconPath: AssetRes.greenSolarPlateIcon,
        topLeftTitle: context.l10n?.dailyGeneration ?? "",
        topRightTitle: context.l10n?.monthlyGeneration ?? "",
        bottomLeftTitle: context.l10n?.dailyGeneration ?? "",
        bottomRightTitle: context.l10n?.monthlyGeneration ?? "",
      ),
    ];

    return Consumer<PlantDetailProvider>(
      builder: (context, provider, child) {
        return CustomSingleChildScroll(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Space
              16.ph.spaceVertical,

              /// Carousel Slider
              Stack(
                children: [
                  CarouselSlider(
                    items: customWidgets,
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: 286.ph,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        provider.setCurrent(index);
                      },
                      autoPlay: false,
                      viewportFraction: 1.0,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                  ),

                  /// Dots Indicator
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        customWidgets.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: provider.current == index ? 12.0 : 8.0,
                          height: 8.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                provider.current == index
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

  Widget _buildInfoContainer(
    BuildContext context, {
    required String iconPath,
    required String topLeftTitle,
    required String topRightTitle,
    required String bottomLeftTitle,
    required String bottomRightTitle,
  }) {
    return Container(
      width: double.infinity,
      color: ColorRes.white,
      padding: EdgeInsets.all(16.ph),

      child: CustomSingleChildScroll(
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
                          title: topLeftTitle,
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: topRightTitle,
                          value: "0.0 kwh",
                        ),
                      ],
                    ),
                    24.ph.spaceVertical,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: bottomLeftTitle,
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: bottomRightTitle,
                          value: "0.0 kwh",
                        ),
                      ],
                    ),
                  ],
                ),
                SvgAsset(imagePath: iconPath),
              ],
            ),

            /// Space
            12.pw.spaceVertical,

            /// Dash Icon
            SvgAsset(imagePath: AssetRes.dashIcon),

            /// Space
            12.pw.spaceVertical,

            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: topLeftTitle,
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: topRightTitle,
                          value: "0.0 kwh",
                        ),
                      ],
                    ),
                    24.ph.spaceVertical,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnWithRichText(
                          title: bottomLeftTitle,
                          value: "0.0 kwh",
                        ),
                        ColumnWithRichText(
                          title: bottomRightTitle,
                          value: "0.0 kwh",
                        ),
                      ],
                    ),
                  ],
                ),
                SvgAsset(imagePath: iconPath),
              ],
            ),
          ],
        ),
      ),
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
              8.pw.spaceVertical,

              ///Date Picker
              _buildDatePicker(provider),

              ///Space
              10.pw.spaceVertical,

              ///Energy Usage and Preference Dropdown
              _buildEnergyUsage(),

              ///divider
              Divider(color: ColorRes.black.withValues(alpha: 0.1)),

              ///Space
              6.pw.spaceVertical,

              ///Preference Dropdown
              _buildPreferenceDropdown(provider),

              ///Space
              10.pw.spaceVertical,

              ///kWh Label
              _buildKWhLabel(),

              ///Space
              6.pw.spaceVertical,

              /// Chart
              _buildChart(provider),

              /// Space
              15.pw.spaceVertical,

              /// Chart Legend
              _buildChartLegend(provider),

              /// Space
              15.pw.spaceVertical,
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
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 6,
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
              );
            }).toList(),
      ),
    );
  }

  Widget _buildDatePicker(PlantDetailProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: InkWell(
        onTap:
            () => _showDatePicker(navigatorKey.currentState!.context, provider),
        child: Container(
          decoration: BoxDecoration(
            color: ColorRes.black.withValues(alpha: 0.05),
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
