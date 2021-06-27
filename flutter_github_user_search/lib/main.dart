import 'package:flutter/material.dart';
import 'package:flutter_github_user_search/injection_container.dart';
import 'package:flutter_github_user_search/ui/about/about_page.dart';
import 'package:flutter_github_user_search/ui/detail/user_detail_args.dart';
import 'package:flutter_github_user_search/ui/detail/user_detail_page.dart';
import 'package:flutter_github_user_search/ui/home/home_page.dart';
import 'package:flutter_github_user_search/ui/search/user/search_user_page.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Github',
      theme: ThemeData.dark(),
      initialRoute: '/',
      // routes: {
      //   '/': (BuildContext context) => HomePage(),
      //   '/search_user': (BuildContext context) => SearchUserPage(),
      //   '/user_detail': (BuildContext context) => UserDetailPage(),
      //   '/about': (BuildContext context) => AboutPage(),
      // },
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
              builder: (BuildContext context) => HomePage());
        } else if (settings.name == '/search_user') {
          return MaterialPageRoute(
              builder: (BuildContext context) => SearchUserPage());
        } else if (settings.name == '/user_detail') {
          final args = settings.arguments as UserDetailArgs;

          return MaterialPageRoute(
            builder: (BuildContext context) =>
                UserDetailPage(login: args.login),
          );
        } else if (settings.name == '/about') {
          return MaterialPageRoute(
              builder: (BuildContext context) => AboutPage());
        }
      },
    );
  }
}
