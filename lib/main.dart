import 'package:flutter/material.dart';
import 'package:my_app/models/auth_context.dart';
import 'package:provider/provider.dart';
import 'models/auth_context.dart';
import 'widgets/case_widget.dart';
import 'widgets/current_user.dart';
import 'widgets/user/user_list_widget.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthContext(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Welcome to Flutter'),
            ),
            body: MyBody(
              key: key,
            )));
  }
}

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<AuthContext>(
            builder: (context, authContext, child) {
              final user = authContext.getCurrentUser();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Authenticated: ${user.authenticated}'),
                  CaseWidget(
                      trueChild: Column(
                        children: [
                          const CurrentUserWidget(),
                          const UserListWidget(),
                          TextButton(
                              child: const Text('Logout'),
                              onPressed: () {
                                authContext.logout();
                              })
                        ],
                      ),
                      falseChild: TextButton(
                        child: const Text('Login'),
                        onPressed: () {
                          authContext.login("oscar@nebulr.group", "helloworld");
                        },
                      ),
                      expression: user.authenticated)
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
