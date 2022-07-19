import 'package:archive/common/config.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graphql/client.dart';

class GraphQLService extends GetxService {
  static GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink(Config.host),
  );

  Future<GraphQLService> init() async {
    initGraphQLClient();
    return this;
  }

  void initGraphQLClient({ String? token }) {
    HttpLink httpLink = HttpLink(Config.host);
    client = GraphQLClient(cache: GraphQLCache(), link: httpLink);
  }
}