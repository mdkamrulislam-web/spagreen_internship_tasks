import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_signup_page_flutter/screens/home_screen.dart';
import 'package:login_signup_page_flutter/screens/info_screen.dart';
import 'package:login_signup_page_flutter/screens/signup_screen.dart';
import 'package:login_signup_page_flutter/screens/terms_conditions_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignupScreen.id,
      routes: {
        SignupScreen.id: (context) => const SignupScreen(),
        InfoScreen.id: (context) => const InfoScreen(),
        TermsConditionsScreen.id: (context) => const TermsConditionsScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
      title: 'Login Signup Demo',
    );
  }
}
