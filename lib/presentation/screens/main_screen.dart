import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meltask/logic/cubits/apptab/apptab.dart';
import 'package:meltask/presentation/screens/favorites_screen.dart';
import 'package:meltask/presentation/screens/home_screen.dart';
import 'package:meltask/presentation/screens/newpost_screen.dart';
import 'package:meltask/presentation/screens/settings_screen.dart';
import 'package:meltask/presentation/widgets/tab_selector.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppTabCubit, AppTabState>(
      builder: (context, state) {
        Widget currentScreen = const HomeScreen();

        if (state is AppTabSelected) {
          final appTab = state.tabIndex;

          if (appTab == 0) {
            currentScreen = const HomeScreen();
          } else if (appTab == 1) {
            currentScreen = const FavoritesScreen();
          } else if (appTab == 2) {
            currentScreen = const NewPostScreen();
          } else if (appTab == 3) {
            currentScreen = const SettingsScreen();
          }
        }

        return Scaffold(
          body: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: currentScreen),
          bottomNavigationBar: TabSelector(
              activeTab: (state is AppTabSelected) ? state.tabIndex : 0,
              onTabSelected: (appTab) =>
                  context.read<AppTabCubit>().selectTab(appTab)),
        );
      },
    );
  }
}
