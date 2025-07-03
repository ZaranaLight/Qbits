import 'package:qbits/qbits.dart';

class DropdownWidget extends StatelessWidget {
  final BuildContext? context;
  final String? title;
  final String? value;
  final double? leftPadding;
  final double? topPadding;
  final double? bottomPadding;
  final List<String>? options;
  final Color? backgroundColor;
  final Color? titleColor;
  final Function(String?) onChanged;

  const DropdownWidget({
    super.key,
    this.context,
    this.title,
    this.leftPadding,
    this.value,
    this.options,
    required this.onChanged,
    this.backgroundColor,
    this.titleColor,
    this.topPadding,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: leftPadding ?? Constants.horizontalPadding,
        top: 5.ph,
        bottom: 5.ph,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorRes.black.withValues(alpha: 0.05),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Title
          Expanded(
            child: Text(
              title ?? "",
              style: styleW600S14.copyWith(color: titleColor),
            ),
          ),

          /// Horizontal space
          12.pw.spaceHorizontal,

          /// DropdownMenu
          Expanded(
            child: AnimatedSize(
              duration: 200.milliseconds,
              child: DropdownMenu<String>(
                initialSelection: value,
                onSelected: (String? selectedValue) {
                  if (selectedValue != null) {
                    onChanged(selectedValue); // callback to your provider
                  }
                },
                trailingIcon: SvgAsset(
                  imagePath: AssetRes.downArrowIcon,
                  color: ColorRes.grey2,
                ),
                selectedTrailingIcon: Transform.rotate(
                  angle: 2 * 3.14 / 2,
                  child: SvgAsset(
                    imagePath: AssetRes.downArrowIcon,
                    color: ColorRes.grey2,
                  ),
                ),
                expandedInsets: EdgeInsets.zero,
                textAlign: TextAlign.end,
                maxLines: null,
                inputDecorationTheme: InputDecorationTheme(
                  border: InputBorder.none,
                  isDense: true,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.only(
                    top: topPadding ?? 8,
                    bottom: bottomPadding ?? 8,
                  ),
                  suffixIconConstraints: BoxConstraints(maxHeight: 14),
                ),
                dropdownMenuEntries:
                    options?.map((String option) {
                      return DropdownMenuEntry<String>(
                        value: option,
                        label: option,
                      );
                    }).toList() ??
                    [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
