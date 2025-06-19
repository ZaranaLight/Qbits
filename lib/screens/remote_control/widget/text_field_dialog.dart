import 'package:qbits/qbits.dart';

class TextFieldDialog extends StatelessWidget {
  const TextFieldDialog({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });

  final String title;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorRes.black.withValues(alpha: 0.05),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.pw, vertical: 10.ph),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Title
            Expanded(child: Text(title, style: styleW600S14)),

            /// Space
            10.pw.spaceHorizontal,

            /// Value
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: styleW600S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
