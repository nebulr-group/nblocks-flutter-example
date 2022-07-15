import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/auth_context.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthContext>(builder: (context, authContext, child) {
      final ValueNotifier<GraphQLClient> client =
          ValueNotifier(authContext.getGraphqlClient());
      return GraphQLProvider(
        client: client,
        child: const UserListWidgetBody(),
      );
    });
  }
}

class UserListWidgetBody extends HookWidget {
  const UserListWidgetBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String readRepositories = """
  query ListUsers{
  listUsers{       
    id
    fullName
    email
    username
    createdAt
    onboarded
    enabled
    role
    teams
  }
}
""";

    final readRespositoriesResult = useQuery(
      QueryOptions(
        document:
            gql(readRepositories), // this is the query string you just created
      ),
    );
    final result = readRespositoriesResult.result;

    if (result.hasException) {
      return Text(result.exception.toString());
    }

    if (result.isLoading) {
      return const Text('Loading');
    }

    List? users = result.data?['listUsers'];

    if (users == null) {
      return const Text('No users');
    }

    return Text("UserListWidget: ${users.map((e) => e['id']).join(", ")}");
  }
}
