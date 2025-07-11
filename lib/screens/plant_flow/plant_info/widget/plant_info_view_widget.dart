import 'package:qbits/qbits.dart';

class PlantInfoViewWidget extends StatelessWidget {
  final String? title;
  final String? value;

  const PlantInfoViewWidget({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.ph),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Title
          Expanded(
            child: Text(
              title ?? "",
              textAlign: TextAlign.left,
              style: styleW500S14.copyWith(
                height: 2,
                color: ColorRes.black.withValues(alpha: 0.5),
              ),
            ),
          ),

          /// Horizontal space
          20.pw.spaceHorizontal,

          /// Value
          Expanded(
            child: Text(
              value ?? "",
              textAlign: TextAlign.right,
              style: styleW600S14.copyWith(color: ColorRes.black, height: 2),
            ),
          ),
        ],
      ),
    );
  }
}

class EditableInfoField extends StatelessWidget {
  final String title;
  final String value;
  final bool isEditing;
  final VoidCallback? onTap;
  final bool isDropdown;
  final bool isLastItem;
  final List<String>? options;
  final Function(String?)? onChanged;

  const EditableInfoField({
    super.key,
    required this.title,
    required this.value,
    required this.isEditing,
    this.onTap,
    this.isDropdown = false,
    this.isLastItem = false,
    this.options,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (isEditing) {
      if (isDropdown && options != null && onChanged != null) {
        content =
        ///Run Mode
        AppDropDownMenuWidget(
          title: title,
          context: context,
          value: value,
          options: options,
          titleColor: ColorRes.black.withValues(alpha: 0.5),
          onChanged: (value) => onChanged,
          backgroundColor: ColorRes.white,
          leftPadding: 0,
        );
      } else {
        content = AppTextFieldDialogWidget(
          title: title,
          value: value,
          onTap: onTap,
        );
      }
    } else {
      content = PlantInfoViewWidget(title: title, value: value);
    }

    return Column(
      children: [
        content,
        if (!isLastItem)
          Divider(height: 0, color: ColorRes.black.withValues(alpha: 0.1)),
      ],
    );
  }
}
