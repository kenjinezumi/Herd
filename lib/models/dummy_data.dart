import 'user.dart';
import 'event.dart';
import 'group.dart';

List<User> getDummyUsers() {
  return [
    User(
      id: 1,
      name: 'John Doe',
      email: 'john.doe@example.com',
      profilePictureUrl: 'https://via.placeholder.com/150',
      pictures: ['https://via.placeholder.com/150', 'https://via.placeholder.com/150'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bio: 'A software developer with a love for coffee and books.',
      location: 'New York, USA',
      phoneNumber: '123-456-7890',
      preferences: {'theme': 'dark'},
      interests: ['coding', 'reading', 'gaming'],
      deviceId: 'device_id_123',
      deviceType: 'android',
      eventIds: [1, 2],
      groupIds: [1],
    ),
  ];
}

List<Event> getDummyEvents() {
  return [
    Event(
      id: 1,
      name: 'Flutter Workshop',
      date: DateTime.now().add(Duration(days: 7)),
      location: 'Online',
      description: 'An online workshop on Flutter development.',
      userId: 1,
    ),
    Event(
      id: 2,
      name: 'Yoga Class',
      date: DateTime.now().add(Duration(days: 14)),
      location: 'Community Center',
      description: 'A relaxing yoga session.',
      userId: 1,
    ),
  ];
}

List<Group> getDummyGroups() {
  return [
    Group(
      id: 1,
      name: 'Book Club',
      description: 'A group for book enthusiasts.',
      userId: 1,
    ),
  ];
}
