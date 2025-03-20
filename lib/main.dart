import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:safehome/firebase_options.dart';
import 'package:safehome/login_signup/signup_screen.dart';
import 'package:safehome/mainScreens/LandingScreen.dart';
import 'package:safehome/mainScreens/role_selection_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safe Hood',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: SplashScreen(),
      routes: {
        '/landingScreen': (context) => const LandingScreen(),
        '/signup': (context) => const SignupScreen(),
        '/roleSelection': (context) => RoleSelectionScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.purple,
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/logo.jpg', width: 150),
            ),
            SizedBox(height: 10),
            Text(
              "SafeHood",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      nextScreen: RoleSelectionScreen(),
      splashIconSize: 520,
      centered: true,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: Duration(milliseconds: 2000),
    );
  }
}
