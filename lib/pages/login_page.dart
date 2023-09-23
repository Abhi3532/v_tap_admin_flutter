import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:v_tap_admin_flutter/components/app_text_field.dart';
import 'package:v_tap_admin_flutter/components/common_button.dart';
import 'package:v_tap_admin_flutter/core/navigator/app_router.gr.dart';
import 'package:v_tap_admin_flutter/core/persistence/preference_helper.dart';
import 'package:v_tap_admin_flutter/core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:v_tap_admin_flutter/core/utils/app_utils.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AppLocalizations appLocalization;

  @override
  Widget build(BuildContext context) {
    appLocalization = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Text(
                appLocalization.v_tap,
                style: const TextStyle(fontSize: 38),
              ),
            ),
            SizedBox(
              width: 375,
              child: AppTextField(
                controller: emailController,
                hintText: appLocalization.email_address,
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: ColorConstants.black1),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: ColorConstants.black1),
                suffixIcon: const Icon(
                  Icons.email_outlined,
                  size: 35,
                ),
                maxLine: 1,
                onFieldSubmitted: () {
                  onLoginButtonClick();
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 375,
              color: ColorConstants.grey1,
              height: 1,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 375,
              child: AppTextField(
                obscureText: isObscure,
                controller: passwordController,
                hintText: appLocalization.password,
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: ColorConstants.black1),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: ColorConstants.black1),
                suffixIcon: Align(
                  widthFactor: 1.0,
                  heightFactor: 1.0,
                  child: InkWell(
                    onTap: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    child: Icon(
                        (isObscure)
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        size: 35),
                  ),
                ),
                maxLine: 1,
                onFieldSubmitted: () {
                  onLoginButtonClick();
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 375,
              color: ColorConstants.grey1,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            CommonButton(
              width: 375,
              text: appLocalization.sign_in,
              textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.black1),
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              borderRadius: 63,
              onTap: () {
                onLoginButtonClick();
              },
            )
          ],
        ),
      ),
    );
  }

  void onLoginButtonClick() async {
    if (emailController.text.trim().isEmpty) {
      AppUtils.showToaster(
        appLocalization.please_enter_email,
      );
    } else if (!AppUtils.isEmailValid(emailController.text.trim())) {
      AppUtils.showToaster(appLocalization.please_enter_valid_email);
    } else if (passwordController.text.trim().isEmpty) {
      AppUtils.showToaster(appLocalization.please_enter_password);
    } else if (passwordController.text.trim().length < 8) {
      AppUtils.showToaster(appLocalization.password_must_more_than_8);
    } else {
      await PreferenceHelper.setBoolValues();
      if (mounted) {
        context.router.replace(const HomeRoute());
      }
    }
  }
}
