import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'event.dart';
import 'group.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class User extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String profilePictureUrl;

  @HiveField(4)
  final List<String> pictures;

  @HiveField(5)
  final DateTime createdAt;

  @HiveField(6)
  final DateTime updatedAt;

  @HiveField(7)
  final String bio;

  @HiveField(8)
  final String location;

  @HiveField(9)
  final String phoneNumber;

  @HiveField(10)
  final Map<String, dynamic> preferences;

  @HiveField(11)
  final List<String> interests;

  @HiveField(12)
  final String deviceId;

  @HiveField(13)
  final String deviceType;

  @HiveField(14)
  final List<int> eventIds;

  @HiveField(15)
  final List<int> groupIds;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
    required this.pictures,
    required this.createdAt,
    required this.updatedAt,
    this.bio = '',
    this.location = '',
    this.phoneNumber = '',
    this.preferences = const {},
    this.interests = const [],
    this.deviceId = '',
    this.deviceType = '',
    this.eventIds = const [],
    this.groupIds = const [],
  });

  // Method to create a User instance from JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Method to convert User instance to JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
