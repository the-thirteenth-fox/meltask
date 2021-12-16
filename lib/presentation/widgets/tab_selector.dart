import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({
    Key? key,
    required this.activeTab,
    required this.onTabSelected,
  }) : super(key: key);

  final int activeTab;
  final Function(int) onTabSelected;

  static const svgIcons = [
    'house',
    'star',
    'pen',
    'settings',
  ];

  static const labels = [
    'Home',
    'Favorites',
    'New Post',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabSelected,
      type: BottomNavigationBarType.fixed,
      currentIndex: activeTab,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedFontSize: 14,
      unselectedItemColor: Theme.of(context).hintColor,
      unselectedLabelStyle: TextStyle(
        color: Theme.of(context).hintColor,
        fontSize: 10,
        height: 1.9,
        fontWeight: FontWeight.w500,
      ),
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 10,
        height: 1.9,
        fontWeight: FontWeight.w500,
      ),
      items: List<BottomNavigationBarItem>.generate(4, (index) {
        final Widget icon = SvgPicture.asset(
          'assets/icons/${svgIcons[index]}.svg',
          color: Theme.of(context).hintColor,
        );
        final Widget activeIcon = SvgPicture.asset(
          'assets/icons/${svgIcons[index]}.svg',
          color: Theme.of(context).primaryColor,
        );

        return BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          label: labels[index],
        );
      }),
    );
  }
}
