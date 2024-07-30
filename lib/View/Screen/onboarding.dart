
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/onboarding_controller.dart';
import '../../Core/constent/appcolor.dart';
import '../Widget/onboarding/custombutton.dart';
import '../Widget/onboarding/customslider.dart';
import '../Widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp()) ;
    return Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: Column(children: [
            const Expanded(
              flex: 5,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}
