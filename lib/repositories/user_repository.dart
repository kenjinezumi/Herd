import 'package:hive/hive.dart';
import '../models/user.dart';
import '../models/event.dart';
import '../models/group.dart';

class UserRepository {
  final Box<User> userBox;
  final Box<Event> eventBox;
  final Box<Group> groupBox;

  UserRepository(this.userBox, this.eventBox, this.groupBox);

  // Get a user by ID
  User? getUser(int id) {
    return userBox.get(id);
  }

  // Get all users
  List<User> getAllUsers() {
    return userBox.values.toList();
  }

  // Add a new user
  Future<void> addUser(User user) async {
    await userBox.put(user.id, user);
  }

  // Update an existing user
  Future<void> updateUser(User user) async {
    await userBox.put(user.id, user);
  }

  // Delete a user by ID
  Future<void> deleteUser(int id) async {
    await userBox.delete(id);
  }

  // Get events for a user
  List<Event> getUserEvents(int userId) {
    return eventBox.values.where((event) => event.userId == userId).toList();
  }

  // Get groups for a user
  List<Group> getUserGroups(int userId) {
    return groupBox.values.where((group) => group.userId == userId).toList();
  }

  // Add an event for a user
  Future<void> addUserEvent(Event event) async {
    await eventBox.put(event.id, event);
  }

  // Add a group for a user
  Future<void> addUserGroup(Group group) async {
    await groupBox.put(group.id, group);
  }

  // Delete an event by ID
  Future<void> deleteUserEvent(int eventId) async {
    await eventBox.delete(eventId);
  }

  // Delete a group by ID
  Future<void> deleteUserGroup(int groupId) async {
    await groupBox.delete(groupId);
  }
}
