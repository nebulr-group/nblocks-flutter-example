import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth_context.dart';

class CurrentUserWidget extends StatelessWidget {
  const CurrentUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthContext>(builder: (context, authContext, child) {
      final currentUser = authContext.getCurrentUser();
      return Text(
          "CurrentUserWidget: ${currentUser.user?.fullName} (${currentUser.user?.role})");
    });
  }
}
