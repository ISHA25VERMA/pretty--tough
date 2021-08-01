import 'package:flutter/material.dart';
import 'package:pretty_toughh/services/auth.dart';
import 'package:pretty_toughh/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formkey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[600],
        elevation: 0.0,
        title: Text('Register',
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          TextButton.icon(onPressed: (){
            widget.toggleView();
          }, icon: Icon(
            Icons.keyboard_tab,
            color: Colors.white,
          ), label: Text(
            'Sign in',
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
              key: _formkey ,
              child: Column(
                children: [
                  Center(
                    child: Image.asset('assets/register.png')
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
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
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'password',
                    ),
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },
                    obscureText: true,
                    validator: (val)=>val!.length<6 ? 'password must contain more than 6 characters': null,
                  ),
                  SizedBox(height: 30.0,),
                  ElevatedButton(onPressed: () async {
                    if(_formkey.currentState!.validate()){
                      setState(() => loading = true);
                      if(_formkey.currentState!.validate()){
                        dynamic result = _auth.registerWithEmail(email, password);
                        if (result == null){
                          setState((){
                            loading = false;
                            error = 'invalid email';
                          })
                          ;
                        }
                      }
                    }
                  },
                    child: Text(
                    'Register',),
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
                    ),
                  )
                ],
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
