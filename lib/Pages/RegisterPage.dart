import 'package:flutter/material.dart';
import 'package:the_bug_chasers/Pages/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:the_bug_chasers/User/Profile.dart';

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
  final fullNameController = TextEditingController();
  // final phoneController = TextEditingController();

  bool errorOccured = false;
  var regError = '';

  bool newUser = true;

  User? user;

  Future<void> registerUser() async {

    var email = emailController.text;
    var pass = passwordController.text;
    var confirmPass = confirmPasswordController.text;  

    if(email.isNotEmpty && pass.isNotEmpty && confirmPass.isNotEmpty && pass == confirmPass) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: pass
        );

        user = FirebaseAuth.instance.currentUser;

        if(user !=null) {          
          // final Profile profile = Provider.of<Profile>(context, listen: false);
          // profile.isAuthenticated = true;
          // Navigator.pushReplacement(context, 
          //   MaterialPageRoute(builder: (context) => const LoginPage())
          // );
          setState(() {
            newUser = false;
          });
        }
        
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          errorOccured = true;
          regError = 'Password weak';
          // print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          // print('The account already exists for that email.');
          errorOccured = true;
          regError = 'User exists!';
        }
      } catch (e) {
        errorOccured = true;
        regError = e.toString();
      }
    }
  }

  Future<void> updateDetails() async {
    var name = fullNameController.text;
    // PhoneAuthCredential phone = phoneController.value as PhoneAuthCredential;

    if(name.isNotEmpty) {
      await user?.updateDisplayName(name);
      // await user?.updatePhoneNumber(phone);
      await user?.reload();

      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
    }
  }

  Widget stepOne() {
    return Column(                        
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
            onPressed: registerUser,
            child: const Text(
              'Register',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        if(errorOccured) SizedBox(height: 50, child: Text(regError),),              
        if(!errorOccured) const SizedBox(height: 35,),
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
    );
  }

  Widget stepTwo() {
    return Column(
      children: <Widget>[
         const SizedBox(height: 50,),
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          child:  Text('One last step',
            style: TextStyle(fontSize: 32,),
          ),
        ),
        const SizedBox(height: 50,),
        Padding(              
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full Name',
              hintText: 'Enter name here'
            ),
            controller: fullNameController,
          ),
        ),        
        const SizedBox(height: 20,),
        Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: _themeColor, borderRadius: BorderRadius.circular(20)),
          child: TextButton(
            onPressed: updateDetails,
            child: const Text(
              'Update details',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        )
      ],
    );
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
          child: newUser ? stepOne() : stepTwo()
        ) 
      ),
    );
  }
}