import 'package:qbits/qbits.dart';
class  RowWidget extends StatelessWidget {
  final String? title;
  final String? value;
  final bool isStatus;

  const  RowWidget({super.key, this.value, this.title, this.isStatus = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title ?? "", style: styleW500S14)),
        Expanded(
          child: Text(
            value ?? "",
            textAlign: TextAlign.end,
            style:
            isStatus
                ? styleW600S14.copyWith(color: ColorRes.primaryColor)
                : styleW500S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),
        ),
      ],
    );
  }
}