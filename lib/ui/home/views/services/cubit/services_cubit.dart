import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  late AnimationController animatedController;
  ServicesCubit() : super(ServicesState(150, 150));

  setController(AnimationController controller) {
    animatedController = controller;
  }

  zoomIn() {
    emit(state.copyWith(height: 160, width: 160));
  }

  zoomOut() {
    emit(state.copyWith(height: 150, width: 150));
  }
}
