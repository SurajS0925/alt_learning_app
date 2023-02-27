import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'forgotPassword.dart';
import 'signup.dart';
import 'homepage.dart';


class login extends StatelessWidget
{
  late String _email, _password;
  static String email="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
          Container(
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('asset/app.png'))),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
    children: <Widget>[
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
    Text("LOGIN",
    style: TextStyle(
    color: Color(0xFFFFBD73),
    fontWeight: FontWeight.bold,
    fontSize: 40,
    )),
    TextButton(
    child: Text('Sign Up',
    style: TextStyle(
    color: Color(0xFFFFBD73),
    fontWeight: FontWeight.bold,
    )),
    onPressed: ()
    {
    print('Pressed SignUP!');
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
    return SignUP();
    }),
    );
    },
    ),
    ],
    ),
        ])
    ),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                children: <Widget>[
            IconButton(icon: Icon(Icons.mail), onPressed: null),
        Expanded(
            child: Container(
                margin: EdgeInsets.only(right: 20, left: 10),
                child: TextField(
                  onChanged: (value){
                    _email=value;
                  },
                  decoration: InputDecoration(hintText: 'Email Address'),
                )))
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
    children: <Widget>[
    IconButton(icon: Icon(Icons.lock), onPressed: null),
    Expanded(
    child: Container(
    margin: EdgeInsets.only(right: 20, left: 10),
    child: TextField(
      obscureText: true,
      onChanged: (value){
        _password=value;
      },
    decoration: InputDecoration(hintText: 'Password'),
    ))),
    ],
    ),
    ),
    SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.all(20.0),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: Container(
    height: 60,
    child: ElevatedButton(
    onPressed: () async
        {
        UserCredential user= await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        if(user!=null)
        {
        email = _email;
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
        return HomePage();
        }),
        );
        }
        else
        {
        print('user does not exist');
        }
        },
    child: Text(
    'SIGN IN',
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 20),
    ),
    ),
    ),
    ),
    ),
    SizedBox(
    height: 20,
    ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ForgotPasswordPage();
                          }));
                    },
                    child: Text('Forgot Password?',
                      style: TextStyle(
                        color:Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),),
          ],
        ),
    );
  }
}