import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String password;
  final bool hasTasks;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.hasTasks,
  });

  @override
  List<Object> get props => [id, name, email, password];

  UserEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    bool? hasTasks,
  }) =>
      UserEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        hasTasks: hasTasks ?? this.hasTasks,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'hasTasks': hasTasks,
      };

  factory UserEntity.fromMap(Map<String, dynamic> map) => UserEntity(
        id: map['id'] as int,
        name: map['name'] as String,
        email: map['email'] as String,
        password: map['password'] as String,
        hasTasks: map['hasTasks'] as bool,
      );

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
