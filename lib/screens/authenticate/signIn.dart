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
      appBar: AppBar(
        backgroundColor: Colors.pink[600],
        elevation: 0.0,
        title: Text('Sign in ',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold
          ),
        ),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formkey,
              child: Column(
                  children: [
                    Center(
                      child: Image.asset('assets/signIn.png')
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'email'
                      ),
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
                      decoration: InputDecoration(
                        hintText: 'password'
                      ),
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
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      ),
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
      ),
    );
  }
}