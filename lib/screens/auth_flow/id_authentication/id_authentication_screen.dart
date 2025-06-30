import 'package:qbits/qbits.dart';

class IdAuthenticationScreen extends StatelessWidget {
  const IdAuthenticationScreen({super.key});

  static const routeName = "id_authentication_screen";

  static Widget builder(BuildContext context) {
    String? scanResult;

    if (context.args is String) {
      scanResult = context.args.toString();
    }
    return ChangeNotifierProvider<IdAuthenticationProvider>(
      create: (c) => IdAuthenticationProvider(scanResult: scanResult),
      child: IdAuthenticationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IdAuthenticationProvider>(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: Constants.horizontalPadding,
                right: Constants.horizontalPadding,
              ),
              child: SubmitButton(
                title: context.l10n?.continueCap ?? "",
                onTap: () {
                  state.onContinueTap(context);
                },
              ),
            ),
          ),
          appBar: CustomAppBar(title: context.l10n?.idAuthentication ?? ""),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding,
              vertical: Constants.safeAreaPadding.bottom + 20.pw,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ///Title
                    Text(
                      state.scanResult ?? "Unknown Device",
                      style: styleW600S16,
                    ),

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
                20.ph.spaceVertical,

                ///Account Number
                AppTextField(
                  controller: state.accountNumberController,
                  header: context.l10n?.account ?? "",
                  hintText: context.l10n?.account ?? "",
                  error: state.accountNumberError,
                ),

                ///Space
                20.ph.spaceVertical,

                ///Password
                AppTextField(
                  controller: state.passwordController,
                  error: state.pwdError,
                  hintText: context.l10n?.password,
                  header: context.l10n?.password,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: !state.isPwdVisible,
                  suffixIcon: AnimatedSwitcher(
                    duration: 300.milliseconds,
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: SvgAsset(
                      key: ValueKey<bool>(state.isPwdVisible),
                      imagePath:
                          state.isPwdVisible
                              ? AssetRes.eyeIcon
                              : AssetRes.invisibleIcon,
                    ),
                  ),
                  onSuffixTap: state.onPwdVisibilityChanged,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
