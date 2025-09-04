import 'package:flutter/material.dart';

import 'package:servizio_x/core/helpers/app_extensions.dart';

import 'package:servizio_x/core/helpers/size_boxes.dart';

import 'package:servizio_x/core/theme/app_color.dart';

import 'package:servizio_x/core/widgets/primary_button.dart';

import 'package:servizio_x/features/authentication/presentation/widgets/onboarding_container_widget.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//! OnboardingScreen: multi-page introductory screen shown at app launch.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

//! State that manages the PageController, button text and navigation logic.
class _OnboardingScreenState extends State<OnboardingScreen> {
  //* PageController used to control the PageView (programmatic navigation).
  late PageController pageController;

  @override
  void initState() {
    //* Initialize controller before calling super.
    pageController = PageController();
    super.initState();
  }

  //* ValueNotifier to manage the dynamic button text. in the first two page views. the button text should be "Continua", and on the last page it should change to "Inizia".
  ValueNotifier<String> buttonText = ValueNotifier("Continua");

  @override
  void dispose() {
    //* Dispose controller to avoid memory leaks.
    pageController.dispose();
    //* Dispose ValueNotifier to free resources.
    buttonText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(flex: 1, child: SizedBox()),

            Expanded(
              flex: 3,
              child: PageView(
                //* Reacts to page changes to update the bottom button text.
                onPageChanged: (value) {
                  //* If we're on the last page, change the button text to "Inizia".
                  if (value == 2) {
                    buttonText.value = "Inizia";
                  } else if (value == 1) {
                    //* Return to "Continua" when on the middle page.
                    buttonText.value = "Continua";
                  }
                },

                controller: pageController,
                //? allowImplicitScrolling enables preloading on some devices.
                allowImplicitScrolling: true,
                children: [
                  //! first onboarding page.
                  OnboardingContainerWidget(
                    imageName: 'benvenuto_onboarding_screen_icon',
                    primaryText: 'Benvenuto in ServizioX',
                    secondaryText:
                        'La piattaforma che connette persone per \noffrire e ricevere aiuto nella propria \ncomunità.',
                  ),
                  //! second onboarding page.
                  OnboardingContainerWidget(
                    imageName: 'richiedi_aiuto_onboarding_screen_icon',
                    primaryText: 'Richiedi Aiuto',
                    secondaryText:
                        'Cerca persone nella tua zona disposte \nad aiutarti con piccoli servizi quotidiani.',
                  ),

                  //! third onboarding page.
                  OnboardingContainerWidget(
                    imageName: 'comunicazione_sicura_onboarding_screen_icon',
                    primaryText: 'Comunicazione Sicura',
                    secondaryText:
                        'Chatta direttamente con gli altri utenti \nattraverso la nostra piattaforma sicura e \nprotetta.',
                  ),
                ],
              ),
            ),

            //* Page indicator: shows which page is active.
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColor.darkGreen,
                dotColor: AppColor.lightGrey,
                //? dot sizes scaled using context extensions (app_extensions).
                dotHeight: 10.h(context),
                dotWidth: 20.w(context),
                //? expansionFactor controls how much the active dot enlarges.
                expansionFactor: 15.w(context),
              ),
            ),

            heightSize(10, context),

            GestureDetector(
              onTap: () {
                pageController.page == 2
                    //TODO: implement the navigation to login
                    ? null
                    : pageController.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear,
                    );
              },

              //? Using ValueListenableBuilder to rebuild only the button when buttonText changes.
              child: ValueListenableBuilder(
                valueListenable: buttonText,
                builder: (context, value, child) {
                  //* Primary button: dynamic text (Continua / Inizia).
                  return primaryButton(text: value, context: context);
                },
              ),
            ),

            heightSize(20, context),
          ],
        ),
      ),
    );
  }
}
