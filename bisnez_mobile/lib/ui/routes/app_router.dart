import 'package:basic_login_page/bloc/authentication/authentication_bloc.dart';
import 'package:basic_login_page/ui/arguments/UserArgument.dart';
import 'package:basic_login_page/ui/screens/authenticate/login.dart';
import 'package:basic_login_page/ui/screens/feed/post_Screen.dart';
import 'package:basic_login_page/ui/screens/home/home.dart';
import 'package:basic_login_page/ui/screens/profile/setProfile.dart';
import 'package:basic_login_page/ui/screens/profile/userProfile.dart';
import 'package:basic_login_page/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationNotAuthenticated) {
                      return LoginPage(); // show authentication form
                    }
                    if (state is AuthenticationFailure) {
                      // show error message
                      return LoginPage(errorMessage: state.message);
                    }

                    if (state is AuthenticationSuccess) {
                      return Home();
                    }

                    if (state is AuthenticationSuccessForFirstTime) {
                      return SetProfile();
                    }
                    // show splash screen
                    return Center(
                      child: Loading(),
                    );
                  },
                ));
        break;

      case '/post':
        final post = routeSettings.arguments;
        return MaterialPageRoute(
          builder: (_) => ViewPostScreen(
            post: post,
          ),
        );
        break;

      case '/user':
        UserArgument arguments = routeSettings.arguments;
        return MaterialPageRoute(
          builder: (_) => UserProfile(
            arguments: arguments,
          ),
        );
        break;

      case '/registration':
        return MaterialPageRoute(builder: (_) => SetProfile());
        break;

      case '/config':
        return MaterialPageRoute(builder: (_) => SetProfile());
        break;

      default:
        return null;
    }
  }
}
