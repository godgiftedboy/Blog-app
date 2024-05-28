//Every usecase should have only one function
//Single Responsibility Principle
import 'package:blog_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UserCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params);
}
