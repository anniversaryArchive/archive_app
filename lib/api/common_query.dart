class CommonQuery {
  static String group = '''
    _id
    name
    createdAt
    updatedAt
    debutDate
    logo {
      _id
    }
  ''';

  static String artist = '''
    _id
    name
    createdAt
    updatedAt
    debutDate
    birthDay
    group {
      $group
    }
    image {
      _id
    }
  ''';
}