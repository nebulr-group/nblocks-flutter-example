import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'listUsers.query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Query$ListUsers {
  Query$ListUsers({required this.listUsers, required this.$__typename});

  @override
  factory Query$ListUsers.fromJson(Map<String, dynamic> json) =>
      _$Query$ListUsersFromJson(json);

  final List<Query$ListUsers$listUsers> listUsers;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$ListUsersToJson(this);
  int get hashCode {
    final l$listUsers = listUsers;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [Object.hashAll(l$listUsers.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$ListUsers) || runtimeType != other.runtimeType)
      return false;
    final l$listUsers = listUsers;
    final lOther$listUsers = other.listUsers;
    if (l$listUsers.length != lOther$listUsers.length) return false;
    for (int i = 0; i < l$listUsers.length; i++) {
      final l$listUsers$entry = l$listUsers[i];
      final lOther$listUsers$entry = lOther$listUsers[i];
      if (l$listUsers$entry != lOther$listUsers$entry) return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$ListUsers on Query$ListUsers {
  Query$ListUsers copyWith(
          {List<Query$ListUsers$listUsers>? listUsers, String? $__typename}) =>
      Query$ListUsers(
          listUsers: listUsers == null ? this.listUsers : listUsers,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const documentNodeQueryListUsers = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'ListUsers'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'listUsers'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'fullName'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'email'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'username'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'createdAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'onboarded'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'enabled'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'role'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'teams'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
]);
Query$ListUsers _parserFn$Query$ListUsers(Map<String, dynamic> data) =>
    Query$ListUsers.fromJson(data);

class Options$Query$ListUsers extends graphql.QueryOptions<Query$ListUsers> {
  Options$Query$ListUsers(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: documentNodeQueryListUsers,
            parserFn: _parserFn$Query$ListUsers);
}

class WatchOptions$Query$ListUsers
    extends graphql.WatchQueryOptions<Query$ListUsers> {
  WatchOptions$Query$ListUsers(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeQueryListUsers,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$ListUsers);
}

class FetchMoreOptions$Query$ListUsers extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ListUsers({required graphql.UpdateQuery updateQuery})
      : super(updateQuery: updateQuery, document: documentNodeQueryListUsers);
}

extension ClientExtension$Query$ListUsers on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ListUsers>> query$ListUsers(
          [Options$Query$ListUsers? options]) async =>
      await this.query(options ?? Options$Query$ListUsers());
  graphql.ObservableQuery<Query$ListUsers> watchQuery$ListUsers(
          [WatchOptions$Query$ListUsers? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$ListUsers());
  void writeQuery$ListUsers(
          {required Query$ListUsers data, bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation:
                  graphql.Operation(document: documentNodeQueryListUsers)),
          data: data.toJson(),
          broadcast: broadcast);
  Query$ListUsers? readQuery$ListUsers({bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryListUsers)),
        optimistic: optimistic);
    return result == null ? null : Query$ListUsers.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ListUsers> useQuery$ListUsers(
        [Options$Query$ListUsers? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$ListUsers());
graphql.ObservableQuery<Query$ListUsers> useWatchQuery$ListUsers(
        [WatchOptions$Query$ListUsers? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$ListUsers());

class Query$ListUsers$Widget extends graphql_flutter.Query<Query$ListUsers> {
  Query$ListUsers$Widget(
      {widgets.Key? key,
      Options$Query$ListUsers? options,
      required graphql_flutter.QueryBuilder<Query$ListUsers> builder})
      : super(
            key: key,
            options: options ?? Options$Query$ListUsers(),
            builder: builder);
}

@JsonSerializable(explicitToJson: true)
class Query$ListUsers$listUsers {
  Query$ListUsers$listUsers(
      {required this.id,
      this.fullName,
      this.email,
      this.username,
      this.createdAt,
      this.onboarded,
      this.enabled,
      this.role,
      this.teams,
      required this.$__typename});

  @override
  factory Query$ListUsers$listUsers.fromJson(Map<String, dynamic> json) =>
      _$Query$ListUsers$listUsersFromJson(json);

  final String id;

  final String? fullName;

  final String? email;

  final String? username;

  final String? createdAt;

  final bool? onboarded;

  final bool? enabled;

  final String? role;

  final List<String>? teams;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$ListUsers$listUsersToJson(this);
  int get hashCode {
    final l$id = id;
    final l$fullName = fullName;
    final l$email = email;
    final l$username = username;
    final l$createdAt = createdAt;
    final l$onboarded = onboarded;
    final l$enabled = enabled;
    final l$role = role;
    final l$teams = teams;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$fullName,
      l$email,
      l$username,
      l$createdAt,
      l$onboarded,
      l$enabled,
      l$role,
      l$teams == null ? null : Object.hashAll(l$teams.map((v) => v)),
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$ListUsers$listUsers) ||
        runtimeType != other.runtimeType) return false;
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) return false;
    final l$fullName = fullName;
    final lOther$fullName = other.fullName;
    if (l$fullName != lOther$fullName) return false;
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) return false;
    final l$username = username;
    final lOther$username = other.username;
    if (l$username != lOther$username) return false;
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) return false;
    final l$onboarded = onboarded;
    final lOther$onboarded = other.onboarded;
    if (l$onboarded != lOther$onboarded) return false;
    final l$enabled = enabled;
    final lOther$enabled = other.enabled;
    if (l$enabled != lOther$enabled) return false;
    final l$role = role;
    final lOther$role = other.role;
    if (l$role != lOther$role) return false;
    final l$teams = teams;
    final lOther$teams = other.teams;
    if (l$teams != null && lOther$teams != null) {
      if (l$teams.length != lOther$teams.length) return false;
      for (int i = 0; i < l$teams.length; i++) {
        final l$teams$entry = l$teams[i];
        final lOther$teams$entry = lOther$teams[i];
        if (l$teams$entry != lOther$teams$entry) return false;
      }
    } else if (l$teams != lOther$teams) {
      return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$ListUsers$listUsers
    on Query$ListUsers$listUsers {
  Query$ListUsers$listUsers copyWith(
          {String? id,
          String? Function()? fullName,
          String? Function()? email,
          String? Function()? username,
          String? Function()? createdAt,
          bool? Function()? onboarded,
          bool? Function()? enabled,
          String? Function()? role,
          List<String>? Function()? teams,
          String? $__typename}) =>
      Query$ListUsers$listUsers(
          id: id == null ? this.id : id,
          fullName: fullName == null ? this.fullName : fullName(),
          email: email == null ? this.email : email(),
          username: username == null ? this.username : username(),
          createdAt: createdAt == null ? this.createdAt : createdAt(),
          onboarded: onboarded == null ? this.onboarded : onboarded(),
          enabled: enabled == null ? this.enabled : enabled(),
          role: role == null ? this.role : role(),
          teams: teams == null ? this.teams : teams(),
          $__typename: $__typename == null ? this.$__typename : $__typename);
}
