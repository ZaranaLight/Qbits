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
  });

  final String? header;
  final T? selectedValue;
  final List<T> optionsList;
  final String Function(T) itemAsString;
  final void Function(T?)? onChanged;
  final String? error;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (header?.isNotEmpty ?? false)
              Padding(
                padding: EdgeInsets.only(bottom: 4.1.ph),
                child: Text(header ?? "", style: styleW500S14),
              ),

            /// Dropdown
            DropdownMenu<T>(
              initialSelection: selectedValue,
              width: constrains.maxWidth,
              menuHeight: 200,
              onSelected: onChanged,
              dropdownMenuEntries:
                  optionsList.map((e) {
                    return DropdownMenuEntry<T>(
                      value: e,
                      label: itemAsString(e),
                    );
                  }).toList(),
              hintText: hintText ?? "Select",
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: ColorRes.white,
                hintStyle: styleW400S14.copyWith(
                  color:
                      (error ?? '').isNotEmpty ? ColorRes.red : ColorRes.grey,
                ),
                isCollapsed: true,
                contentPadding: EdgeInsets.only(
                  left: 14.pw,
                  right: 25.pw,
                  top: 15,
                  bottom: 16,
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
              textStyle: styleW400S14.copyWith(color: ColorRes.black2),
              selectedTrailingIcon: Transform.rotate(
                angle: 3.1,
                child: SvgAsset(
                  imagePath: AssetRes.downArrowIcon,
                  height: 20.pw,
                ),
              ),
              trailingIcon: SvgAsset(
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
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: (error ?? "").isNotEmpty ? ColorRes.red : ColorRes.lightGrey,
        width: 1,
      ),
    );
  }
}
