import 'package:flutter/material.dart';
import 'package:flutter_course/src/containers/auth/index.dart';
import 'package:flutter_course/src/models/auth/index.dart';
import 'package:flutter_course/src/presentation/home/home_page.dart';
import 'package:flutter_course/src/presentation/login/login_page.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser user) {
        if (user == null) {
          return const LoginPage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
