import 'package:qbits/qbits.dart';

class ProfileInformationScreen extends StatelessWidget {
  const ProfileInformationScreen({super.key});

  static const routeName = "profile_information_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ProfileInformationProvider>(
      create: (c) => ProfileInformationProvider(),
      child: ProfileInformationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileInformationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(title: context.l10n?.profileInformation ?? ""),
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
                onTap: () => provider.onContinueTap(context),
              ),
            ),
          ),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              bottom:
                  Constants.safeAreaPadding.bottom +
                  Constants.horizontalPadding,
              top: 20.pw,
            ),
            child: Column(
              children: [
                ///Email
                AppTextField(
                  textInputType: TextInputType.emailAddress,
                  controller: provider.emailController,
                  header: context.l10n?.email ?? "",
                  hintText: context.l10n?.email ?? "",
                  error: provider.emailError,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
