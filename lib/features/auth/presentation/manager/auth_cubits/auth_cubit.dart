import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:gp_app/core/utils/classes/app_routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthCubit() : super(AuthInitial());

  String? userName;
  String? emailAddress;
  String? password;
  String? userType;

  void login({required String emailAddress, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      // save user info in cloud store
      _firestore.collection("users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': emailAddress,
        },
      );
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

  void signUp(
      {required String emailAddress,
      required String password,
      required String userName,
      required String userType}) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      //Create Folders
      firebase_storage.Reference userFolderRef =
          firebase_storage.FirebaseStorage.instance.ref().child('users');
      firebase_storage.Reference subFolder = userFolderRef.child(emailAddress);

      await subFolder.putString("");
      // save user info in cloud store
      _firestore.collection("users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': emailAddress,
        },
      );

      // __________________
      emit(RegisterSuccess());
      saveSignUpData(
          emailAddress: emailAddress,
          password: password,
          userName: userName,
          userType: userType);
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

  void saveSignUpData(
      {required String emailAddress,
      required String password,
      required String userName,
      required String userType}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('userName', userName);
    sharedPreferences.setString('emailAddress', emailAddress);
    sharedPreferences.setString('password', password);
    sharedPreferences.setString('userType', userType);
    print('saves Sucess');
  }

  void retrieveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userName = sharedPreferences.getString('userName');
    emailAddress = sharedPreferences.getString('emailAddress');
    password = sharedPreferences.getString('password');
    userType = sharedPreferences.getString('userType');
    print('userName : $userName');
    print('email $emailAddress');
    print('password $password');
    print('userType $userType');
  }

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      while (context.canPop()) {
        GoRouter.of(context).pop();
      }
      GoRouter.of(context).pushReplacement(AppRouter.login);
    }
  }

  // Checking Emails If the current user is present in the emails , ignored
  User? getCurrentuser() {
    return _auth.currentUser;
  }
}
