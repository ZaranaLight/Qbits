import 'package:qbits/qbits.dart';

class RowWithTitleAndValueWidget extends StatelessWidget {
  final String? title;
  final String? value;
  final String? title2;
  final String? value2;

  const RowWithTitleAndValueWidget({
    super.key,
    this.title,
    this.value,
    this.title2,
    this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                title ?? "",
                style: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),

              /// Space
              5.ph.spaceVertical,

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Value
                  Text("0.0", style: styleW600S16),

                  /// Space
                  6.ph.spaceHorizontal,

                  /// Unit
                  Expanded(
                    child: Text(
                      'kwh',
                      style: styleW600S14.copyWith(color: ColorRes.black2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// Space
        70.pw.spaceHorizontal,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /// Title
              Text(
                title2 ?? "",
                textAlign: TextAlign.right,
                style: styleW500S14.copyWith(
                  color: ColorRes.black.withValues(alpha: 0.6),
                ),
              ),

              /// Space
              5.ph.spaceVertical,

              Row(
                children: [
                  /// Value
                  Expanded(
                    child: Text(
                      value2 ?? "",
                      style: styleW600S16,
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis, // Optional: truncate
                    ),
                  ),

                  /// Space
                  6.ph.spaceHorizontal,

                  /// Unit
                  Text(
                    'kwh',
                    textAlign: TextAlign.end,
                    style: styleW600S14.copyWith(color: ColorRes.black2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
