import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'skills_row_state.dart';

class SkillsRowCubit extends Cubit<SkillsRowState> {
  List<AnimationController> animationControllerList = [];
  SkillsRowCubit() : super(SkillsRowState(false));

  void initAnimatedController(AnimationController controller, int i) {
    animationControllerList.add(controller);
  }

  void startAnimation() {
    emit(state.copyWith(animated: true));
  }

  void stopAnimation() {
    // for (var i in animationControllerList) {
    //   i.reset();
    // }
    emit(state.copyWith(animated: false));
  }
}
