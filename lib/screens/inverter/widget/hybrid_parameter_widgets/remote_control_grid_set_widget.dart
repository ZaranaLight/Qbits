import 'package:qbits/qbits.dart';

class RemoteControlGridSetWidget extends StatelessWidget {
  const RemoteControlGridSetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InverterProvider>(context);
    final defaultColumnWidths = {
      0: const FixedColumnWidth(80),
      1: const FixedColumnWidth(80),
      2: const FixedColumnWidth(80),
      3: const FixedColumnWidth(80),
      4: const FixedColumnWidth(80),
    };
    return Column(
      children: [
        Table(
          columnWidths: defaultColumnWidths,
          children: [
            // Header row
            DataTableRow(
              isHeader: true,
              cells: [
                ValueTitleCell(
                  title: context.l10n?.acInfo ?? "",
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
                  title: context.l10n?.frequency ?? "",
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
            ...provider.inverterData.pvArrays.asMap().entries.map((entry) {
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
                  ValueTitleCell(
                    title: 'Power',
                    value: '${pv.power.toStringAsFixed(1)} W',
                  ),
                ],
              ).build(context);
            }),
          ],
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 14.pw),
          padding: EdgeInsets.symmetric(horizontal: 12.pw, vertical: 12.pw),
          decoration: BoxDecoration(color: ColorRes.white),
          child: Column(
            children: [
              ///Space
              20.pw.spaceVertical,

              /// Title
              Row(
                children: [
                  ColumKeyValueWidget(label: "Reactive PowerA:", value: '0Var'),
                  ColumKeyValueWidget(label: "Reactive PowerB:", value: '0Var'),
                ],
              ),

              ///Space
              20.pw.spaceVertical,
              Row(
                children: [
                  ColumKeyValueWidget(label: "Reactive PowerC:", value: '0Var'),
                  ColumKeyValueWidget(label: "Power FectorA:", value: '0Var'),
                ],
              ),

              ///Space
              20.pw.spaceVertical,
              Row(
                children: [
                  ColumKeyValueWidget(label: "Power FectorB:", value: '0Var'),
                  ColumKeyValueWidget(label: "Power FectorC:", value: '0Var'),
                ],
              ),

              ///Space
              20.pw.spaceVertical,
              Row(
                children: [
                  ColumKeyValueWidget(label: "Total Power", value: '0Var'),
                  ColumKeyValueWidget(label: "Status:", value: '0Var'),
                ],
              ),

              ///Space
              20.pw.spaceVertical,
              Row(
                children: [
                  ColumKeyValueWidget(label: "Total Product:", value: '0Var'),
                  ColumKeyValueWidget(label: "Total Electric:", value: '0Var'),
                ],
              ),

              ///Space
              20.pw.spaceVertical,
            ],
          ),
        ),
      ],
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
      width: 50,

      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5.pw),
      child: Material(
        color: ColorRes.transparent,
        child: InkWell(
          onTap: isHeader ? () {} : null,
          borderRadius: BorderRadius.circular(5.pw),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0.pw, vertical: 2.pw),
            margin: EdgeInsets.only(left: 10.pw, right: 0.pw),
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
