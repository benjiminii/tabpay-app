part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState(
      {@Default(false) bool loading,
      @Default("") String phoneNumber,
      @Default("") String verificationId}) = _LoginState;

  factory LoginState.initial() => const LoginState();

  factory LoginState.fromJson(Map<String, dynamic> json) =>
      _$LoginStateFromJson(json);
}
