import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('onChange(${bloc.runtimeType}, $change)');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    log('onCreate(${bloc.runtimeType})');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('onError(${bloc.runtimeType}, $event)');
    super.onEvent(bloc, event);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () => BlocOverrides.runZoned(() async => runApp(await builder()),
        blocObserver: AppBlocObserver()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
