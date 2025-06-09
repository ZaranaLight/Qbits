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
    this.minLine = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.showMandatoryIcon = false,
    this.readOnly = false,
    this.isMandatory = false,
    this.headerColor,
    this.onSuffixTap,
    this.isDense,
    this.header,
    this.maxWidth,
    this.borderRadius,
    this.fillColor,
    this.customBorder,
    this.customPadding,
    this.textAlign,
  });

  final String? hintText;
  final double? maxWidth;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? error;
  final int? maxLength;
  final int? maxLine;
  final int? minLine;
  final double? borderRadius;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final bool showMandatoryIcon;
  final bool readOnly;
  final bool isMandatory;
  final Color? headerColor;
  final bool? isDense;
  final String? header;
  final Color? fillColor;
  final InputBorder? customBorder;
  final EdgeInsets? customPadding;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        if (header != null)
          Padding(
            padding: EdgeInsets.only(bottom: 10.ph),
            child:
                isMandatory
                    ? RichText(
                      text: TextSpan(
                        text: '*',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                        children: [
                          TextSpan(
                            text: header,
                            style: styleW600S14.copyWith(
                              color: ColorRes.black2,
                            ),
                          ),
                        ],
                      ),
                    )
                    : Text(
                      header ?? "",
                      style: styleW400S14.copyWith(
                        color:
                            headerColor ??
                            ColorRes.black2.withValues(alpha: 0.6),
                      ),
                    ),
          ),

        TextField(
          style: styleW600S14,
          controller: controller,
          onTapOutside: (e) => hideKeyboard(context: context),
          keyboardType: textInputType,
          textInputAction: textInputAction ?? TextInputAction.next,
          onChanged: onChanged,
          onTap: onTap,
          maxLength: maxLength,
          textCapitalization: textCapitalization,
          maxLines: obscureText ? 1 : maxLine,
          minLines: minLine ?? 1,
          obscureText: obscureText,
          obscuringCharacter: "*",
          readOnly: readOnly,
          textAlign: textAlign??TextAlign.left,
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
            fillColor: fillColor ?? ColorRes.lightGrey2,
            isDense: isDense ?? false,
            filled: true,
            hintStyle: styleW500S14.copyWith(
              color:
                  (error ?? '').isNotEmpty
                      ? ColorRes.red
                      : ColorRes.black.withValues(alpha: 0.3),
            ),
            contentPadding:
                customPadding ??
                EdgeInsets.only(left: 12.pw, right: 12.pw, top: 10, bottom: 8),
            border: customBorder ?? inputBorder(),
            focusedBorder: (customBorder ?? inputBorder()).copyWith(
              borderSide: BorderSide(color: ColorRes.primaryColor),
            ),
            disabledBorder: customBorder ?? inputBorder(),
            errorBorder: customBorder ?? inputBorder(),
            focusedErrorBorder: customBorder ?? inputBorder(),
            enabledBorder: customBorder ?? inputBorder(),
            prefixIcon: prefixIcon,
            suffixIconConstraints: BoxConstraints(
              maxWidth: maxWidth ?? 44,
              maxHeight: 40,
            ),
            suffixIcon: InkWell(
              onTap: onSuffixTap,
              borderRadius: BorderRadius.circular(borderRadius ?? 40.pw),
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
      borderRadius: BorderRadius.circular(borderRadius ?? 40.pw),
      borderSide: BorderSide(
        color:
            (error ?? '').isNotEmpty
                ? ColorRes.red
                : ColorRes.lightGrey2.withValues(alpha: 0.2),
      ),
    );
  }
}
