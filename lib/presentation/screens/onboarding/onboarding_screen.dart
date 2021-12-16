import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'onboarding_detailed_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 13),
              SvgPicture.asset('assets/icons/name.svg'),
              const SizedBox(height: 45),
              const SizedBox(
                child: Text(
                  "Настройка кошелька",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Ипортируйте существующий кошелек или создайте новый",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            const OnboardingDetailedScreen())),
                child: Container(
                  alignment: Alignment.center,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xff047dd6),
                  ),
                  child: const Text(
                    'Создать новый кошелёк',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 78),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "By proceeding, you agree to these .",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    "Условия",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).hintColor,
                      fontSize: 11,
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
