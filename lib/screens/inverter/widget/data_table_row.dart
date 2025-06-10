import 'package:qbits/qbits.dart';

class DataTableRow {
  final List<Widget> cells;
  final Color? backgroundColor;
  final bool isHeader;

  DataTableRow({
    required this.cells,
    this.backgroundColor,
    this.isHeader = false,
  });

  TableRow build(BuildContext context) {
    return TableRow(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
      ),
      children: cells,
    );
  }
}
