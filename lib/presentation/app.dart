import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meltask/core/core.dart';
import 'package:meltask/core/src/theme.dart';
import 'package:meltask/data/newsapi_repository/newsapi.dart';
import 'package:meltask/data/newshive_repository/newshive.dart';
import 'package:meltask/logic/blocs/favoritesnews/favoritesnews_bloc.dart';
import 'package:meltask/logic/blocs/news/news.dart';
import 'package:meltask/logic/cubits/apptab/apptab.dart';

import 'screens/main_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocProvider(
      create: (_) => FavoritesNewsBloc(newsRepository: NewsHive())
        ..add(const FavoritesNewsRequsted()),
      child: MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: showOnboarding ? '/onboarding' : '/',
        debugShowCheckedModeBanner: false,
        theme: MeltaskTheme.lightThemeData,
        darkTheme: MeltaskTheme.darkThemeData,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AppTabCubit(),
            ),
            BlocProvider(
              create: (context) => NewsBloc(newsRepository: NewsAPI())
                ..add(const NewsRequsted('IT')),
            ),
          ],
          child: const MainScreen(),
        ),
      ),
    );
  }
}
