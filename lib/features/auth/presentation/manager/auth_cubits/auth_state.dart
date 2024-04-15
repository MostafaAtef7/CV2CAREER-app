part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final String checkHR;
  LoginSuccess({required this.checkHR});

}

final class LoginFailure extends AuthState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
    final String checkHR;
  RegisterSuccess({required this.checkHR});
}

final class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}
