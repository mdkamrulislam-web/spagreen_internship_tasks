import 'package:flutter/material.dart';
import 'package:login_signup_page_flutter/task_4_login_signup/screens/login_page/forgot_password_screen.dart';
import 'package:login_signup_page_flutter/task_4_login_signup/screens/signup_page/signup_screen.dart';

import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // * Password Visibility Initialization
  bool _isHidden = true;

  // *Form Key
  final _formKey = GlobalKey<FormState>();

  // * Editing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFormFieldPadding = 8;
    // ! Email Field
    final emailField = TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        fillColor: const Color(0xFFf3f3f3),
        filled: true,

        // prefixIcon: ,

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
      obscureText: _isHidden,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        fillColor: const Color(0xFFf3f3f3),
        filled: true,
        hintText: 'Password',
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {
              _togglePasswordVisibility();
              // setState(() {
              //   _isHidden = !_isHidden;
              // });
            },
            child: Icon(
              _isHidden ? Icons.visibility_off : Icons.visibility,
              size: 20,
              color: const Color(0xFF1cbb7c),
            ),
          ),
        ),
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

    // ! Login Button
    final loginButton = ElevatedButton(
      onPressed: () {
        // ignore: avoid_print
        print("Loging In!");

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
          "Sign In",
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

    // ! Sign Up Button
    final signUpButton = ElevatedButton(
      onPressed: () {
        // ignore: avoid_print
        print("Signing Up!");

        Navigator.pushNamed(context, SignupScreen.id);
      },
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Text(
          "Sign Up",
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
          const Color(0xFF899cad),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 16.0, right: 16.0,
            // top: 50
          ),
          child: SizedBox(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Column(
                    children: const [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "to Application",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // ! Email Field
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: textFormFieldPadding),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0x0fffffff),
                              borderRadius: BorderRadius.circular(10)),
                          child: emailField,
                        ),
                      ),
                      // ! Password Field
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: textFormFieldPadding),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0x0fffffff),
                              borderRadius: BorderRadius.circular(10)),
                          child: passwordField,
                        ),
                      ),
                      // ! Login Button
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: loginButton,
                            ),
                          ),
                        ],
                      ),
                      // ! Forget Password
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // ignore: avoid_print
                              print("Showing Forgot Password Options");
                              Navigator.pushNamed(
                                  context, ForgotPasswordScreen.id);
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: Color(0xFF1cbb7c),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(),
                // ! Sign Up Button
                Row(
                  children: [
                    Expanded(
                      child: signUpButton,
                    ),
                  ],
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, HomeScreen.id);
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
