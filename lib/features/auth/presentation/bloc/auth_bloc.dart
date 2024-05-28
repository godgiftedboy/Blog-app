import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/features/auth/domain/usecases/user_signup.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  //can also be directly dont as AuthBloc({required this._userSignUp})
  //neat way to initialize private variable
  //as we would have multiple use cases- prefer using named arguments
  AuthBloc({required UserSignUp userSignUp})
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignUp(UserSignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ));
      res.fold(
        (l) => emit(AuthFailure(l.message)),
        (r) => emit(AuthSuccess(r)),
      );
      // res.fold(
      //   (failure) => emit(AuthFailure(failure.message)),
      //   (uid) => emit(AuthSuccess(uid)),
      // );
    });
  }
}
