import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Event extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String location;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final int userId;

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.location,
    required this.description,
    required this.userId,
  });

  // Method to create an Event instance from JSON
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  // Method to convert Event instance to JSON
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
