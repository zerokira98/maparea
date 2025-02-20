import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial) {
    on<Initialize>((event, emit) {});
    on<UpdateAll>((event, emit) {
      emit(event.newstate);
    });
  }
}
