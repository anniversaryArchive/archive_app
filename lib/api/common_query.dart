class CommonQuery {
  static String group = '''
    name
    debutDate
  ''';

  static String artist = '''
    _id
    name
    createdAt
    updatedAt
    debutDate
    birthDay
    image {
      _id
    }
  ''';
}