import 'package:flutter/material.dart';
import 'package:pretty_toughh/models/details.dart';
import 'package:pretty_toughh/models/opportunities.dart';
import 'package:pretty_toughh/screens/home/blogs.dart';
import 'package:pretty_toughh/screens/home/infoList.dart';
import 'package:pretty_toughh/screens/home/mentor.dart';
import 'package:pretty_toughh/screens/home/opportunitiesList.dart';
import 'package:pretty_toughh/screens/home/water.dart';
import 'package:pretty_toughh/services/auth.dart';
import 'package:pretty_toughh/services/database.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showProfileEdit(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
        );
      });
    }

    return StreamProvider<List<Opportunities>?>.value(
      value: DatabaseService().allOpportunities,
      initialData: null,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Column(
                children: [
                  IconButton(onPressed: (){
                    _showProfileEdit();
                  }, icon: Icon(
                    Icons.person,
                    size: 60.0,
                    color: Colors.pink,
                  ),
                  )
                ],
              )),
              ListTile(
                title: Text('Blogs'),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Blogs()));
                },
              ),
              ListTile(
                title: Text('Drink Water'),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>WaterDrinking()));
                },
              ),
              ListTile(
                title: Text('Mentor advice'),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Mentors()));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
              'Opportunities'
          ),
          backgroundColor: Colors.pink[600],
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
        body: OpportunitiesList(),
      ),
    );
  }
}
