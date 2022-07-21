import 'package:archive/api/common_query.dart';
import 'package:archive/services/graphql_service.dart';
import 'package:graphql/client.dart';

class Queries {
  static Future<QueryResult> getGroups() {
    return GraphQLService.client.query(QueryOptions(
      document: gql('''
      query {
        groups {
          ${CommonQuery.group}
        }
      }
      '''),
    ));
  }

  static Future<QueryResult> getGroup(String id) {
    return GraphQLService.client.query(QueryOptions(
      document: gql('''
      query (\$id: ID!) {
        group: Group (id: \$id) {
          ${CommonQuery.group}
        }
      }
      '''),
      variables: { 'id': id },
    ));
  }
}