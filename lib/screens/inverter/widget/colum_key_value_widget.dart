import 'package:qbits/qbits.dart';

class ColumKeyValueWidget extends StatelessWidget {
  final String? label;
  final String? value;

  const ColumKeyValueWidget({super.key, this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label
          Text(
            '$label',
            style: styleW400S14.copyWith(
              color: ColorRes.black.withValues(alpha: 0.6),
            ),
          ),

          /// Space
          8.ph.spaceVertical,

          /// Value
          Text(value ?? "", style: styleW700S14),
        ],
      ),
    );
  }
}
