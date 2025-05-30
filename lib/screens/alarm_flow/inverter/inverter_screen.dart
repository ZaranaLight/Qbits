import 'package:qbits/qbits.dart';

class InverterScreen extends StatelessWidget {
  const InverterScreen({super.key});

  static const routeName = "inverter_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<InverterProvider>(
      create: (context) => InverterProvider(),
      child: const InverterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterProvider>(
      builder: (context, provider, child) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => provider.initialize(),
        );
        return StackedLoader(
          loading: provider.loader,
          child: Scaffold(
            appBar: CustomAppBar(title: context.l10n?.inverter ?? ""),
            body: _buildBody(context, provider),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, InverterProvider provider) {
    return CustomSingleChildScroll(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row
          _buildInfoSection(context),

          /// Space
          16.pw.spaceVertical,

          /// Fault Section
          _buildFaultSection(context, provider),

          ///Space
          16.pw.spaceVertical,

          ///Chart Section
          _buildChartSection(provider),
        ],
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorRes.white),
      padding: EdgeInsets.symmetric(
        horizontal: Constants.horizontalPadding,
        vertical: 20.pw,
      ),
      child: Column(
        spacing: 13.pw,
        children: const [
          RowWidget(title: "Status", value: "Recovered", isStatus: true),
          RowWidget(title: "Start Time", value: "2025-03-03 11:03:49:912"),
          RowWidget(title: "End Time", value: "2025-03-03 11:03:49:912"),
          RowWidget(title: "ASP-20KTLC", value: ""),
          RowWidget(title: "Station Name", value: "Agra"),
          RowWidget(title: "Your City", value: "Agra"),
        ],
      ),
    );
  }

  Widget _buildFaultSection(BuildContext context, InverterProvider provider) {
    return Container(
      decoration: const BoxDecoration(color: ColorRes.white),
      child: Column(
        children: [
          _buildFaultHeader(context),
          Divider(height: 1, color: ColorRes.black.withValues(alpha: 0.1)),
          _buildFaultList(provider),
        ],
      ),
    );
  }

  Widget _buildFaultHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(height: 17, width: 5, color: ColorRes.primaryColor),
         10.pw.spaceHorizontal,
          Text(
            context.l10n?.fault ?? "",
            style: styleW600S14.copyWith(color: ColorRes.black2),
          ),
        ],
      ),
    );
  }

  Widget _buildFaultList(InverterProvider provider) {
    return CustomListView(

      itemCount: provider.titles.length,



      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder:
          (context, index) => Container(
            width: double.infinity,
            height: 1,
            color: ColorRes.black.withValues(alpha: 0.1),
          ),
      itemBuilder: (context, index) => _buildExpansionTile(provider, index),
    );
  }

  Widget _buildExpansionTile(InverterProvider provider, int index) {
    final isExpanded = provider.expandedIndex == index;
    return Column(
      children: [
        InkWell(
          onTap: () => provider.toggleExpanded(index),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: Constants.horizontalPadding,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// Icon
                      Text(provider.titles[index], style: styleW600S14),

                      ///Space
                      8.pw.spaceHorizontal,

                      ///Description
                      Text(
                        "Phase C voltage is too low",
                        style: styleW500S14.copyWith(color: ColorRes.orange2),
                      ),
                    ],
                  ),
                ),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: isExpanded ? 0.5 : 0,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorRes.black.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            height: isExpanded ? null : 0,
            child:
                isExpanded
                    ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.pw,
                        vertical: 5.pw,
                      ),
                      child: Text(
                        provider.contents[index],
                        style: styleW400S14,
                      ),
                    )
                    : null,
          ),
        ),

        /// Divider
        Divider(height: 1, color: ColorRes.black.withValues(alpha: 0.1)),
      ],
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

  Widget _buildPreferenceDropdown(InverterProvider provider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.pw),
        color: ColorRes.primaryColor.withValues(alpha: 0.1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<String>(
        elevation: 0,
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
