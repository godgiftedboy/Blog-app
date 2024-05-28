import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecases/usecase.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UserCase<String, UserSignUpParams> {
  @override
  Future<Either<Failure, String>> call(Params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
