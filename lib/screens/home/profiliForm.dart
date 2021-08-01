import 'package:flutter/material.dart';
import 'package:pretty_toughh/models/user.dart';
import 'package:pretty_toughh/services/database.dart';
import 'package:pretty_toughh/shared/loading.dart';
import 'package:provider/provider.dart';

class ProfileSheet extends StatefulWidget {
  const ProfileSheet({Key? key}) : super(key: key);

  @override
  _ProfileSheetState createState() => _ProfileSheetState();
}

class _ProfileSheetState extends State<ProfileSheet> {

  final _formkey = GlobalKey<FormState>();

  late String _age;
  late String _contact;
  late String _description;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {

        if (snapshot.hasData){
          UserData? userData = snapshot.data;
          return Form(
            key: _formkey,
            child: Column(
              children: [
                Text('Update your profile',style: TextStyle(fontSize: 18.0),),
                SizedBox(height: 10.0,),
                Text('Contact :'),
                TextFormField(
                  initialValue: userData!.contact,
                  decoration: InputDecoration(
                    hintText: 'update contact',
                  ),
                  validator: (val)=>val== null?'Please enter contact':null,
                  onChanged: (val) {
                    setState(() {
                      _contact= val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                Text(
                  'Age: '
                ),
                TextFormField(
                  initialValue: userData.age,
                  decoration: InputDecoration(
                      hintText: 'age'
                  ),
                  validator: (val)=>val== null?'Please enter age':null,
                  onChanged: (val) {
                    setState(() {
                      _age= val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                Text('Description : '),
                TextFormField(
                  initialValue: userData.description,
                  decoration: InputDecoration(
                      hintText: 'description'
                  ),
                  validator: (val)=>val== null?'Please enter contact':null,
                  onChanged: (val) {
                    setState(() {
                      _description= val;
                    });
                  },
                ),
                SizedBox(height: 20,),
                TextButton(onPressed: () async {
                  if(_formkey.currentState!.validate()){
                    await DatabaseService(uid: user.uid).updateUser(_contact, _description, _age);
                    Navigator.pop(context);
                  }
                }, child: Text(
                  'Update',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20.0
                  ),
                ),)
              ],
            ),
          );
        }else{
          return Loading();
        }

      }
    );
  }
}
