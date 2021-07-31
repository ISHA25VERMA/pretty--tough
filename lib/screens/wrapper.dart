import 'package:flutter/material.dart';
import 'package:pretty_toughh/models/user.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if (user.uid == 'null'){
      return Authenticate();
    }else{
      return Home();
    }

    print(user.uid);

    //either home or authenticate
    return Authenticate();
  }
}
