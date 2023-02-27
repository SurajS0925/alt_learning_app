import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _emailController=TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text("Password reset link sent! Please check your email"),
        );
      },);
    }on FirebaseAuthException catch(e){
      print(e);
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body:Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: Text('Enter Your Email and we will send you a apssword reset link',
                textAlign:TextAlign.center,
                style: TextStyle(fontSize:20),
              )
          ),

          SizedBox(height: 10,),
          //Email TextBox

          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.alternate_email,
              color: Color(0xFFFFBD73),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email Address",
              ),
            ),
          ),

          SizedBox(height: 10,),

          MaterialButton(onPressed: passwordReset ,
            child:Text('Reset Password'),
            color:Colors.green,),
        ],
      ),
    );
  }
}