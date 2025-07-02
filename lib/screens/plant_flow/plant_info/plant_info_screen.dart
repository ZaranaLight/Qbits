import 'package:qbits/qbits.dart';
import 'package:qbits/screens/plant_flow/plant_info/widget/plant_info_part_1.dart';
import 'package:qbits/screens/plant_flow/plant_info/widget/plant_info_part_2.dart';
import 'package:qbits/screens/plant_flow/plant_info/widget/plant_info_part_3.dart';

class PlantInfoScreen extends StatelessWidget {
  const PlantInfoScreen({super.key});

  static const routeName = "plant_info_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlantInfoProvider(),
      child: const PlantInfoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantInfoProvider>(
      builder: (context, provider, child) {
        return Scaffold(

          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            title: context.l10n?.plantInfo ?? "",
            actions: [
              InkWell(
                onTap: () {
                  provider.toggleEdit();
                },
                borderRadius: BorderRadius.circular(5.pw),
                child: Padding(
                  padding: EdgeInsets.all(19.0),
                  child: SvgAsset(
                    imagePath:
                        provider.isEditing
                            ? AssetRes.closeIcon
                            : AssetRes.editIcon,
                    color: ColorRes.white,
                  ),
                ),
              ),
            ],
          ),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              bottom: Constants.safeAreaPadding.bottom + 20.pw,

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlantInfoPart1(),
                16.ph.spaceVertical,
                PlantInfoPart2(),
                16.ph.spaceVertical,
                PlantInfoPart3(),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class PlantInfoPart1 extends StatelessWidget {
//   const PlantInfoPart1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PlantInfoProvider>(
//       builder: (context, provider, child) {
//         return Container(
//           color: ColorRes.white,
//           child: Column(
//             children: [
//               ...provider.fieldAccessors1.entries.map((entry) {
//                 final model = provider.plantInfo;
//                 final label = entry.key;
//                 final value = entry.value(model);
//
//                 return Column(
//                   children: [
//                     // SizedBox(
//                     //   height: 50.pw,
//                     //   child: ListTile(
//                     //     title: Text(label),
//                     //     trailing:
//                     //         provider.isEditing
//                     //             ? SizedBox(
//                     //               width: 200,
//                     //    qqq           child: Align(
//                     //                 alignment: Alignment.topRight,
//                     //                 child: AppTextField(
//                     //                   hintText: 'Enter ${label.toString()}',
//                     //                   fillColor: ColorRes.transparent,
//                     //                   borderRadius: 15.pw,
//                     //                   customPadding: EdgeInsets.zero,
//                     //                   maxWidth: 10,
//                     //                   textAlign: TextAlign.right,
//                     //
//                     //                   onChanged: (val) {
//                     //                     provider.updateField1(label, val);
//                     //                   },
//                     //                 ),
//                     //               ),
//                     //             )
//                     //             : Text(
//                     //               value.toString(),
//                     //               style: styleW500S14.copyWith(height: 0),
//                     //             ),
//                     //   ),
//                     // ),
//                     ///
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: Constants.horizontalPadding,
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(flex: 1, child: Text(label)),
//                           Expanded(
//                             flex: 2,
//                             child:
//                                 provider.isEditing
//                                     ? AppTextField(
//                                       textAlign: TextAlign.right,
//                                       hintText: 'Enter ${label.toString()}',
//                                       fillColor: ColorRes.transparent,
//                                       borderRadius: 15.pw,
//                                       customPadding: EdgeInsets.zero,
//                                       maxWidth: 10,
//                                       onChanged: (val) {
//                                         provider.updateField1(
//                                           label,
//                                           val.toString(),
//                                         );
//                                       },
//                                     )
//                                     : Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                           horizontal:
//                                               Constants.horizontalPadding,
//                                           vertical: 13.ph,
//                                         ),
//                                         child: Text(
//                                           value.toString(),
//                                           textAlign: TextAlign.right,
//                                           style: Theme.of(
//                                             context,
//                                           ).textTheme.bodyLarge?.copyWith(
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Divider(
//                       color: ColorRes.black.withValues(alpha: 0.1),
//                       height: 0,
//                     ),
//                   ],
//                 );
//               }),
//               provider.isEditing
//                   ? Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 24.pw,
//                     ),
//                     child: SubmitButton(title: context.l10n?.submit ?? ""),
//                   )
//                   : SizedBox(),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class PlantInfoPart2 extends StatelessWidget {
//   const PlantInfoPart2({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PlantInfoProvider>(
//       builder: (context, provider, child) {
//         return Container(
//           color: ColorRes.white,
//           child: Column(
//             children: [
//               ...provider.fieldAccessors2.entries.map((entry) {
//                 final model = provider.plantInfo;
//                 final label = entry.key;
//                 final value = entry.value(model);
//                 return Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: Constants.horizontalPadding,
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(flex: 2, child: Text(label)),
//                           Expanded(
//                             flex: 2,
//                             child:
//                                 provider.isEditing
//                                     ? AppTextField(
//                                       textAlign: TextAlign.right,
//                                       hintText: 'Enter ${label.toString()}',
//                                       fillColor: ColorRes.transparent,
//                                       borderRadius: 15.pw,
//                                       customPadding: EdgeInsets.zero,
//                                       maxWidth: 10,
//                                       onChanged: (val) {
//                                         print('label: $label, val: $val');
//                                         provider.updateField2(
//                                           label,
//                                           val.toString(),
//                                         );
//                                       },
//                                     )
//                                     : Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                           horizontal:
//                                               Constants.horizontalPadding,
//                                           vertical: 13.ph,
//                                         ),
//                                         child: Text(
//                                           value.toString(),
//                                           textAlign: TextAlign.right,
//                                           style: Theme.of(
//                                             context,
//                                           ).textTheme.bodyLarge?.copyWith(
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // SizedBox(
//                     //   height: 50.pw,
//                     //   child: ListTile(
//                     //     title: Text(label),
//                     //     trailing:
//                     //         provider.isEditing
//                     //             ? SizedBox(
//                     //               width: 100,
//                     //               child: Align(
//                     //                 alignment: Alignment.topRight,
//                     //                 child: AppTextField(
//                     //                   hintText: 'Text',
//                     //                   controller: TextEditingController(
//                     //                     text: value.toString(),
//                     //                   ),
//                     //                   fillColor: ColorRes.transparent,
//                     //                   borderRadius: 10.pw,
//                     //                   customPadding: EdgeInsets.zero,
//                     //                   maxWidth: 10,
//                     //                   textAlign: TextAlign.right,
//                     //                   onChanged: (val) {
//                     //                     provider.updateField2(label, val);
//                     //                   },
//                     //                 ),
//                     //               ),
//                     //             )
//                     //             : Text(
//                     //               value.toString(),
//                     //               style: styleW500S14.copyWith(height: 0),
//                     //             ),
//                     //   ),
//                     // ),
//                     Divider(
//                       color: ColorRes.black.withValues(alpha: 0.1),
//                       height: 0,
//                     ),
//                   ],
//                 );
//               }),
//               provider.isEditing
//                   ? Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 24.pw,
//                     ),
//                     child: SubmitButton(title: context.l10n?.submit ?? ""),
//                   )
//                   : SizedBox(),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class PlantInfoPart3 extends StatelessWidget {
//   const PlantInfoPart3({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PlantInfoProvider>(
//       builder: (context, provider, child) {
//         return Container(
//           color: ColorRes.white,
//           child: Column(
//             children: [
//               ...provider.fieldAccessors3.entries.map((entry) {
//                 final model = provider.plantInfo;
//                 final label = entry.key;
//                 final value = entry.value(model);
//
//                 return Column(
//                   children: [
//                     SizedBox(
//                       height: 50.pw,
//                       child: ListTile(
//                         title: Text(label),
//                         trailing:
//                             provider.isEditing
//                                 ? SizedBox(
//                                   width: 100,
//                                   child: Align(
//                                     alignment: Alignment.topRight,
//                                     child: AppTextField(
//                                       hintText: 'Text',
//                                       controller: TextEditingController(
//                                         text: value.toString(),
//                                       ),
//                                       fillColor: ColorRes.transparent,
//                                       borderRadius: 10.pw,
//                                       customPadding: EdgeInsets.zero,
//                                       maxWidth: 10,
//                                       textAlign: TextAlign.right,
//
//                                       onChanged: (val) {
//                                         provider.updateField2(label, val);
//                                       },
//                                     ),
//                                   ),
//                                 )
//                                 : Text(
//                                   value.toString(),
//                                   style: styleW500S14.copyWith(height: 0),
//                                 ),
//                       ),
//                     ),
//                     Divider(
//                       color: ColorRes.black.withValues(alpha: 0.1),
//                       height: 0,
//                     ),
//                   ],
//                 );
//               }),
//               provider.isEditing
//                   ? Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 24.pw,
//                     ),
//                     child: SubmitButton(title: context.l10n?.submit ?? ""),
//                   )
//                   : SizedBox(),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
