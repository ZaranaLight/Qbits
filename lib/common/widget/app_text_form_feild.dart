import 'package:qbits/common/widget/common_widgets.dart';
import 'package:qbits/qbits.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
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
    this.isRequired = false,
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
  final bool? isRequired;
  final String? header;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        if (header != null)
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

        TextField(
          style: styleW400S14,
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
            fillColor: ColorRes.lightGrey2,

            filled: true,
            hintStyle: styleW400S14.copyWith(
              color:
                  (error ?? '').isNotEmpty
                      ? ColorRes.red
                      : ColorRes.black.withValues(alpha: 0.3),
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
            prefixIcon: prefixIcon,
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
        ),
        ErrorText(error: error, topPadding: 4.ph),
      ],
    );
  }

  InputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(40.pw),
      borderSide: BorderSide(
        color:
            (error ?? '').isNotEmpty
                ? ColorRes.red
                : ColorRes.lightGrey2.withValues(alpha: 0.2),
      ),
    );
  }
}
