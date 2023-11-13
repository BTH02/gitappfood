import 'dart:async';

import 'package:appfood/bloc/switch/switch_event.dart';
import 'package:appfood/bloc/switch/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc():super(const SwitchState()){
    on<OnSwitch>(_onSwitch);
    on<OffSwitch>(_offSwitch);
  }
  FutureOr<void> _onSwitch(OnSwitch event, Emitter<SwitchState> emit) {
    emit(
      state.copyWith(switchValue: true)
    );
  }
  FutureOr<void> _offSwitch(OffSwitch event, Emitter<SwitchState> emit) {
    emit(
      state.copyWith(switchValue: false)
    );
  }
}