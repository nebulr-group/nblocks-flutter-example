import '../../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:json_annotation/json_annotation.dart';
part 'updateUser.mutation.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Variables$Mutation$UpdateUser {
  Variables$Mutation$UpdateUser({required this.user});

  @override
  factory Variables$Mutation$UpdateUser.fromJson(Map<String, dynamic> json) =>
      _$Variables$Mutation$UpdateUserFromJson(json);

  final Input$UserInput user;

  Map<String, dynamic> toJson() => _$Variables$Mutation$UpdateUserToJson(this);
  int get hashCode {
    final l$user = user;
    return Object.hashAll([l$user]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Variables$Mutation$UpdateUser) ||
        runtimeType != other.runtimeType) return false;
    final l$user = user;
    final lOther$user = other.user;
    if (l$user != lOther$user) return false;
    return true;
  }

  Variables$Mutation$UpdateUser copyWith({Input$UserInput? user}) =>
      Variables$Mutation$UpdateUser(user: user == null ? this.user : user);
}

@JsonSerializable(explicitToJson: true)
class Mutation$UpdateUser {
  Mutation$UpdateUser({required this.updateUser, required this.$__typename});

  @override
  factory Mutation$UpdateUser.fromJson(Map<String, dynamic> json) =>
      _$Mutation$UpdateUserFromJson(json);

  final Mutation$UpdateUser$updateUser updateUser;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$UpdateUserToJson(this);
  int get hashCode {
    final l$updateUser = updateUser;
    final l$$__typename = $__typename;
    return Object.hashAll([l$updateUser, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$UpdateUser) || runtimeType != other.runtimeType)
      return false;
    final l$updateUser = updateUser;
    final lOther$updateUser = other.updateUser;
    if (l$updateUser != lOther$updateUser) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$UpdateUser on Mutation$UpdateUser {
  Mutation$UpdateUser copyWith(
          {Mutation$UpdateUser$updateUser? updateUser, String? $__typename}) =>
      Mutation$UpdateUser(
          updateUser: updateUser == null ? this.updateUser : updateUser,
          $__typename: $__typename == null ? this.$__typename : $__typename);
}

const documentNodeMutationUpdateUser = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'UpdateUser'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'user')),
            type: NamedTypeNode(
                name: NameNode(value: 'UserInput'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'updateUser'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'user'),
                  value: VariableNode(name: NameNode(value: 'user')))
            ],
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
Mutation$UpdateUser _parserFn$Mutation$UpdateUser(Map<String, dynamic> data) =>
    Mutation$UpdateUser.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdateUser = FutureOr<void> Function(
    dynamic, Mutation$UpdateUser?);

class Options$Mutation$UpdateUser
    extends graphql.MutationOptions<Mutation$UpdateUser> {
  Options$Mutation$UpdateUser(
      {String? operationName,
      required Variables$Mutation$UpdateUser variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$UpdateUser? onCompleted,
      graphql.OnMutationUpdate<Mutation$UpdateUser>? update,
      graphql.OnError? onError})
      : onCompletedWithParsed = onCompleted,
        super(
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            onCompleted: onCompleted == null
                ? null
                : (data) => onCompleted(data,
                    data == null ? null : _parserFn$Mutation$UpdateUser(data)),
            update: update,
            onError: onError,
            document: documentNodeMutationUpdateUser,
            parserFn: _parserFn$Mutation$UpdateUser);

  final OnMutationCompleted$Mutation$UpdateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$UpdateUser
    extends graphql.WatchQueryOptions<Mutation$UpdateUser> {
  WatchOptions$Mutation$UpdateUser(
      {String? operationName,
      required Variables$Mutation$UpdateUser variables,
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
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeMutationUpdateUser,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$UpdateUser);
}

extension ClientExtension$Mutation$UpdateUser on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdateUser>> mutate$UpdateUser(
          Options$Mutation$UpdateUser options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdateUser> watchMutation$UpdateUser(
          WatchOptions$Mutation$UpdateUser options) =>
      this.watchMutation(options);
}

class Mutation$UpdateUser$HookResult {
  Mutation$UpdateUser$HookResult(this.runMutation, this.result);

  final RunMutation$Mutation$UpdateUser runMutation;

  final graphql.QueryResult<Mutation$UpdateUser> result;
}

Mutation$UpdateUser$HookResult useMutation$UpdateUser(
    [WidgetOptions$Mutation$UpdateUser? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdateUser());
  return Mutation$UpdateUser$HookResult(
    (variables, {optimisticResult}) => result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult,
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdateUser> useWatchMutation$UpdateUser(
        WatchOptions$Mutation$UpdateUser options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdateUser
    extends graphql.MutationOptions<Mutation$UpdateUser> {
  WidgetOptions$Mutation$UpdateUser(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$UpdateUser? onCompleted,
      graphql.OnMutationUpdate<Mutation$UpdateUser>? update,
      graphql.OnError? onError})
      : onCompletedWithParsed = onCompleted,
        super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            onCompleted: onCompleted == null
                ? null
                : (data) => onCompleted(data,
                    data == null ? null : _parserFn$Mutation$UpdateUser(data)),
            update: update,
            onError: onError,
            document: documentNodeMutationUpdateUser,
            parserFn: _parserFn$Mutation$UpdateUser);

  final OnMutationCompleted$Mutation$UpdateUser? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

typedef RunMutation$Mutation$UpdateUser
    = graphql.MultiSourceResult<Mutation$UpdateUser>
        Function(Variables$Mutation$UpdateUser, {Object? optimisticResult});
typedef Builder$Mutation$UpdateUser = widgets.Widget Function(
    RunMutation$Mutation$UpdateUser, graphql.QueryResult<Mutation$UpdateUser>?);

class Mutation$UpdateUser$Widget
    extends graphql_flutter.Mutation<Mutation$UpdateUser> {
  Mutation$UpdateUser$Widget(
      {widgets.Key? key,
      WidgetOptions$Mutation$UpdateUser? options,
      required Builder$Mutation$UpdateUser builder})
      : super(
            key: key,
            options: options ?? WidgetOptions$Mutation$UpdateUser(),
            builder: (run, result) => builder(
                (variables, {optimisticResult}) =>
                    run(variables.toJson(), optimisticResult: optimisticResult),
                result));
}

@JsonSerializable(explicitToJson: true)
class Mutation$UpdateUser$updateUser {
  Mutation$UpdateUser$updateUser(
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
  factory Mutation$UpdateUser$updateUser.fromJson(Map<String, dynamic> json) =>
      _$Mutation$UpdateUser$updateUserFromJson(json);

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

  Map<String, dynamic> toJson() => _$Mutation$UpdateUser$updateUserToJson(this);
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
    if (!(other is Mutation$UpdateUser$updateUser) ||
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

extension UtilityExtension$Mutation$UpdateUser$updateUser
    on Mutation$UpdateUser$updateUser {
  Mutation$UpdateUser$updateUser copyWith(
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
      Mutation$UpdateUser$updateUser(
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
