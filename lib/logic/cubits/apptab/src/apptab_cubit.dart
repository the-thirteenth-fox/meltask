import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'apptab_state.dart';

class AppTabCubit extends Cubit<AppTabState> {
  AppTabCubit() : super(AppTabInitial());

  void selectTab(int i) => emit(AppTabSelected(i));
}
