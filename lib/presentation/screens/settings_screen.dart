import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'Settings',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).hintColor.withOpacity(0.2),
                    width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CellItem(
                      label: 'Privacy',
                      onSelected: () {},
                    ),
                    CellItem(
                      label: 'Terms of Use',
                      onSelected: () {},
                    ),
                    CellItem(
                      label: 'Share This App',
                      onSelected: () {},
                    ),
                    CellItem(
                      label: 'Restore Purchase',
                      onSelected: () {},
                    ),
                    CellItem(
                      label: 'PRO Author Subscription',
                      highlighted: true,
                      onSelected: () {
                        Navigator.pushNamed(context, '/premium');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CellItem extends StatelessWidget {
  const CellItem({
    Key? key,
    required this.label,
    required this.onSelected,
    this.highlighted = false,
  }) : super(key: key);

  final String label;
  final VoidCallback onSelected;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        constraints:
            BoxConstraints.tight(Size(double.maxFinite, highlighted ? 35 : 47)),
        child: Column(
          mainAxisAlignment:
              highlighted ? MainAxisAlignment.start : MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: highlighted
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).textTheme.bodyText1!.color,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 1),
              ],
            ),
            highlighted
                ? const SizedBox()
                : Divider(color: Theme.of(context).hintColor.withOpacity(0.2)),
          ],
        ),
      ),
    );
  }
}
