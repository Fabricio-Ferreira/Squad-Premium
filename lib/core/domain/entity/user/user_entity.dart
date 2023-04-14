// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String password;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [id, name, email, password];

  UserEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
  }) =>
      UserEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'password': password,
      };

  factory UserEntity.fromMap(Map<String, dynamic> map) => UserEntity(
        id: int.parse(map['id'] as String),
        name: map['name'] as String,
        email: map['email'] as String,
        password: map['password'] as String,
      );

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
