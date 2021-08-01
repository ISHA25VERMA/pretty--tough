import 'package:flutter/material.dart';
import 'package:pretty_toughh/models/details.dart';
import 'package:pretty_toughh/models/opportunities.dart';
import 'package:pretty_toughh/screens/home/infoList.dart';
import 'package:pretty_toughh/screens/home/opportunitiesList.dart';
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
                onTap: (){},
              ),
              ListTile(
                title: Text('Drink Water'),
                onTap: (){},
              ),
              ListTile(
                title: Text('Mentor advice'),
                onTap: (){},
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
    // Container(
        //   margin: EdgeInsets.fromLTRB(8.0,   8.0, 8.0, 0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       Card(
        //         elevation: 0.5,
        //         color: Colors.yellow[200],
        //         child: Padding(
        //           padding: const EdgeInsets.all(12.0),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'GSB Hackathon',
        //                 style: TextStyle(
        //                   fontSize: 24.0,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.black
        //                 ),
        //               ),
        //               Text(
        //                 'Happening this Summer! All girls global online hackathons',
        //                 style: TextStyle(
        //                     fontSize: 18.0,
        //                     fontWeight: FontWeight.normal,
        //                     color: Colors.black
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       Card(
        //         elevation: 0.5,
        //         color: Colors.pink[200],
        //         child: Padding(
        //           padding: const EdgeInsets.all(12.0),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'GSB Hackathon',
        //                 style: TextStyle(
        //                     fontSize: 24.0,
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.black
        //                 ),
        //               ),
        //               Text(
        //                 'Happening this Summer! All girls global online hackathons',
        //                 style: TextStyle(
        //                     fontSize: 18.0,
        //                     fontWeight: FontWeight.normal,
        //                     color: Colors.black
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       Card(
        //         elevation: 0.5,
        //         color: Colors.yellow[200],
        //         child: Padding(
        //           padding: const EdgeInsets.all(12.0),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'GSB Hackathon',
        //                 style: TextStyle(
        //                     fontSize: 24.0,
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.black
        //                 ),
        //               ),
        //               Text(
        //                 'Happening this Summer! All girls global online hackathons',
        //                 style: TextStyle(
        //                     fontSize: 18.0,
        //                     fontWeight: FontWeight.normal,
        //                     color: Colors.black
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       Card(
        //         elevation: 0.5,
        //         color: Colors.pink[200],
        //         child: Padding(
        //           padding: const EdgeInsets.all(12.0),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'GSB Hackathon',
        //                 style: TextStyle(
        //                     fontSize: 24.0,
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.black
        //                 ),
        //               ),
        //               Text(
        //                 'Happening this Summer! All girls global online hackathons',
        //                 style: TextStyle(
        //                     fontSize: 18.0,
        //                     fontWeight: FontWeight.normal,
        //                     color: Colors.black
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
