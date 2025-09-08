import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:servizio_x/core/helpers/app_extensions.dart';
import 'package:servizio_x/core/helpers/size_boxes.dart';
import 'package:servizio_x/core/theme/app_color.dart';
import 'package:servizio_x/core/theme/text_styles.dart';
import 'package:servizio_x/core/widgets/primary_button.dart';

import '../../../../core/widgets/primary_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w(context)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: double.infinity),
                heightSize(50, context),

                heightSize(40, context),
                //! logo
                Image.asset(
                  'lib/core/assets/images/servizioX_logo.png',
                  height: 100.h(context),
                  width: 200.w(context),
                ),
                heightSize(20, context),
                //! bentornato (welcome back)
                AutoSizeText(
                  'Bentornato',
                  style: TextStyles.darkGreenBold.copyWith(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                heightSize(10, context),
                //! Accedi al tuo account ServzioX (Log in to your ServzioX account)
                AutoSizeText(
                  'Accedi al tuo account ServzioX',
                  style: TextStyles.greyW400.copyWith(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                heightSize(20, context),

                //!email field
                PrimaryTextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  title: 'Email',
                  hintText: 'Inserisci la tua email',
                  suffixIcon: Icon(Icons.email),
                ),
                heightSize(30, context),
                //!password field
                StatefulBuilder(
                  builder: (BuildContext context, setShowPasswordState) {
                    return PrimaryTextField(
                      title: 'Password',
                      controller: passwordController,
                      textInputAction: TextInputAction.done,
                      obscureText: obscurePassword,
                      hintText: 'Inserisci la tua password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          obscurePassword = !obscurePassword;
                          setShowPasswordState(() {});
                        },
                        child: Icon(
                          obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    );
                  },
                ),

                //! Hai dimenticato la password?
                heightSize(20, context),
                Align(
                  alignment: Alignment.centerRight,
                  child: AutoSizeText(
                    'Hai dimenticato la password?',
                    style: TextStyles.darkGreenW500,
                  ),
                ),
                heightSize(10, context),

                //! Accedi
                primaryButton(text: 'Accedi', context: context),

                //! ---- oppure----
                heightSize(20, context),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 60.h(context),
                        color: AppColor.lightGrey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('oppure', style: TextStyles.greyW400),
                    ),
                    Expanded(
                      child: Divider(
                        height: 60.h(context),
                        color: AppColor.lightGrey,
                      ),
                    ),
                  ],
                ),

                //! Continua con Google
                primaryButton(
                  text: 'Continua con Google',
                  textStyle: TextStyles.blackW500,
                  buttonColor: AppColor.white,
                  border: Border.all(color: AppColor.lightGrey, width: 2),
                  prefixWidget: Container(
                    width: 60.w(context),
                    height: 30.h(context),
                    child: Image.asset(
                      'lib/core/assets/images/google_icon.png',
                    ),
                  ),
                  context: context,
                ),
                heightSize(100, context),
                //! Non hai ancora un account? Registrati qui
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Non hai ancora un account? ',
                      style: TextStyles.greyW500.copyWith(fontSize: 13),
                      maxLines: 2,
                    ),
                    AutoSizeText(
                      'Registrati qui',
                      style: TextStyles.darkGreenW500..copyWith(fontSize: 13),
                      maxLines: 2,
                    ),
                  ],
                ),
                heightSize(40, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
