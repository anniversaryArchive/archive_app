import 'package:archive/api/common_query.dart';
import 'package:archive/services/graphql_service.dart';
import 'package:graphql/client.dart';

class Queries {
  static Future<QueryResult> getGroup(String id) {
    return GraphQLService.client.query(QueryOptions(
      document: gql('''
      query (\$id: ID!) {
        group: Group (id: \$id) {
          data {
            ${CommonQuery.group}
          }
          total
        }
리      }
      '''),
      variables: { 'id': id },
    ));
  }

  static Future<QueryResult> getArtists() {
    return GraphQLService.client.query(QueryOptions(
      document: gql('''
      query () {
        artists {
            ${CommonQuery.artist}
          }
      }
      '''),
    ));
  }

  static Future<QueryResult> getArtist(String id) {
    return GraphQLService.client.query(QueryOptions(
      document: gql('''
      query (\$id: ID!) {
        artist: Artist (id: \$id) {
            ${CommonQuery.artist}
        }
      }
      '''),
      variables: { 'id': id },
    ));
  }
}