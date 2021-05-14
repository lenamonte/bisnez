import 'package:basic_login_page/bloc/authentication/authentication_bloc.dart';
import 'package:basic_login_page/bloc/feed/feed_bloc.dart';
import 'package:basic_login_page/repository/posts_repository.dart';
import 'package:basic_login_page/ui/routes/app_router.dart';
import 'package:basic_login_page/repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        RepositoryProvider<AuthService>(
          create: (context) {
            return AuthService();
          },
        ),
        RepositoryProvider<PostsRepository>(
          create: (context) {
            return PostsRepository();
          },
        ),
        BlocProvider<AuthenticationBloc>(create: (context) {
          final authService = RepositoryProvider.of<AuthService>(context);
          return AuthenticationBloc(authService: authService)
            ..add(AuthenticationStarted());
        }),
        BlocProvider<FeedBloc>(
          create: (context) {
            final postsRepository =
                RepositoryProvider.of<PostsRepository>(context);
            return FeedBloc(postsRepository: postsRepository)..add(LoadFeed());
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(fontFamily: 'Quicksand', primarySwatch: Colors.lightBlue),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
