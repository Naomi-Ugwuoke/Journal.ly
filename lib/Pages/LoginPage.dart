import 'package:flutter/material.dart';

import 'package:the_bug_chasers/Pages/RegisterPage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_bug_chasers/User/Profile.dart';
import 'package:the_bug_chasers/main.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Color _themeColor =const Color(0xff3b3b58);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool errorOccured = false;
  var loginError = '';

  // CollectionReference users = FirebaseFirestore.instance.collection('Users');

  // Future<void> createDoc(User user) async {

  //   String firstName = user.displayName!.split(" ")[0];
  //   String lastName = user.displayName!.split(" ")[1];
  //   String uid = user.uid;
  //   // var moods = {};

  //   await users.add({
  //     "firstName": firstName,
  //     "lastName": lastName,
  //     "uid": uid,
  //     "moods": {
  //       "happy": {
  //         "r": "58",
  //         "g": "87",
  //         "b": "7f"
  //       }
  //     }
  //   })
  //   .then((value) { print("Collection updated.");  })
  //   .catchError((error) {
  //     setState(() {
  //       errorOccured = true;  
  //       loginError = error;
  //     });      
  //   });      
  // }

  Future<void> login() async {

    setState(() {
      errorOccured = false;
      loginError = '';
    });    

    var email = emailController.text;
    var pass = passwordController.text;

    if(email.isNotEmpty && pass.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass
        );

        User? user = FirebaseAuth.instance.currentUser;

        if(user !=null) {          
          final Profile profile = Provider.of<Profile>(context, listen: false);
          profile.isAuthenticated = true;
          profile.userId = user.uid;
          profile.name = user.displayName;
          profile.isVerified = user.emailVerified;
          profile.userEmail = user.email;

          // await createDoc(user);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyApp(),));
        }

      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            errorOccured = true;
            loginError = 'User Not Found!';  
          });
          
        } else if (e.code == 'wrong-password') {

          setState(() {
            errorOccured = true;
            loginError = 'Wrong Email/Password combination.';  
          });
          
        }
      }
    }
    else {
      errorOccured = true;
      loginError = 'Some values missing. Try again!';
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal.ly'),
        centerTitle: true,        
        backgroundColor: _themeColor,
      ),                  
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(                        
            children: <Widget>[
              const SizedBox(height: 50,),
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                child:  Text('Login',
                  style: TextStyle(fontSize: 32,),
                ),
              ),
              const SizedBox(height: 50,),
              Padding(              
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'abc@xyz.com'
                  ),
                  controller: emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'
                  ),
                  controller: passwordController,
                ),
              ),
              TextButton(
                onPressed: null,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: _themeColor, fontSize: 15),
                  textAlign: TextAlign.right,
                ),                
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: _themeColor, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: login,
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              if(errorOccured) Container(alignment: Alignment.center, child: Text(loginError), height: 80,),
              if(!errorOccured) const SizedBox(height: 50,),
              const Text('Don\'t have an account?'),
              const SizedBox(height: 20,),
              OutlinedButton(
                onPressed: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));          
                }), 
                child: Padding(
                  padding: const  EdgeInsets.all(10.0),
                  child:  Text('Register', style: TextStyle(color: _themeColor),),
                ),
                style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: const BorderSide(color: Colors.white)            
                  )
                )),
              )
            ],
          )
        ) 
      ),
    );
  }
}