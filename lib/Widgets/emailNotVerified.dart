import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/User/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailNotVerified extends StatelessWidget {
  const EmailNotVerified({ Key? key }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    TextStyle textColor = const TextStyle(color: Colors.white);

    Future<void> verifyEmail() async {

    User? user = FirebaseAuth.instance.currentUser;

    if (user!= null && !user.emailVerified) {
      await user.sendEmailVerification();      

      if(user.emailVerified) {
        Profile profile = Provider.of<Profile>(context, listen: false);
        profile.isVerified = true;
      }
    }
  } 

    return Card(
      color: Colors.red,
      child: Column(
        children: [
          ListTile(            
            leading: const Icon(Icons.error, size: 36, color: Colors.white,),
            title:  Text('Email not verified!', style: textColor),            
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(                    
              children: [
                TextButton(                        
                  onPressed: verifyEmail, 
                  child: const Text('Verify now!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))
              ],
            ),
          )
        ],
      ),
    );
  }
}