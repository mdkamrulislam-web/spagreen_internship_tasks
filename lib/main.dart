import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_signup_page_flutter/task_4_login_signup/screens/home_screen.dart';
import 'package:login_signup_page_flutter/task_4_login_signup/screens/login_page/forgot_password_screen.dart';
import 'package:login_signup_page_flutter/task_4_login_signup/screens/login_page/login_screen.dart';
import 'package:login_signup_page_flutter/task_4_login_signup/screens/signup_page/info_screen.dart';
import 'package:login_signup_page_flutter/task_4_login_signup/screens/signup_page/signup_screen.dart';
import 'package:login_signup_page_flutter/task_4_login_signup/screens/signup_page/terms_conditions_screen.dart';

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
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
        SignupScreen.id: (context) => const SignupScreen(),
        InfoScreen.id: (context) => const InfoScreen(),
        TermsConditionsScreen.id: (context) => const TermsConditionsScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
      title: 'Login Signup Demo',
    );
  }
}
