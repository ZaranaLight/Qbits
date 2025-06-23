import 'package:qbits/qbits.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.hintText,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.error,
    this.onChanged,
    this.onTap,
    this.maxLength,
    this.maxLine = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.showMandatoryIcon = false,
    this.readOnly = false,
    this.fillColor,
    this.onSuffixTap,
    this.header,
  });

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? error;
  final int? maxLength;
  final int? maxLine;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final bool showMandatoryIcon;
  final bool readOnly;
  final String? header;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: styleW400S14.copyWith(
        color: fillColor != null ? ColorRes.white : ColorRes.black,
      ),
      controller: controller,
      onTapOutside: (e) => hideKeyboard(context: context),
      keyboardType: textInputType,
      textInputAction: textInputAction ?? TextInputAction.next,
      onChanged: onChanged,
      onTap: onTap,
      maxLength: maxLength,
      textCapitalization: textCapitalization,
      maxLines: obscureText ? 1 : maxLine,
      obscureText: obscureText,
      obscuringCharacter: "*",
      readOnly: readOnly,
      buildCounter: (
        BuildContext context, {
        required int currentLength,
        required int? maxLength,
        required bool isFocused,
      }) {
        return SizedBox();
      },
      decoration: InputDecoration(
        hintText: hintText,


        isDense: true,
        fillColor: fillColor ?? ColorRes.white.withValues(alpha: 0.14),
        filled: true,
        hintStyle: styleW400S14.copyWith(
          color: fillColor != null ? ColorRes.black : ColorRes.white,
        ),
        contentPadding: EdgeInsets.only(
          left: 12.pw,
          right: 12.pw,
          top: 10,
          bottom: 8,
        ),
        border: inputBorder(),
        focusedBorder: inputBorder().copyWith(
          borderSide: BorderSide(color: ColorRes.primaryColor),
        ),
        disabledBorder: inputBorder(),
        errorBorder: inputBorder(),
        focusedErrorBorder: inputBorder(),
        enabledBorder: inputBorder(),
        prefixIcon: Padding(
          padding: EdgeInsets.only(bottom: 15.ph, top: 15.ph),
          child: prefixIcon,
        ),
        suffixIconConstraints: BoxConstraints(maxWidth: 44, maxHeight: 40),
        suffixIcon: InkWell(
          onTap: onSuffixTap,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 4.pw),
              child: suffixIcon,
            ),
          ),
        ),
      ),
    );
  }

  InputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.pw),
      borderSide: BorderSide(color: ColorRes.white.withAlpha(14)),
    );
  }
}
