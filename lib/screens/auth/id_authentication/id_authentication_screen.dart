import 'package:qbits/qbits.dart';
import 'package:qbits/screens/auth/id_authentication/id_authentication_provider.dart';

class IdAuthenticationScreen extends StatelessWidget {
  const IdAuthenticationScreen({super.key});

  static const routeName = "id_authentication_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<IdAuthenticationProvider>(
      create: (c) => IdAuthenticationProvider(),
      child: IdAuthenticationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IdAuthenticationProvider>(
      builder: (context,state, child) {
        return Scaffold(
          appBar: CustomAppBar(title: context.l10n?.idAuthentication ?? ""),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.pw,
              vertical: Constants.safeAreaPadding.bottom + 20.pw,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ///Title
                    Text(context.l10n?.fireBolt146 ?? "", style: styleW600S16),

                    ///Space
                    8.pw.spaceHorizontal,

                    ///Bluetooth Icon
                    Container(
                      decoration: BoxDecoration(
                        color: ColorRes.primaryColor,
                        borderRadius: BorderRadius.circular(5.pw),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.pw,
                        vertical: 2.pw,
                      ),
                      child: Icon(
                        Icons.bluetooth_outlined,
                        color: ColorRes.white,
                        size: 17.pw,
                      ),
                    ),
                  ],
                ),
                ///Space
                20.pw.spaceVertical,

                // AppTextField(
                //   controller: state.accountController,
                //   header: context.l10n?.account ?? "",
                //   hintText: context.l10n?.account ?? "",
                //   error: state.accountError,
                // ),


              ],
            ),
          ),
        );
      }
    );
  }
}
