import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graphql/client.dart';

enum MODE {
  develop,
  product
}

class GraphQLService extends GetxService {
  static MODE mode = MODE.develop;
  static GraphQLClient client = GraphQLClient(
    cache: GraphQLCache(),
    link: HttpLink(host),
  );

  static String host = 'http://localhost:3000/graphql';

  Future<GraphQLService> init() async {
    initGraphQLClient();
    return this;
  }

  void initGraphQLClient({ String? token }) {
    HttpLink httpLink = HttpLink(
      host,
      defaultHeaders: { 'Authorization': token?.isNotEmpty == true ? 'Bearer $token' : '' },
    );
    client = GraphQLClient(cache: GraphQLCache(), link: httpLink);
  }
}