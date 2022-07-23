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

  static String archive = '''
    _id
    lat
    lng
    archiveName
    themeName
    organizer
    address
    startDate
    endDate
    images {
      _id
    }
    phoneNumber
    link
  ''';
}