import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:servizio_x/core/helpers/app_extensions.dart';
import 'package:servizio_x/core/helpers/size_boxes.dart';
import 'package:servizio_x/core/theme/app_color.dart';
import 'package:servizio_x/core/widgets/primary_button.dart';
import 'package:servizio_x/core/widgets/primary_text_field.dart';

import '../../../../core/theme/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nomeController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController dataDiNascitaController;
  late TextEditingController comuneController;
  String? sesso;
  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    dataDiNascitaController = TextEditingController();
    comuneController = TextEditingController();
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    passwordController.dispose();
    dataDiNascitaController.dispose();
    comuneController.dispose();
    super.dispose();
  }

  DateTime? selectedDate;

  bool obscurePassword = true;
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
        padding: EdgeInsets.symmetric(horizontal: 50.w(context)),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity),

              //! logo
              Image.asset(
                'lib/core/assets/images/servizioX_logo.png',
                height: 100.h(context),
                width: 200.w(context),
              ),
              //! Crea il tuo account
              AutoSizeText(
                'Crea il tuo account',
                style: TextStyles.darkGreenBold.copyWith(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              //!Unisciti alla community ServzioX
              heightSize(10, context),
              AutoSizeText(
                'Unisciti alla community ServzioX',
                style: TextStyles.greyW400.copyWith(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              heightSize(30, context),
              //!nome field
              PrimaryTextField(
                controller: nomeController,
                hintText: 'Inserisci il tuo nome',
                suffixIcon: Icon(Icons.person),
                textInputAction: TextInputAction.next,

                title: 'Nome',
              ),
              heightSize(20, context),
              //!email field
              PrimaryTextField(
                controller: emailController,
                hintText: 'Inserisci la tua email',
                suffixIcon: Icon(Icons.mail),
                textInputAction: TextInputAction.next,

                title: 'Email',
              ),
              heightSize(20, context),
              //!Password field
              StatefulBuilder(
                builder: (BuildContext context, setShowPasswordState) {
                  return PrimaryTextField(
                    title: 'Password',
                    controller: passwordController,
                    textInputAction: TextInputAction.next,
                    obscureText: obscurePassword,
                    hintText: 'Crea una password sicura',
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
              heightSize(20, context),
              //!Data di nascita
              dataDiNascita(),
              heightSize(20, context),
              //!sesso
              Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText('Sesso', style: TextStyles.blackW500),
              ),
              heightSize(10, context),
              selezionaSesso(),
              heightSize(20, context),

              //!comune
              PrimaryTextField(
                controller: comuneController,
                hintText: 'Inserisci il tuo comune',
                suffixIcon: Icon(Icons.location_on_sharp),
                textInputAction: TextInputAction.done,
                title: 'Comune',
              ),
              heightSize(20, context),

              //! data security
              Container(
                width: double.infinity,
                height: 80.h(context),
                alignment: Alignment.centerLeft,

                decoration: BoxDecoration(
                  color: AppColor.lightGreen,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.mediumLightGreen,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w(context),
                  vertical: 5.h(context),
                ),
                child: FittedBox(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.security_sharp,
                            size: 18,
                            color: AppColor.darkGreen,
                          ),
                        ),
                        TextSpan(
                          text:
                              '  I tuoi dati saranno trattati con \nriservatezza.',
                          style: TextStyles.darkGreenW500.copyWith(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              heightSize(20, context),
              //! Registrati button
              primaryButton(text: 'Registrati', context: context),
              heightSize(30, context),
              //!Hai già un account? Accedi qui
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Hai già un account?',
                    style: TextStyles.greyW500.copyWith(fontSize: 15),
                    maxLines: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      // back to login screen
                      Navigator.pop(context);
                    },
                    child: AutoSizeText(
                      '  Accedi qui',
                      style: TextStyles.darkGreenW500..copyWith(fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              heightSize(40, context),
            ],
          ),
        ),
      ),
    );
  }

  StatefulBuilder selezionaSesso() {
    return StatefulBuilder(
      builder: (BuildContext context, setSessoState) {
        return Container(
          height: 60.h(context),
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColor.lightWhite,
            border: Border.all(color: AppColor.lightGrey, width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  hint:
                      sesso == null
                          ? Text('Seleziona', style: TextStyles.greyW400)
                          : Text(sesso!, style: TextStyles.blackW500),
                  alignment: Alignment.centerRight,

                  items: [
                    DropdownMenuItem(value: 'Femmina', child: Text('Femmina')),
                    DropdownMenuItem(value: 'Maschio', child: Text('Maschio')),
                  ],
                  isDense: true,

                  underline: SizedBox(),
                  icon: SizedBox(),
                  onChanged: (value) {
                    sesso = value;
                    setSessoState(() {});
                  },
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: sesso == null ? AppColor.lightGrey : AppColor.black,
              ),
            ],
          ),
        );
      },
    );
  }

  StatefulBuilder dataDiNascita() {
    return StatefulBuilder(
      builder: (BuildContext context, setDateState) {
        return GestureDetector(
          onTap: () async {
            DateTime currentDate = DateTime.now();
            final pickedDate = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: currentDate,
              initialDate: selectedDate,
              initialDatePickerMode: DatePickerMode.year,
            );
            if (pickedDate != null) {
              selectedDate = pickedDate;
              dataDiNascitaController.text =
                  '${selectedDate!.day} /${selectedDate!.month} /${selectedDate!.year}';
              setDateState(() {});
            }
          },
          child: PrimaryTextField(
            controller: dataDiNascitaController,
            enabled: false,
            title: 'Data di nascita',

            hintText:
                selectedDate == null
                    ? 'dd /mm /yyyy'
                    : '${selectedDate!.day} /${selectedDate!.month} /${selectedDate!.year}',
            suffixIcon: Icon(
              Icons.calendar_month,
              color: selectedDate == null ? AppColor.lightGrey : AppColor.black,
            ),
          ),
        );
      },
    );
  }
}
