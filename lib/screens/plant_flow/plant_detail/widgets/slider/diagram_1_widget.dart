import 'package:qbits/qbits.dart';

// class Diagram1Widget extends StatelessWidget {
//   const Diagram1Widget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         padding: EdgeInsets.only(
//           left: 16.pw,
//           right: 16.pw,
//           top: 30.ph,
//           bottom: 50.ph,
//         ),
//         decoration: BoxDecoration(color: ColorRes.white),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             /// Title
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               children: [
//                 ///Solar
//                 buildIconWithText(
//                   title: 'Solar',
//                   value: '0kw',
//                   imagePath: AssetRes.greenSolar2Icon,
//                   isIconPrefix: true,
//                 ),
//
//                 ///Grid
//                 buildIconWithText(
//                   title: 'Grid',
//                   value: '0kw',
//                   imagePath: AssetRes.gridIcon,
//                   isIconPrefix: false,
//                 ),
//               ],
//             ),
//
//             ///Space
//             16.ph.spaceVertical,
//
//             /// Diagram Icon
//             SvgAsset(imagePath: AssetRes.diagram1Icon),
//
//             /// Space
//             10.ph.spaceVertical,
//
//             /// Load
//             Align(
//               alignment: Alignment.center,
//               child: buildIconWithText(
//                 title: 'Load',
//                 value: '0kw',
//                 imagePath: AssetRes.loadIcon,
//                 isIconPrefix: false,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildIconWithText({
//     required String imagePath,
//     required String title,
//     required String value,
//     required bool isIconPrefix,
//   }) {
//     return Expanded(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           /// Icon
//           if (isIconPrefix) SvgAsset(imagePath: imagePath),
//
//           /// Space
//           14.pw.spaceHorizontal,
//
//           /// Text
//           Expanded(
//             child: Column(
//               children: [
//                 /// Title
//                 Text(
//                   title,
//                   style: styleW400S12.copyWith(color: ColorRes.black),
//                 ),
//
//                 ///Space
//                 5.ph.spaceVertical,
//
//                 /// Value
//                 Text(
//                   value,
//                   style: styleW600S14.copyWith(color: ColorRes.black),
//                 ),
//               ],
//             ),
//           ),
//
//           /// Space
//           if (!isIconPrefix)
//             /// Icon
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 /// Space
//                 14.pw.spaceHorizontal,
//
//                 /// Icon
//                 SvgAsset(imagePath: imagePath),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }
class Diagram1Widget extends StatelessWidget {
  const Diagram1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorRes.white,
      padding: EdgeInsets.only(
        left: 16.pw,
        right: 16.pw,
        top: 30.ph,
        bottom: 50.ph,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Prevent vertical overflow
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Solar
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: buildIconWithText(
                    title: 'Solar',
                    value: '0kw',
                    isTwoItems: true,
                    isRtl: false,
                    isNotCenter: true,
                    imagePath: AssetRes.greenSolar2Icon,
                    isIconPrefix: true,
                  ),
                ),
              ),

              /// Spacer
              SizedBox(width: 16.pw),

              /// Grid
              Expanded(
                child: buildIconWithText(
                  isNotCenter: true,
                  title: 'Grid',
                  value: '0kw',
                  isTwoItems: true,
                  isRtl: true,
                  imagePath: AssetRes.gridIcon,
                  isIconPrefix: false,
                ),
              ),
            ],
          ),

          /// Space
          16.ph.spaceVertical,

          /// Diagram Icon
          SvgAsset(imagePath: AssetRes.diagram1Icon),

          /// Space
          10.ph.spaceVertical,

          /// Load
          buildIconWithText(
            title: 'Load',
            value: '0kw',
            imagePath: AssetRes.loadIcon,
            isIconPrefix: false,
          ),
        ],
      ),
    );
  }

  Widget buildIconWithText({
    required String imagePath,
    required String title,
    required String value,
    required bool isIconPrefix,
    bool isRtl = false,
    bool isTwoItems = false,
    bool isNotCenter = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment:
            isNotCenter
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isIconPrefix) SvgAsset(imagePath: imagePath),

          if (isIconPrefix) 14.pw.spaceHorizontal,

          /// Use Expanded instead of Flexible to take remaining space
          isTwoItems
              ? Expanded(
                child: Column(
                  crossAxisAlignment:
                      isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    ///Title
                    Text(
                      title,
                      style: styleW400S12.copyWith(color: ColorRes.black),
                    ),

                    ///Space
                    5.ph.spaceVertical,

                    ///Value
                    Text(
                      value,
                      style: styleW600S14.copyWith(color: ColorRes.black),
                    ),
                  ],
                ),
              )
              : Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ///Title
                    Text(
                      title,
                      textAlign: TextAlign.end,
                      style: styleW400S12.copyWith(color: ColorRes.black),
                    ),

                    ///Space
                    5.ph.spaceVertical,

                    ///Value
                    Text(
                      value,
                      style: styleW600S14.copyWith(color: ColorRes.black),
                    ),
                  ],
                ),
              ),

          if (!isIconPrefix) 14.pw.spaceHorizontal,

          if (!isIconPrefix) SvgAsset(imagePath: imagePath),
        ],
      ),
    );
  }
}
