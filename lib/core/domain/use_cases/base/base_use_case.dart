import 'package:equatable/equatable.dart';

abstract class BaseUseCase {
  const BaseUseCase();
}

abstract class UseCase<Params, Type> extends BaseUseCase {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
