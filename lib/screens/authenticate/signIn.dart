import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_toughh/services/auth.dart';
import 'package:pretty_toughh/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  //text field state
  String email = '';
  String password = '';
  String error = '';

  bool loading = false;

  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in '),
        actions: [
          TextButton.icon(onPressed: (){
            widget.toggleView();
          }, icon: Icon(
            Icons.person,
            color: Colors.white,
          ), label: Text(
            'Register',
            style: TextStyle(
              color: Colors.white,
            ),
          ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formkey,
            child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  TextFormField(
                    validator: (val){
                      if (val!.isNotEmpty){
                        return null;
                      }else{
                        return 'enter email';
                      }
                    },
                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                    },),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },
                    validator: (val)=>val!.isEmpty ? 'Enter password': null,
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0,),
                  ElevatedButton(onPressed: () async {
                    if(_formkey.currentState!.validate()){
                      setState(() => loading = true);
                      dynamic result = _auth.signInWithEmail(email, password);
                      if (result == null){
                        setState((){
                          error = 'Invalid credentials';
                          loading = false;
                        });

                      }
                    }
                  }, child: Text(
                    'sign in',),
                  ),
                  SizedBox(height: 12.0,),
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                    ),)
                ]
            )
        ),
        // ElevatedButton(
        //   onPressed: () async {
        //     dynamic results = await _auth.signInAnon();
        //     if(results == null){
        //       print('error sign in');
        //     }else{
        //       print('signed in'
        //       );
        //       print(results.uid);
        //     }
        //   },
        //   child: Text(
        //     'Sign in'
        //   ),
        // ),
      ),
    );
  }
}