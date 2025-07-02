import 'package:qbits/qbits.dart';

class SolarDataTable extends StatelessWidget {
  const SolarDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InverterProvider>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        const columnCount = 4;
        final columnWidth = totalWidth / columnCount;

        final defaultColumnWidths = {
          for (int i = 0; i < columnCount; i++)
            i: FixedColumnWidth(columnWidth),
        };
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.pw),
              child: Table(
                columnWidths: defaultColumnWidths,
                children: [
                  // Header row
                  DataTableRow(
                    isHeader: true,
                    cells: [
                      ValueTitleCell(
                        title: context.l10n?.solar ?? "",
                        value: '',
                        isHeader: true,
                        isFirst: true,
                      ),
                      ValueTitleCell(
                        title: context.l10n?.voltage ?? "",
                        value: '',
                        isHeader: true,
                      ),
                      ValueTitleCell(
                        title: context.l10n?.current ?? "",
                        value: '',
                        isHeader: true,
                      ),
                      ValueTitleCell(
                        title: context.l10n?.power ?? "",
                        value: '',
                        isHeader: true,
                      ),
                    ],
                  ).build(context),

                  // Data rows
                  ...provider.inverterData.pvArrays.asMap().entries.map((
                    entry,
                  ) {
                    final index = entry.key;
                    final pv = entry.value;
                    return DataTableRow(
                      cells: [
                        ValueTitleCell(
                          title: 'PV${index + 1}',
                          value: 'PV${index + 1}',
                        ),
                        ValueTitleCell(
                          title: 'Voltage',
                          value: '${pv.voltage.toStringAsFixed(1)} V',
                        ),
                        ValueTitleCell(
                          title: 'Current',
                          value: '${pv.current.toStringAsFixed(1)} A',
                        ),
                        ValueTitleCell(
                          title: 'Power',
                          value: '${pv.power.toStringAsFixed(1)} W',
                        ),
                      ],
                    ).build(context);
                  }),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              margin: EdgeInsets.symmetric(horizontal: 14.pw),
              width: double.infinity,
              decoration: BoxDecoration(color: ColorRes.white),
              child: RichText(
                text: TextSpan(
                  text: 'Total Product: ',
                  style: styleW400S14.copyWith(
                    color: ColorRes.black.withValues(alpha: 0.6),
                  ),
                  children: [
                    TextSpan(
                      text: '0kWh',
                      style: styleW600S14.copyWith(color: ColorRes.black2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ValueTitleCell extends StatelessWidget {
  final String title;
  final String value;
  final bool isHeader;
  final bool isFirst;
  final double? width;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;

  const ValueTitleCell({
    super.key,
    required this.title,
    required this.value,
    this.isHeader = false,
    this.isFirst = false,
    this.width,
    this.titleStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = styleW400S14;
    final headerStyle = styleW500S14.copyWith(
      color:
          (isHeader && isFirst)
              ? ColorRes.white
              : ColorRes.black.withValues(alpha: 0.6),
    );

    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 15.pw, vertical: 5.pw),
      child: Material(
        color: ColorRes.transparent,
        child: InkWell(
          onTap: isHeader ? () {} : null,
          borderRadius: BorderRadius.circular(5.pw),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.pw, vertical: 2.pw),
            decoration: BoxDecoration(
              color:
                  (isHeader && isFirst)
                      ? ColorRes.primaryColor
                      : ColorRes.transparent,
              borderRadius: BorderRadius.circular(4.pw),
            ),
            child: Text(
              isHeader ? title : value,
              textAlign: TextAlign.center,
              style:
                  isHeader
                      ? (titleStyle ?? headerStyle)
                      : (valueStyle ?? defaultTextStyle),
            ),
          ),
        ),
      ),
    );
  }
}
