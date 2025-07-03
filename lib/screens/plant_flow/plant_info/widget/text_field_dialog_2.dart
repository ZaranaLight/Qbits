import 'package:qbits/qbits.dart';

class TextFieldDialog2 extends StatelessWidget {
  const TextFieldDialog2({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
    this.backgroundColor,
  });

  final String title;
  final String value;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: ColorRes.white),
        padding: EdgeInsets.symmetric(vertical: 14.ph),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Title
            Expanded(
              child: Text(
                title,
                style: styleW500S14.copyWith(
                  height: 2,
                  color: ColorRes.black.withValues(alpha: 0.5),
                ),
              ),
            ),

            /// Space
            10.pw.spaceHorizontal,

            /// Value
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.end,
                style: styleW600S14.copyWith(color: ColorRes.black, height: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
