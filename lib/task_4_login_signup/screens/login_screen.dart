import 'package:flutter/material.dart';
import 'package:login_signup_page_flutter/task_4_login_signup/screens/signup_page/terms_conditions_screen.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // *Form Key
  final _formKey = GlobalKey<FormState>();

  // * Editing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double textFormFieldPadding = 8;
    // ! Email Field
    final emailField = TextFormField(
      decoration: const InputDecoration(
        // prefixIcon: ,
        border: InputBorder.none,
        hintText: 'Email',
      ),
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Your Email!";
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
    // ! Password Field
    final passwordField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Password',
      ),
      autofocus: false,
      controller: passwordController,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter Your Password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Password (Minimum 6 Characters.)");
        }
        return null;
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    // ! Sign Up Button
    final signUpButton = ElevatedButton(
      onPressed: () {
        // ignore: avoid_print
        print("Signing Up!");

        if (_formKey.currentState!.validate()) {
          signUp(emailController.text, passwordController.text);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 2),
              content: Text("Processing Data"),
            ),
          );
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "Continue to Create",
          style: TextStyle(fontSize: 18),
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF1cbb7c),
        ),
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView(
          children: [
            const Text(
              "Welcome to Application",
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // ! Email Field
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: textFormFieldPadding),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFf3f3f3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: emailField,
                      ),
                    ),
                  ),
                  // ! Password Field
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: textFormFieldPadding),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFf3f3f3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: passwordField,
                      ),
                    ),
                  ),
                  // ! Sign Up Button
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: signUpButton,
                        ),
                      ),
                    ],
                  ),
                  // ! Terms & Conditions
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "I agree to ",
                          style: TextStyle(
                            color: Color(0xFF899cad),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // ignore: avoid_print
                              print("Showing Terms and Conditions");
                              Navigator.pushNamed(
                                  context, TermsConditionsScreen.id);
                            });
                          },
                          child: const Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: Color(0xFF1cbb7c),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, HomeScreen.id);
    }
  }
}
