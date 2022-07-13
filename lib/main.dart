import 'package:flutter/material.dart';
import 'package:my_app/models/auth_context.dart';
import 'package:provider/provider.dart';
import 'models/auth_context.dart';

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
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Authenticated: ${user.authenticated}, Name: ${user.user?.fullName}'),
                  CaseWidget(
                      trueWidget: TextButton(
                          child: const Text('Logout'),
                          onPressed: () {
                            authContext.logout();
                          }),
                      falseWidget: TextButton(
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

class CaseWidget extends StatelessWidget {
  final Widget trueWidget;
  final Widget falseWidget;
  final bool expression;

  const CaseWidget(
      {Key? key,
      required this.trueWidget,
      required this.falseWidget,
      required this.expression})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return expression ? trueWidget : falseWidget;
  }
}
