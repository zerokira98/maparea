part of 'app_bloc.dart';

@immutable
sealed class AppEvent with EquatableMixin {}

class UpdateLatLng extends AppEvent {
  @override
  List<Object?> get props => [];
}

class UpdateAll extends AppEvent {
  final AppState newstate;

  UpdateAll({required this.newstate});
  @override
  List<Object?> get props => [];
}

class Initialize extends AppEvent {
  @override
  List<Object?> get props => [];
}
