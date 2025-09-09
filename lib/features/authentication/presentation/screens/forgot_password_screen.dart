import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:servizio_x/core/helpers/app_extensions.dart';
import 'package:servizio_x/core/helpers/size_boxes.dart';
import 'package:servizio_x/core/theme/app_color.dart';
import 'package:servizio_x/core/theme/text_styles.dart';
import 'package:servizio_x/core/widgets/primary_button.dart';
import 'package:servizio_x/core/widgets/primary_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        surfaceTintColor: AppColor.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w(context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),
              //! icon
              Image.asset(
                'lib/core/assets/images/forget_password_icon.png',
                width: 400.w(context),
                height: 200.h(context),
              ),

              //!Password dimenticata?
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h(context)),
                child: AutoSizeText(
                  'Password dimenticata?',
                  style: TextStyles.darkGreenBold.copyWith(fontSize: 25),
                ),
              ),
              //! description
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h(context)),
                child: AutoSizeText(
                  'Non si preoccupi, Inserisca il suo indirizzo email e le invieremo le istruzioni per reimpostare la password.',
                  style: TextStyles.greyW500.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              heightSize(20, context),
              //! email field
              PrimaryTextField(
                controller: emailController,
                hintText: 'Inserisca il suo indirizzo email',
                suffixIcon: Icon(Icons.mail),
                title: 'Email',
                textInputAction: TextInputAction.done,
              ),
              heightSize(30, context),
              //! Recupera password button
              primaryButton(text: 'Recupera password', context: context),
              heightSize(30, context),
              //! Ha ricordato la password? Acceda al suo account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Ha ricordato la password?',
                    style: TextStyles.greyW500.copyWith(fontSize: 15),
                    maxLines: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      // back to login screen
                      Navigator.pop(context);
                    },
                    child: AutoSizeText(
                      ' Acceda al suo account',
                      style: TextStyles.darkGreenW500..copyWith(fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
