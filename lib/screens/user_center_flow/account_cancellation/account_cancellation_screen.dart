import 'package:qbits/qbits.dart';

class AccountCancellationScreen extends StatelessWidget {
  const AccountCancellationScreen({super.key});

  static const routeName = "account_cancellation_screen";

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AccountCancellationProvider>(
      create: (c) => AccountCancellationProvider(),
      child: AccountCancellationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountCancellationProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorRes.white,
          appBar: CustomAppBar(title: context.l10n?.accountCancellation ?? ""),
          bottomNavigationBar: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 30.ph,
                left: 16.pw,
                right: 16.pw,
              ),
              child: SubmitButton(
                title: context.l10n?.submit ?? "",
                onTap: () => provider.onSubmit(context),
              ),
            ),
          ),
          body: CustomSingleChildScroll(
            padding: EdgeInsets.only(
              left: Constants.horizontalPadding,
              right: Constants.horizontalPadding,
              bottom: Constants.safeAreaPadding.bottom + Constants.horizontalPadding,
              top: 20.pw,
            ),
            child: Column(
              children: [
                /// Name
                AppTextField(
                  controller: provider.nameController,
                  header: context.l10n?.name ?? "",
                  hintText: context.l10n?.howDoIAddressYou ?? "",
                  error: provider.nameError,
                ),

                20.ph.spaceVertical,

                /// Contact Information
                AppTextField(
                  controller: provider.contactInformationController,
                  header: context.l10n?.contactInformation ?? "",
                  hintText: context.l10n?.contactInformation ?? "",
                  error: provider.contactInformationError,
                ),

                10.ph.spaceVertical,

                /// QQ
                AppTextField(
                  controller: provider.qqController,
                  hintText: context.l10n?.qq ?? "",
                  error: provider.qqError,
                ),

                10.ph.spaceVertical,

                /// Email
                AppTextField(
                  controller: provider.emailController,
                  hintText: context.l10n?.email ?? "",
                  error: provider.emailError,
                ),

                20.ph.spaceVertical,

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.l10n?.questionOrSuggestion ?? "",
                    style: styleW400S14.copyWith(
                      color: ColorRes.black2,
                    ),
                  ),
                ),

                10.ph.spaceVertical,

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorRes.lightGrey2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.ph),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been"
                      "the industry's standard dummy text",
                      style: styleW500S14.copyWith(
                        color: ColorRes.black2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
