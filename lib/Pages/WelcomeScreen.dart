import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Pages/LoginPage.dart';
import 'package:the_bug_chasers/Pages/RegisterPage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget navigateButton(String next) {
    return next == 'login' ? 
      ElevatedButton(
        onPressed: (() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));          
        }), 
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child:  Text('Login',
            style: TextStyle(
              fontSize: 24
            ),
          ),
        ),
        style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),            
          )
        )),
      ) :      
      OutlinedButton(
        onPressed: (() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));          
        }), 
        child: const Padding(
          padding:  EdgeInsets.all(10.0),
          child:  Text('Register'),
        ),
        style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Colors.white)            
          )
        )),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff1d263b),      
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/imgs/home-illustration.png'),
          const SizedBox(
           height: 50, 
          ),
          const Text('Journal.ly', style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold
          )),
          const SizedBox(
            height: 90,
          ),
          navigateButton('login'),
          Column(
            children: [
              const SizedBox(height: 30,),
              const Text('Already have an account?', style: TextStyle(color: Colors.white),),
              const SizedBox(height: 15,),
              navigateButton('register')
            ],
          ),
          
        ],
      ),

    );
  }
}