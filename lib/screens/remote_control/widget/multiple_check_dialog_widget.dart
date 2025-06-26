import 'package:qbits/qbits.dart';

class MultiSelectWeekSellWidget extends StatelessWidget {
  final List<String> options;
  final List<String> selected;
  final ValueChanged<List<String>> onChanged;

  const MultiSelectWeekSellWidget({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteControlProvider>(
      builder: (context, provider, child) {
        return InkWell(
          onTap: () async {
            final result = await showDialog<List<String>>(
              context: context,
              builder:
                  (_) => _MultiSelectDialog(
                    options: options,
                    selected: List.from(selected),
                  ),
            );

            if (result != null) {
              onChanged(result);
            }
          },
          child: Container(
            height: 42.ph,
            padding: EdgeInsets.symmetric(horizontal: 16.pw),
            decoration: BoxDecoration(
              color: ColorRes.black.withValues(alpha: 0.05),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Week Sell', style: styleW600S14),
                Row(
                  children: [
                    Text(
                      provider.getSelectedDayIndexes(selected).toString(),
                      style: styleW600S14.copyWith(
                        color: ColorRes.black.withValues(alpha: 0.6),
                      ),
                    ),
                    8.pw.spaceHorizontal,
                    SvgAsset(
                      imagePath: AssetRes.downArrowIcon,
                      color: ColorRes.grey2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MultiSelectDialog extends StatefulWidget {
  final List<String> options;
  final List<String> selected;

  const _MultiSelectDialog({required this.options, required this.selected});

  @override
  State<_MultiSelectDialog> createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<_MultiSelectDialog> {
  late List<String> tempSelected;

  @override
  void initState() {
    super.initState();
    tempSelected = List.from(widget.selected);
  }

  Map<String, String> weekDayMap = {
    '0': 'Sunday',
    '1': 'Monday',
    '2': 'Tuesday',
    '3': 'Wednesday',
    '4': 'Thursday',
    '5': 'Friday',
    '6': 'Saturday',
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.pw)),
      title: Center(child: Text('Select Week Set', style: styleW600S20)),
      content: SingleChildScrollView(
        child: Column(
          children:
              widget.options.map((e) {
                final isSelected = tempSelected.contains(e);
                return CheckboxListTile(
                  title: Text(weekDayMap[e] ?? e),
                  value: isSelected,
                  onChanged: (bool? selected) {
                    setState(() {
                      if (selected == true) {
                        tempSelected.add(e);
                      } else {
                        tempSelected.remove(e);
                      }
                    });
                  },
                );
              }).toList(),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: EmptyButton(
                title: context.l10n?.cancel ?? "",
                onTap: () {
                  Navigator.pop(context, widget.selected);
                },
              ),
            ),

            ///Space
            16.pw.spaceHorizontal,

            Expanded(
              child: SubmitButton(
                title: context.l10n?.ok ?? "",
                onTap: () => Navigator.pop(context, tempSelected),
              ),
            ),

            16.pw.spaceHorizontal,
          ],
        ),
      ],
    );
  }
}
