part of 'app_bloc.dart';

class AppState extends Equatable {
  final bool onCreatedPin;
  final bool editmode;
  final bool showVisibleLatLng;
  final List<LatLng> visibleLatLng;
  final LatLng? mylocation;
  final LatLng? tappoint;

  const AppState(
      {required this.onCreatedPin,
      required this.editmode,
      required this.showVisibleLatLng,
      required this.visibleLatLng,
      this.mylocation,
      this.tappoint});

  static get initial => const AppState(
      onCreatedPin: false,
      editmode: false,
      visibleLatLng: [],
      showVisibleLatLng: false);

  @override
  List<Object?> get props => [
        onCreatedPin,
        editmode,
        visibleLatLng,
        mylocation,
        tappoint,
        showVisibleLatLng
      ];
  AppState copyWith(
      {bool? onCreatedPin,
      bool? editmode,
      bool? showVisibleLatLng,
      List<LatLng>? visibleLatLng,
      ValueGetter<LatLng?>? mylocation,
      ValueGetter<LatLng?>? tappoint}) {
    return AppState(
        onCreatedPin: onCreatedPin ?? this.onCreatedPin,
        editmode: editmode ?? this.editmode,
        showVisibleLatLng: showVisibleLatLng ?? this.showVisibleLatLng,
        visibleLatLng: visibleLatLng ?? this.visibleLatLng,
        mylocation: mylocation != null ? mylocation() : this.mylocation,
        tappoint: tappoint != null ? tappoint() : this.tappoint);
  }
}
