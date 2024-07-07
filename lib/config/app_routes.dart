import 'package:flutter/material.dart';

import '../views/sign_in/sign_in_page.dart';
import '../views/sign_up/sign_up_page.dart';

abstract class AppRoutes {
  static const home = '/';
  static const signUp = '/signup';
  static const signIn = '/signin';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signIn:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignInPage(),
        );

      case AppRoutes.signUp:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignUpPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Ocorreu um erro')),
          ),
        );
    }
  }
}
