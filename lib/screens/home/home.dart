import 'package:flutter/material.dart';
import 'package:pretty_toughh/services/auth.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Drawer Header')),
            ListTile(
              title: Text('Item 1'),
              onTap: (){},

            ),
            ListTile(
              title: Text('Item 2'),
              onTap: (){},
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
            'Home'
        ),
        elevation: 0.0,
        actions: [
          TextButton.icon(onPressed: () async {
            await _auth.signOut();
          }, icon: Icon(
            Icons.logout,
            color: Colors.white,
          ), label: Text(''))
        ],
      ),
    );
  }
}
