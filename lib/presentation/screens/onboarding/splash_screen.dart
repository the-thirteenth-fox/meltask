import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .whenComplete(() => Navigator.pushNamed(context, '/'));
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
              const SizedBox(height: 67),
              Image.asset(
                'assets/images/metamask.png',
                height: 103,
              ),
              const SizedBox(height: 24),
              const CupertinoActivityIndicator(
                radius: 14,
              ),
              const SizedBox(height: 24),
              const Text(
                "Создание вашего кошелька...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Это не займет много времени",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
