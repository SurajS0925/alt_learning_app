import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alt_learning_app/login.dart';

class SignUP extends StatelessWidget {
  late String _email,_password,_fullName, _mobileNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        child: Column(
        children:<Widget>[
        BackButtonWidget(),
    SizedBox(
    height: 20,
    ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.person), onPressed: null),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextField(
                              onChanged: (value){
                                _fullName=value;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  hintText: 'Full Name'),
                            )))])),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.phone), onPressed: null),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextField(
                              onChanged: (value){
                                _mobileNumber=value;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey,
                                  hintText: 'Mobile Number'),
                            )))])),
          Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
    children: <Widget>[
    IconButton(icon: Icon(Icons.person), onPressed: null),
    Expanded(
        child: Container(
            margin: EdgeInsets.only(right: 20, left: 10),
            child: TextField(
              onChanged: (value){
                _email=value;
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: 'Email'),
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
                        onChanged: (value){
                          _password=value;
                        },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: 'Password'),
                    )))])),
            //from here
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              UserCredential user= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
              if(user!=null)
              {
                await FirebaseFirestore.instance.collection('Users').doc(_email).set({
                  'FullName':_fullName,
                  'MobileNumber':_mobileNumber,
                  'Email':_email,
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return login();
                  }),
                );
              }
              else
              {
                print('user does not exist');
              }
            },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(EdgeInsets.all(1)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
              child:
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 60.0,
                child: Center(
                  child: Text('Sign Up',
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                ),)
          ),
                  ],
                ),
              ),
    );
  }
}


class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('asset/app.png'))),
      child: Positioned(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 20,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              Positioned(
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Create New Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

