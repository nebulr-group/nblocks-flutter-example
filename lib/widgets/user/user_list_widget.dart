import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:my_app/schema.graphql.dart';
import 'package:my_app/widgets/user/graphql/updateUser.mutation.graphql.dart';
import 'package:provider/provider.dart';
import './graphql/listUsers.query.graphql.dart';
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
        child: const StackWidget(),
      );
    });
  }
}

class StackWidget extends StatelessWidget {
  const StackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [UserListWidgetBody(), UserEditWidgetBody()]);
  }
}

class UserListWidgetBody extends HookWidget {
  const UserListWidgetBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = useQuery$ListUsers();
    final result = query.result;

    if (result.hasException) {
      return Text(result.exception.toString());
    }

    if (result.isLoading) {
      return const Text('Loading');
    }

    final users = Query$ListUsers.fromJson(result.data!).listUsers;

    if (users.isEmpty) {
      return const Text('No users');
    }

    return Text(
        "UserListWidget: ${users.map((e) => "${e.username}(${e.enabled})").join(", ")}");
  }
}

class UserEditWidgetBody extends HookWidget {
  const UserEditWidgetBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mutation = useMutation$UpdateUser();

    return FloatingActionButton(
      onPressed: () => mutation.runMutation(Variables$Mutation$UpdateUser(

          /// See Open issues and graphql-codegen and non-required fields on input classes in Readme
          user: Input$UserInput(
              id: "62bf19da4a787100488eda08", enabled: false, role: "ADMIN"))),
      tooltip: 'Star',
      child: const Text("Test update user"),
    );
  }
}
