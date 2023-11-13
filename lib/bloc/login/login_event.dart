abstract class LoginEvent{
  const LoginEvent();
}
class FillPhoneNumber extends LoginEvent{
  final String phoneNumber;

  FillPhoneNumber(this.phoneNumber);
}