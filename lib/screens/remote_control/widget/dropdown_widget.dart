import 'package:qbits/qbits.dart';

class DropdownWidget extends StatelessWidget {
  final BuildContext? context;
  final String? title;
  final String? value;
  final List<String>? options;
  final Color? backgroundColor;
  final Function(String?) onChanged;

  const DropdownWidget({
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
      padding: EdgeInsets.only(left: 16.pw),
      decoration: BoxDecoration(
        color: backgroundColor ?? ColorRes.black.withValues(alpha: 0.05),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Title
          Expanded(child: Text(title ?? "", style: styleW600S14)),

          /// Horizontal space
          12.pw.spaceHorizontal,

          /// DropdownMenu
          Expanded(
            child: AnimatedSize(
              duration: 200.milliseconds,
              child: DropdownMenu<String>(
                initialSelection: value,
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
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
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
