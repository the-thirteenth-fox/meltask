import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meltask/presentation/screens/onboarding/splash_screen.dart';

class OnboardingDetailedScreen extends StatelessWidget {
  const OnboardingDetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 13),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/metamask.png',
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset('assets/icons/name.svg'),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  "Помогите нам улушить MetaMask",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "MetaMask хотел бы собрать основные данные об использовании, чтобы лучше понять, как наши пользователи взаимодействуют с мобильным приллжением. Эти данные будут использоваться для постоянного улучшения удобства и опыта использования нашего продукта.",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "MetaMask будет...",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 24),
                const ActionsHints(
                    titile: 'Всегда разрешать вам отказаться через настройки'),
                const SizedBox(height: 24),
                const ActionsHints(
                    titile:
                        'Отправлять анонимизированные события кликов и просмотров страниц'),
                const SizedBox(height: 24),
                const ActionsHints(
                    titile:
                        'Отправлять информацию о стране, регионе и городе (без конкретного местоположения)'),
                const SizedBox(height: 24),
                const ActionsHints(
                    titile:
                        'Никогда не хранить ключи, адреса, транзакции, балансы, хэши и любую персональную информацию"',
                    positive: false),
                const SizedBox(height: 24),
                const ActionsHints(
                    titile: 'Никогда не сохранять ваш IP-aдрес',
                    positive: false),
                const SizedBox(height: 24),
                const ActionsHints(
                    titile: 'Никогда не продавать данные для прибыли. Никогда!',
                    positive: false),
                const SizedBox(height: 24),
                Text(
                  "Эти данные агрегированы и поэтому анонимны для целей Общего регламента по защите данных (EС) 2016/679. Для получения дополнительной информации о нашей политике конфиденциальности ознакомьтесь с нашей Политикой конфиденциальности здесь.",
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const SplashScreen()),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color(0xff6b727c),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "Нет, спасибо",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 17),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xff047dd6),
                          ),
                          child: const Text(
                            "Я согласен",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActionsHints extends StatelessWidget {
  const ActionsHints({
    Key? key,
    required this.titile,
    this.positive = true,
  }) : super(key: key);

  final String titile;
  final bool positive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        positive
            ? SvgPicture.asset(
                'assets/icons/tick.svg',
                color: const Color(0xff2db449),
              )
            : SvgPicture.asset(
                'assets/icons/cross.svg',
                color: const Color(0xffdd3c4b),
              ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            titile,
            style: const TextStyle(
              height: 1.4,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
