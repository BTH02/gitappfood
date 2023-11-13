import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String? phoneNumber;

  const LoginState({this.phoneNumber});

  LoginState copyWith({
    String? phoneNumber,
  }) {
    return LoginState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override

  List<Object?> get props => [phoneNumber];
}
