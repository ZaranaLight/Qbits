import 'package:qbits/common/widget/common_widgets.dart';
import 'package:qbits/qbits.dart';

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    super.key,
    this.header,
    this.selectedValue,
    this.onChanged,
    this.error,
    this.optionsList = const [],
    required this.itemAsString,
    this.hintText,
    this.isRequired = false,
    this.suffixIcon,
  });

  final String? header;
  final T? selectedValue;
  final List<T> optionsList;
  final String Function(T) itemAsString;
  final void Function(T?)? onChanged;
  final String? error;
  final String? hintText;
  final bool? isRequired;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            if (header?.isNotEmpty ?? false)
              Padding(
                padding: EdgeInsets.only(bottom: 10.ph),
                child: Row(
                  children: [
                    isRequired! ? Text(
                      '*',
                      style: styleW400S14.copyWith(
                        color: ColorRes.red,
                      ),
                    ) : Container(),
                    Text(
                      header ?? "",
                      style: styleW400S14.copyWith(
                        color: ColorRes.black2.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),

            /// Dropdown
            DropdownMenu<T>(
              initialSelection: selectedValue,
              width: constrains.maxWidth,
              menuHeight: 200,
              onSelected: onChanged,
              dropdownMenuEntries: optionsList.map((e) {
                return DropdownMenuEntry<T>(
                  value: e,
                  label: itemAsString(e),
                );
              }).toList(),
              hintText: hintText ?? "Select",
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: ColorRes.lightGrey2,
                hintStyle: styleW400S14.copyWith(
                  color: (error ?? '').isNotEmpty ? ColorRes.red : ColorRes.black.withValues(alpha: 0.3),
                ),
                isCollapsed: true,
                contentPadding: EdgeInsets.only(
                  left: 12.pw,
                  right: 12.pw,
                  top: 10,
                  bottom: 8,
                ),
                border: border(),
                focusedBorder: border().copyWith(
                  borderSide: BorderSide(color: ColorRes.primaryColor),
                ),
                errorBorder: border(),
                focusedErrorBorder: border(),
                enabledBorder: border(),
                disabledBorder: border(),
                isDense: true,
              ),
              textStyle: styleW400S14,
              selectedTrailingIcon: Transform.rotate(
                angle: 3.1,
                child: suffixIcon ?? SvgAsset(
                  imagePath: AssetRes.downArrowIcon,
                  height: 20.pw,
                ),
              ),
              trailingIcon: suffixIcon ?? SvgAsset(
                imagePath: AssetRes.downArrowIcon,
                height: 6.98.pw,
              ),
            ),

            ErrorText(error: error, topPadding: 4.ph),
          ],
        );
      },
    );
  }

  InputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40.pw),
      borderSide: BorderSide(
        color: (error ?? '').isNotEmpty ? ColorRes.red : ColorRes.lightGrey2.withValues(alpha: 0.2),
      ),
    );
  }
}
