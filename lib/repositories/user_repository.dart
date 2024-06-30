import 'package:hive/hive.dart';
import 'package:collection/collection.dart';
import '../models/user.dart';
import '../models/event.dart';
import '../models/group.dart';

class UserRepository {
  final Box<User> userBox;
  final Box<Event> eventBox;
  final Box<Group> groupBox;

  UserRepository(this.userBox, this.eventBox, this.groupBox);

  User? getUser(int id) {
    return userBox.get(id);
  }

  List<Event> getUserEvents(int userId) {
    return eventBox.values.where((event) => event.userId == userId).toList();
  }

  List<Group> getUserGroups(int userId) {
    return groupBox.values.where((group) => group.userId == userId).toList();
  }

  Future<User?> login(String email, String password) async {
    // Mock login logic
    final user = userBox.values.firstWhereOrNull(
      (user) => user.email == email && user.preferences['password'] == password,
    );
    return user;
  }

  Future<bool> register(User user, String password) async {
    // Mock registration logic
    if (userBox.values.any((u) => u.email == user.email)) {
      return true; // User already exists
    }
    userBox.add(user..preferences['password'] = password);
    return true;
  }
}
