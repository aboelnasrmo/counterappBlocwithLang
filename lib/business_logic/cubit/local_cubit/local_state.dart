part of 'local_cubit.dart';

@immutable
abstract class LocalState {}

class LocalInitial extends LocalState {}

class ChangeLocalState extends LocalState {
  final Locale locale;
  ChangeLocalState(this.locale);
}
