import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Group extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int userId;

  Group({
    required this.id,
    required this.name,
    required this.description,
    required this.userId,
  });

  // Method to create a Group instance from JSON
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  // Method to convert Group instance to JSON
  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
