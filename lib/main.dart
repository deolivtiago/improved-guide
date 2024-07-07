import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/app_routes.dart';
import 'repositories/http_client.dart';
import 'views/sign_in/sign_in_bloc.dart';
import 'views/sign_up/sign_up_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositories,
      child: MultiBlocProvider(
        providers: blocs,
        child: MaterialApp(
          title: 'Clarx',
          debugShowCheckedModeBanner: false,
          // theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          theme: ThemeData.from(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
          ),
          initialRoute: AppRoutes.signIn,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }

  List<RepositoryProvider> get repositories {
    return [
      RepositoryProvider<HttpClient>(
        create: (context) => const HttpClient(),
      ),
      // RepositoryProvider<LocalStorage>(
      //   create: (context) => const LocalStorage(),
      // ),
      // RepositoryProvider<AuthRepository>(
      //   create: (context) => AuthRepository(
      //     firebaseAuth: context.read<FirebaseAuth>(),
      //   ),
      // ),
      // RepositoryProvider<CacheRepository>(
      //   create: (context) => CacheRepository(
      //     localStorage: context.read<LocalStorage>(),
      //   ),
      // ),
    ];
  }

  List<BlocProvider> get blocs {
    return [
      BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(
            // authRepository: context.read<AuthRepository>(),
            ),
      ),
      BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
            // authRepository: context.read<AuthRepository>(),
            ),
      ),
    ];
  }
}
