import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:the_bug_chasers/Pages/WelcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_bug_chasers/Pages/MainPage.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:the_bug_chasers/User/Profile.dart';
import 'package:the_bug_chasers/User/AppState.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Profile>(
          create: (final BuildContext context) {
            return Profile();
          }
        ),
        ChangeNotifierProvider<AppState>(
          create: (final BuildContext context) {
            return AppState();
          }
        )
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Journal.ly';

  @override
  Widget build (BuildContext context) {
    return Consumer<Profile>(
      builder: (final BuildContext context, final Profile profile, final child) {
        return MaterialApp(
          title: _title,
          home: profile.isAuthenticated ? const MyStatefulWidget() : const WelcomePage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
          ),
        );
      },
    );
  }
}

class WelcomePage extends StatelessWidget {  

  const WelcomePage({Key? key}) : super(key: key);  

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: SafeArea(        
        child: Container(
          width: double.infinity,                    
          child: const WelcomeScreen()
        ),
      ),
    );
  }
}
