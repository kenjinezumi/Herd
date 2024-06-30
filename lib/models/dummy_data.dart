import 'user.dart';
import 'event.dart';
import 'group.dart';

List<User> getDummyUsers() {
  return [
    User(
      userId: 1,
      name: 'Godzilla',
      email: 'john.doe@example.com',
      profilePictureUrl: 'assets/images/godzilla.png',
      pictures: ['assets/images/godzilla.png', 'assets/images/godzilla.png'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bio: 'King of the Monsters. Professional city-crusher. Amateur sushi chef. Towering at 350 feet, I\’m a big guy with an even bigger heart... mostly metaphorically. Awakened from centuries of slumber, I found my home replaced by skyscrapers and my favorite pastimes turned into history. Yeah, I\’ve got some issues. Call me a sociopath if you must, but therapy helps (mostly). I occasionally have the urge to level a city block, but I\'m working on it. My interests include binge-watching documentaries on radioactivity and battling an unhealthy relationship with sake. Swipe right if you\’re into the beauty and the beast dynamic (no guarantees on the collateral damage, though). #WorkInProgress',
      location: 'Tokyo Bay, JP',
      phoneNumber: '123-456-7890',
      preferences: {'theme': 'dark'},
      interests: ['Deep Sea Diving', 'Karaoke',  'Jenga', ],
      deviceId: 'device_id_123',
      deviceType: 'android',
      eventIds: [1, 2],
      groupIds: [1],
      dateOfBirth: DateTime(1954, 11, 3),
      likedBooks: ['The Age of Radiance: The Epic Rise and Dramatic Fall of the Atomic Era','The Naked Mind: Control Alcohol, Find Freedom, Discover Happiness & Change Your Life'], // Optional
      languages: ['Japanese', 'English'], // Optional
      groups: ['Cosplay communities'], // Optional
    ),
    User(
      userId: 2,
      name: 'Totoro',
      email: 'jane.smith@example.com',
      profilePictureUrl: 'assets/images/totoro.png',
      pictures: ['assets/images/totoro.png', 'assets/images/totoro.png'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bio: 'Whimsical forest spirit with a soft spot for naps and cat buses. I\’m your fluffy, huggable buddy who loves spreading joy and laughter. But hey, even magical creatures have their struggles, right? Recently, I\’ve been diving deep into the mystical world of psychedelics and exploring new realms of consciousness. My bookshelf is filled with tales of magic mushrooms and journeys beyond the ordinary. When I\’m not lounging in my treehouse, you\’ll find me practicing yoga or engaging in shamanic rituals. Join me on a spiritual adventure – let\’s find inner peace together. #HighSpirited #RehabJourney #ShamanInTraining',
      location: 'Nagano, JP',
      phoneNumber: '987-654-3210',
      preferences: {'theme': 'light'},
      interests: ['Magical Herb Gardening',  'Mushroom Foraging', 'Star Gazing', 'Making new friends'],
      deviceId: 'device_id_124',
      deviceType: 'ios',
      eventIds: [3, 4],
      groupIds: [2],
      dateOfBirth: DateTime(1988, 12, 15),
      likedBooks: ['The Doors of Perception', 'Psychedelic Medicine: The Healing Powers of LSD, MDMA, Psilocybin, and Ayahuasca'], // Optional
      languages: ['Japanese'], // Optional
      groups: ['Yoga Alliance', 'Ayahuasca and Plant Medicine Retreats'], // Optional
    ),
    User(
      userId: 3,
      name: 'Evil Cat',
      email: 'alice.johnson@example.com',
      profilePictureUrl: 'assets/images/grumpy.png',
      pictures: ['assets/images/grumpy.png', 'assets/images/grumpy.png'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bio: 'Mastermind with a flair for ruthless domination. I\'ve got nine lives, a heart of pure darkness, and an insatiable thirst for power. Don\'t be fooled by my cute whiskers and fluffy tail – beneath lies a cold-blooded tyrant ready to unleash havoc. Genocide is merely a stepping stone in my grand plan for global annihilation. The worst part? I feel horrible about being horrible but can\'t seem to stop my destructive urges. If you can endure the chaos and share in the twisted agony, we might just conquer and destroy this world together. #DictatorInTheMaking #EvilGenius #NoMercy #TorturedSoul',
      location: 'London, UK',
      phoneNumber: '555-666-7777',
      preferences: {'theme': 'dark'},
      interests: ['traveling', 'photography', 'hiking'],
      deviceId: 'device_id_125',
      deviceType: 'android',
      eventIds: [5, 6],
      groupIds: [3],
      dateOfBirth: DateTime(2010, 8, 25),
      likedBooks: ['The Art of War', '1984', 'The Prince'], // Optional
      languages: ['English', 'German'], // Optional
      groups: ['Knitting and Crochet Circles'], // Optional
    ),
    User(
      userId: 4,
      name: 'Cornelius',
      email: 'bob.williams@example.com',
      profilePictureUrl: 'assets/images/cornelius.png',
      pictures: ['assets/images/godzilla.png', 'assets/images/godzilla.png'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bio: 'Philosopher, revolutionary, and part-time banana enthusiast. I’m an ape of many talents, swinging through life with a mind as sharp as my looks. Beneath the bravado, there\'s an ape struggling to keep his jungle in order. Alright, I’ll lay it bare – I’ve got a bit of a monkey on my back. My player ways have tangled me up in more vines than I’d like to admit. Trying to turn over a new leaf, but sometimes the bananas are just too tempting. Patience is a virtue, right?',
      location: 'Chicago, USA',
      phoneNumber: '888-999-0000',
      preferences: {'theme': 'light'},
      interests: ['fitness', 'nutrition', 'running'],
      deviceId: 'device_id_126',
      deviceType: 'ios',
      eventIds: [7, 8],
      groupIds: [4],
      dateOfBirth: DateTime(1973, 3, 1),
      likedBooks: ['The Game: Penetrating the Secret Society of Pickup Artists'], // Optional
      languages: ['English'], // Optional
      groups: ['Sex Addicts Anonymous'], // Optional
    ),
    User(
      userId: 5,
      name: 'Carol Davis',
      email: 'carol.davis@example.com',
      profilePictureUrl: 'assets/images/totoro.png',
      pictures: ['assets/images/totoro.png', 'assets/images/totoro.png'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bio: 'A passionate chef and food blogger.',
      location: 'Houston, USA',
      phoneNumber: '111-222-3333',
      preferences: {'theme': 'dark'},
      interests: ['cooking', 'baking', 'blogging'],
      deviceId: 'device_id_127',
      deviceType: 'android',
      eventIds: [9, 10],
      groupIds: [5],
      dateOfBirth: DateTime(1990, 5, 20),
      likedBooks: ['Mastering the Art of French Cooking', 'The Joy of Cooking'], // Optional
      languages: ['English', 'French'], // Optional
      groups: [], // Optional
    ),
  ];
}

List<User> getDummyContacts() {
  return [
    User(
      userId: 6,
      name: 'Dave Green',
      email: 'dave.green@example.com',
      profilePictureUrl: 'assets/images/grumpy.png',
      pictures: ['assets/images/grumpy.png', 'assets/images/grumpy.png'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bio: 'A sports enthusiast and coach.',
      location: 'Miami, USA',
      phoneNumber: '333-444-5555',
      preferences: {'theme': 'light'},
      interests: ['sports', 'coaching', 'swimming'],
      deviceId: 'device_id_128',
      deviceType: 'ios',
      eventIds: [11, 12],
      groupIds: [6],
      dateOfBirth: DateTime(1985, 7, 30),
      likedBooks: ['Coaching for Performance', 'The Sports Gene'], // Optional
      languages: ['English', 'Spanish'], // Optional
      groups: [], // Optional
    ),
    User(
      userId: 7,
      name: 'Eva White',
      email: 'eva.white@example.com',
      profilePictureUrl: 'assets/images/totoro.png',
      pictures: ['assets/images/totoro.png', 'assets/images/totoro.png'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      bio: 'A musician and artist.',
      location: 'Austin, USA',
      phoneNumber: '666-777-8888',
      preferences: {'theme': 'dark'},
      interests: ['music', 'art', 'guitar'],
      deviceId: 'device_id_129',
      deviceType: 'android',
      eventIds: [13, 14],
      groupIds: [7],
      dateOfBirth: DateTime(1995, 9, 15),
      likedBooks: ['Music Theory for Dummies', 'The Art Spirit'], // Optional
      languages: ['English'], // Optional
      groups: [], // Optional
    ),
  ];
}

List<Event> getDummyEvents() {
  return [
    Event(
      eventId: 1,
      name: 'Flutter Workshop',
      date: DateTime.now().add(Duration(days: 7)),
      location: 'Online',
      description: 'An online workshop on Flutter development.',
      userId: 1,
    ),
    Event(
      eventId: 2,
      name: 'Yoga Class',
      date: DateTime.now().add(Duration(days: 14)),
      location: 'Community Center',
      description: 'A relaxing yoga session.',
      userId: 1,
    ),
    Event(
      eventId: 3,
      name: 'Photography 101',
      date: DateTime.now().add(Duration(days: 5)),
      location: 'City Park',
      description: 'A basic course on photography.',
      userId: 2,
    ),
    Event(
      eventId: 4,
      name: 'Painting Exhibition',
      date: DateTime.now().add(Duration(days: 10)),
      location: 'Art Gallery',
      description: 'An exhibition of modern paintings.',
      userId: 2,
    ),
    Event(
      eventId: 5,
      name: 'Travel Meetup',
      date: DateTime.now().add(Duration(days: 20)),
      location: 'Beach Resort',
      description: 'Meetup for travel enthusiasts.',
      userId: 3,
    ),
    Event(
      eventId: 6,
      name: 'Hiking Adventure',
      date: DateTime.now().add(Duration(days: 15)),
      location: 'Mountain Trail',
      description: 'A hiking adventure in the mountains.',
      userId: 3,
    ),
    Event(
      eventId: 7,
      name: 'Fitness Bootcamp',
      date: DateTime.now().add(Duration(days: 2)),
      location: 'Local Gym',
      description: 'A high-intensity fitness bootcamp.',
      userId: 4,
    ),
    Event(
      eventId: 8,
      name: 'Nutrition Seminar',
      date: DateTime.now().add(Duration(days: 8)),
      location: 'Health Center',
      description: 'A seminar on healthy eating and nutrition.',
      userId: 4,
    ),
    Event(
      eventId: 9,
      name: 'Cooking Class',
      date: DateTime.now().add(Duration(days: 3)),
      location: 'Community Kitchen',
      description: 'Learn to cook delicious meals.',
      userId: 5,
    ),
    Event(
      eventId: 10,
      name: 'Baking Workshop',
      date: DateTime.now().add(Duration(days: 12)),
      location: 'Baking School',
      description: 'A workshop on baking cakes and pastries.',
      userId: 5,
    ),
    Event(
      eventId: 11,
      name: 'Basketball Training',
      date: DateTime.now().add(Duration(days: 5)),
      location: 'Sports Complex',
      description: 'A basketball training session.',
      userId: 6,
    ),
    Event(
      eventId: 12,
      name: 'Swimming Competition',
      date: DateTime.now().add(Duration(days: 10)),
      location: 'Aquatic Center',
      description: 'A local swimming competition.',
      userId: 6,
    ),
    Event(
      eventId: 13,
      name: 'Music Concert',
      date: DateTime.now().add(Duration(days: 3)),
      location: 'Music Hall',
      description: 'A concert by local bands.',
      userId: 7,
    ),
    Event(
      eventId: 14,
      name: 'Art Exhibition',
      date: DateTime.now().add(Duration(days: 7)),
      location: 'Art Gallery',
      description: 'An exhibition of contemporary art.',
      userId: 7,
    ),
  ];
}

List<Group> getDummyGroups() {
  return [
    Group(
      groupId: 1,
      name: 'Book Club',
      description: 'A group for book enthusiasts.',
      userId: 1,
    ),
    Group(
      groupId: 2,
      name: 'Tech Talks',
      description: 'A group for tech enthusiasts.',
      userId: 2,
    ),
    Group(
      groupId: 3,
      name: 'Travel Group',
      description: 'A group for travel enthusiasts.',
      userId: 3,
    ),
    Group(
      groupId: 4,
      name: 'Fitness Fanatics',
      description: 'A group for fitness enthusiasts.',
      userId: 4,
    ),
    Group(
      groupId: 5,
      name: 'Food Lovers',
      description: 'A group for people who love cooking and baking.',
      userId: 5,
    ),
    Group(
      groupId: 6,
      name: 'Sports Club',
      description: 'A group for sports enthusiasts.',
      userId: 6,
    ),
    Group(
      groupId: 7,
      name: 'Music and Art',
      description: 'A group for music and art lovers.',
      userId: 7,
    ),
  ];
}
