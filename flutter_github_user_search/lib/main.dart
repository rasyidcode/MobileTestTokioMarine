import 'package:flutter/material.dart';
import 'package:flutter_github_user_search/injection_container.dart';
import 'package:flutter_github_user_search/ui/search/user/search_user_page.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Github User Search',
      theme: ThemeData.dark(),
      home: SearchUserPage(),
    );
  }
}
