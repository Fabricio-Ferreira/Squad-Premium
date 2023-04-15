// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({required super.message});

  @override
  String toString() => 'BadRequestFailure(message: $message)';

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  @override
  String toString() => 'ServerFailure(message: $message)';

  @override
  List<Object> get props => [message];
}
