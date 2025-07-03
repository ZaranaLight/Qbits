import 'package:qbits/qbits.dart';

class DropdownWidget2 extends StatelessWidget {
  final BuildContext? context;
  final String? title;
  final String? value;
  final List<String>? options;
  final Color? backgroundColor;
  final ValueChanged<String>? onChanged;

  const DropdownWidget2({
    super.key,
    this.context,
    this.title,
    this.value,
    this.options,
    required this.onChanged,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.ph),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorRes.black.withValues(alpha: 0.05),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          Expanded(
            flex: 1,
            child: Text(
              title ?? "",
              style: styleW500S14.copyWith(
                height: 2,
                color: ColorRes.black.withValues(alpha: 0.5),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          /// Horizontal space
          12.pw.spaceHorizontal,

          /// Dropdown
          Expanded(
            flex: 1,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isDense: true,
                isExpanded: true,
                alignment: Alignment.centerRight,
                onChanged: (newValue) {
                  if (newValue != null) {
                    onChanged!(newValue);
                  }
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: 8.pw),
                  child: SvgAsset(
                    imagePath: AssetRes.downArrowIcon,
                    color: ColorRes.grey2,
                  ),
                ),
                selectedItemBuilder: (context) {
                  return options?.map((option) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            option,
                            style: styleW600S14,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        );
                      }).toList() ??
                      [];
                },
                items:
                    options?.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
