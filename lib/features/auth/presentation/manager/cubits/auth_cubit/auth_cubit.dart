import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? email;
  String? password;
  // String userType = 'HR';
  // String? userName;

  void login({required String emailAddress, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(
            errorMessage: 'Wrong password provided for that user.'));
      } else {
        emit(
            LoginFailure(errorMessage: 'Something wrong , please try again !'));
      }
    }
  }

  void signUp({
    required String emailAddress,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            errorMessage: 'The account already exists for that email.'));
      } else {
        emit(RegisterFailure(
            errorMessage: 'Something wrong , please try again !'));
      }
    }
  }
}
