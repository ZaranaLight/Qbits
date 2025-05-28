import 'package:qbits/qbits.dart';
import 'package:qbits/screens/alarm_flow/inverter/inverter_provider.dart';

class InverterScreen extends StatelessWidget {
  const InverterScreen({super.key});

  static const routeName = "inverter_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<InverterProvider>(
      create: (c) => InverterProvider(),
      child: InverterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InverterProvider>(
      builder: (context, provider, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          provider.initialize();
        });

        return Scaffold(
          appBar: CustomAppBar(title: context.l10n?.inverter ?? ""),
          body: CustomSingleChildScroll(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: ColorRes.white),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.pw,
                    vertical: 20.pw,
                  ),
                  child: Column(
                    spacing: 13.pw,
                    children: [
                      _RowWidget(
                        title: "Status",
                        value: "Recovered",
                        isStatus: true,
                      ),
                      _RowWidget(
                        title: "Start Time",
                        value: "2025-03-03 11:03:49:912",
                      ),
                      _RowWidget(
                        title: "End Time",
                        value: "2025-03-03 11:03:49:912",
                      ),
                      _RowWidget(title: "ASP-20KTLC", value: ""),
                      _RowWidget(title: "Station Name", value: "Agra"),
                      _RowWidget(title: "Your City", value: "Agra"),
                    ],
                  ),
                ),

                /// Space
                16.pw.spaceVertical,

                ///Fault Container
                Container(
                  decoration: BoxDecoration(color: ColorRes.white),
                  child: Column(
                    children: [
                      /// Send
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 17,
                              width: 5,
                              color: ColorRes.primaryColor,
                            ),

                            ///Space
                            10.pw.spaceHorizontal,

                            Text(
                              context.l10n?.fault ?? "",
                              style: styleW600S14.copyWith(
                                color: ColorRes.black2,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Divider(
                        height: 1.pw,
                        color: ColorRes.black.withValues(alpha: 0.1),
                      ),
                      CustomListView(
                        itemCount: provider.titles.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            height: 1.pw,
                            color: ColorRes.black.withValues(alpha: 0.1),
                          );
                        },
                        itemBuilder: (context, index) {
                          final isExpanded = provider.expandedIndex == index;
                          return Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                              splashColor: Colors.grey,
                              highlightColor: Colors.transparent,
                            ),
                            child: ExpansionTile(
                              key: Key(index.toString()),
                              iconColor: ColorRes.black.withValues(alpha: 0.6),
                              collapsedIconColor: ColorRes.black.withValues(
                                alpha: 0.6,
                              ),
                              initiallyExpanded: isExpanded,
                              title: Row(
                                children: [
                                  Text(provider.titles[index]),

                                  Text(
                                    " Phase C voltage is too low",
                                    style: styleW500S14.copyWith(
                                      color: ColorRes.orange2,
                                    ),
                                  ),
                                ],
                              ),
                              onExpansionChanged: (expanded) {
                                provider.toggleExpanded(index);
                              },
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.0.pw,
                                    vertical: 5.pw,
                                  ),
                                  child: Text(
                                    provider.contents[index],
                                    style: styleW400S14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                ///Space
                16.pw.spaceVertical,

                ///Chart Container
                Consumer<InverterProvider>(
                  builder: (context, provider, child) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 15.pw),
                      decoration: BoxDecoration(color: ColorRes.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Tabs Day, Month, Year
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:
                                  provider.tabs.asMap().entries.map((entry) {
                                    int index = entry.key;
                                    String tab = entry.value;
                                    bool isSelected =
                                        provider.selectedIndex == index;
                                    return InkWell(
                                      onTap: () => provider.selectTab(index),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 0,
                                          vertical: 6,
                                        ),

                                        child: Text(
                                          tab,
                                          style: styleW600S16.copyWith(
                                            color:
                                                isSelected
                                                    ? ColorRes.primaryColor
                                                    : ColorRes.black.withValues(
                                                      alpha: 0.5,
                                                    ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ),

                          ///Space
                          8.pw.spaceVertical,

                          /// Date Picker
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: InkWell(
                              onTap: () async {
                                DateTime? picked;
                                if (provider.viewType == ChartViewType.day) {
                                  picked = await showDatePicker(
                                    context: context,
                                    initialDate: provider.selectedDate,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  );
                                } else if (provider.viewType ==
                                    ChartViewType.month) {
                                  picked = await showDatePicker(
                                    context: context,
                                    initialDate: provider.selectedDate,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                    helpText: 'Pick Month',
                                    fieldHintText: 'YYYY-MM',
                                  );
                                } else if (provider.viewType ==
                                    ChartViewType.year) {
                                  picked = await showDatePicker(
                                    context: context,
                                    initialDate: provider.selectedDate,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                    helpText: 'Pick Year',
                                    fieldHintText: 'YYYY',
                                  );
                                }

                                if (picked != null) {
                                  provider.updateDate(picked);
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30.pw,
                                ),

                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => provider.previousTab(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgAsset(
                                          imagePath: AssetRes.leftArrowIcon,
                                          width: 8.pw,
                                        ),
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Text(
                                          provider.displayDate,

                                          style: styleW600S16,
                                        ),
                                      ],
                                    ),

                                    InkWell(
                                      onTap: () => provider.nextTab(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgAsset(
                                          imagePath: AssetRes.rightArrowIcon,
                                          width: 8.pw,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          ///Space
                          10.pw.spaceVertical,

                          /// Energy Usage
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Energy',
                                  style: styleW400S16.copyWith(
                                    color: ColorRes.black.withValues(
                                      alpha: 0.6,
                                    ),
                                  ),
                                ),
                                Text(
                                  '15.4 kWh',
                                  style: styleW600S16.copyWith(
                                    color: ColorRes.black.withValues(
                                      alpha: 0.6,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ///Space
                          3.pw.spaceVertical,

                          Divider(color: ColorRes.black.withValues(alpha: 0.1)),

                          ///Space
                          0.pw.spaceVertical,

                          /// Preference Dropdown
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButton<String>(
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              isDense: true,
                              hint: Text("Preference", style: styleW500S14),
                              isExpanded: false,
                              underline: SizedBox(),
                              items:
                                  provider.preferenceOptions.map((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  provider.updateSelectedPreference(newValue);
                                }
                              },
                            ),
                          ),

                          ///Space
                          6.pw.spaceVertical,

                          /// KWh Label
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text('kWh', style: styleW400S12),
                          ),

                          ///Space
                          6.pw.spaceVertical,

                          /// Chart
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
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
                                        color: ColorRes.primaryColor.withValues(
                                          alpha: 0.2,
                                        ),
                                      ),
                                      dotData: FlDotData(show: false),
                                    ),
                                  ],
                                  titlesData: FlTitlesData(
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 2,
                                        getTitlesWidget:
                                            (value, meta) => Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8.0,
                                              ),
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
                                              padding: const EdgeInsets.only(
                                                right: 8.0,
                                              ),
                                              child: Text(
                                                value.toInt().toString(),
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ),
                                      ),
                                    ),
                                  ),
                                  gridData: FlGridData(show: true),
                                  borderData: FlBorderData(
                                    show: true,
                                    border: Border.all(
                                      color: Colors.black.withValues(
                                        alpha: 0.1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ///Space
                          15.pw.spaceVertical,

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /// Circle
                                Container(
                                  width: 10.pw,
                                  height: 10.pw,
                                  decoration: BoxDecoration(
                                    color: ColorRes.primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),

                                ///Space
                                6.pw.spaceHorizontal,

                                /// Text
                                Text(
                                  provider.selectedPreference,
                                  style: styleW600S14,
                                ),
                              ],
                            ),
                          ),

                          ///Space
                          15.pw.spaceVertical,
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RowWidget extends StatelessWidget {
  final String? title;
  final String? value;
  final bool isStatus;

  const _RowWidget({this.value, this.title, this.isStatus = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title ?? "", style: styleW500S14)),
        Expanded(
          child: Text(
            value ?? "",
            textAlign: TextAlign.end,
            style:
                isStatus
                    ? styleW600S14.copyWith(color: ColorRes.primaryColor)
                    : styleW500S14.copyWith(
                      color: ColorRes.black.withValues(alpha: 0.6),
                    ),
          ),
        ),
      ],
    );
  }
}
