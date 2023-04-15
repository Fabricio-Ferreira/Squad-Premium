import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:squad_premium_test/core/error/failure.dart';

abstract class BaseUseCase {
  const BaseUseCase();
}

abstract class UseCase<Params, Type> extends BaseUseCase {
  Future<Type> call(Params params);
}

abstract class FutureUseCase<Params, Type> extends BaseUseCase {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
