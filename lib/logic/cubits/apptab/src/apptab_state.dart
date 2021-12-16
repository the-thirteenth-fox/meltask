part of 'apptab_cubit.dart';

abstract class AppTabState extends Equatable {
  const AppTabState();

  @override
  List<Object> get props => [];
}

class AppTabInitial extends AppTabState {}

class AppTabSelected extends AppTabState {
  const AppTabSelected(this.tabIndex);

  final int tabIndex;

  @override
  List<Object> get props => [tabIndex];
}
