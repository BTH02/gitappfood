import 'dart:async';

import 'package:appfood/bloc/login/login_event.dart';
import 'package:appfood/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<FillPhoneNumber>(_fillPhoneNumber);
  }

  FutureOr<void> _fillPhoneNumber(
      FillPhoneNumber event, Emitter<LoginState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }
}
