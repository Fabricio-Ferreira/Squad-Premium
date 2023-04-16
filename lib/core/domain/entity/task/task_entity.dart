// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskEntity {
  final int id;
  final String title;
  final String description;
  final bool isDone;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  TaskEntity copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
  }) =>
      TaskEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone,
      );

  @override
  String toString() =>
      'TaskEntity(id: $id, title: $title, description: $description, isDone: $isDone)';

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'isDone': isDone,
      };

  factory TaskEntity.fromMap(Map<String, dynamic> map) => TaskEntity(
        id: map['id'] as int,
        title: map['title'] as String,
        description: map['description'] as String,
        isDone: map['isDone'] as bool,
      );

  String toJson() => json.encode(toMap());

  factory TaskEntity.fromJson(String source) =>
      TaskEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
