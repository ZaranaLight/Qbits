import 'package:qbits/qbits.dart';

class RowWidget extends StatelessWidget {
  final String? title;
  final String? value;
  final bool isStatus;
  final Widget? trailingWidget;

  const RowWidget({
    super.key,
    this.value,
    this.title,
    this.isStatus = false,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title ?? "",   style: styleW500S14.copyWith(

        ),)),
        Expanded(
          child:
              trailingWidget ??
              Text(
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
