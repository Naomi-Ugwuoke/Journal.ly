import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Pages/LoginPage.dart';
import 'package:the_bug_chasers/Pages/MainPage.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final Color _themeColor = const Color(0xff02394a);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                child:  Text('Register',
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Enter the password again'
                  ),
                  controller: confirmPasswordController,
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: _themeColor, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: null,
                child: Text(
                  'Already have an account?',
                  style: TextStyle(color: _themeColor, fontSize: 15),
                ),
              ),
              OutlinedButton(
                onPressed: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));          
                }), 
                child: const Padding(
                  padding:  EdgeInsets.all(10.0),
                  child:  Text('Login'),
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