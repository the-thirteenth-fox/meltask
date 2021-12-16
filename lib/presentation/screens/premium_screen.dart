import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meltask/presentation/widgets/button.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 327;
    return Material(
      child: SafeArea(
        child: Container(
          width: isWide ? 327 : double.maxFinite,
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset('assets/icons/close.svg')),
              ),
              const Spacer(),
              SvgPicture.asset('assets/icons/icon.svg', height: 148),
              const SizedBox(height: 24),
              Text(
                'Meltask News',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text('Unlock all features just \$1.99 per week.'),
              const Spacer(),
              ButtonComponent(
                label: 'Subscribe',
                onTap: () {},
              ),
              const SizedBox(height: 29),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Restore Purchase',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.bodyText1!.color),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Privacy Policy',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.bodyText1!.color),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Terms of Use',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).textTheme.bodyText1!.color),
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
