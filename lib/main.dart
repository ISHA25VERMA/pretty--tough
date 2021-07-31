import 'package:flutter/material.dart';
import 'package:pretty_toughh/screens/home/home.dart';
import 'package:pretty_toughh/screens/wrapper.dart';
import 'package:pretty_toughh/services/auth.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      initialData: User(uid: 'null'),
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

