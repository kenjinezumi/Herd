import 'package:hive/hive.dart';
import 'package:swipeable_stack/swipeable_stack.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject implements SwipeableStackIdentifiable {
  @HiveField(0)
  final int userId;
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
  final String? bio;
  @HiveField(8)
  final String? location;
  @HiveField(9)
  final String? phoneNumber;
  @HiveField(10)
  final Map<String, String> preferences;
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
  @HiveField(16)
  final DateTime? dateOfBirth; // Make it nullable
  @HiveField(17)
  final List<String>? likedBooks; // Make it nullable
  @HiveField(18)
  final List<String>? languages; // Make it nullable
  @HiveField(19)
  final List<String>? groups; // Make it nullable

  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
    required this.pictures,
    required this.createdAt,
    required this.updatedAt,
    this.bio,
    this.location,
    this.phoneNumber,
    required this.preferences,
    required this.interests,
    required this.deviceId,
    required this.deviceType,
    required this.eventIds,
    required this.groupIds,
    this.dateOfBirth, // Allow null value
    this.likedBooks, // Allow null value
    this.languages, // Allow null value
    this.groups, // Allow null value
  });

  @override
  String get id => userId.toString(); // Implement the id getter for SwipeableStackIdentifiable

  // Calculate age from date of birth
  int get age {
    if (dateOfBirth == null) {
      return 0; // Return a default age if dateOfBirth is null
    }
    final now = DateTime.now();
    int age = now.year - dateOfBirth!.year;
    if (now.month < dateOfBirth!.month || (now.month == dateOfBirth!.month && now.day < dateOfBirth!.day)) {
      age--;
    }
    return age;
  }
}
