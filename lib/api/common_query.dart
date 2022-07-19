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
}