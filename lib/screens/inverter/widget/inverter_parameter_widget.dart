import 'package:qbits/qbits.dart';

class InverterParameterWidget extends StatelessWidget {
  const InverterParameterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final params = context.watch<InverterProvider>().parameters;

    return Container(
      color: ColorRes.white,
      child: Consumer<InverterProvider>(
        builder: (context, provider, child) {
          return Column(
            // spacing: 16.pw,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...params.map((param) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.pw,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        param.label,
                        style: styleW500S14.copyWith(
                          color: ColorRes.black.withValues(alpha: 0.5),
                        ),
                      ),
                      8.pw.spaceHorizontal,
                      Expanded(
                        child: Text(
                          param.value,
                          textAlign: TextAlign.right,
                          style: styleW500S14.copyWith(color: ColorRes.black),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
