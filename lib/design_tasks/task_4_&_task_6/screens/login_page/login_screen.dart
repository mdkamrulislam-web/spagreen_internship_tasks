import 'package:flutter/material.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/constants/firebase_auth_constants.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/login_page/forgot_password_screen.dart';
import 'package:login_signup_page_flutter/design_tasks/task_4_&_task_6/screens/signup_page/signup_screen.dart';

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
      cursorColor: const Color(0xFF1cbb7c),
      decoration: InputDecoration(
        labelText: "Email",
        floatingLabelStyle: const TextStyle(
          color: Color(0xFF1cbb7c),
          fontWeight: FontWeight.w600,
        ),
        labelStyle: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w600,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF1cbb7c),
          ),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(
        //     width: 1,
        //     color: const Color(0xFF1cbb7c).withOpacity(0.4),
        //   ),
        // ),
        // prefixIcon: const Icon(
        //   Icons.email,
        //   color: Color(0xFF1cbb7c),
        // ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        fillColor: const Color(0xFFf3f3f3),
        filled: true,
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
      cursorColor: const Color(0xFF1cbb7c),
      obscureText: _isHidden,
      decoration: InputDecoration(
        labelText: "Password",
        floatingLabelStyle: const TextStyle(
          color: Color(0xFF1cbb7c),
          fontWeight: FontWeight.w600,
        ),
        labelStyle: TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w600,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF1cbb7c),
          ),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(
        //     width: 1,
        //     color: const Color(0xFF1cbb7c).withOpacity(0.4),
        //   ),
        // ),
        // prefixIcon: const Icon(
        //   Icons.password_sharp,
        //   color: Color(0xFF1cbb7c),
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        fillColor: const Color(0xFFf3f3f3),
        filled: true,

        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {
              _togglePasswordVisibility();
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
        if (_formKey.currentState!.validate()) {
          // logIn(emailController.text, passwordController.text);
          authController.login(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
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

    // ! Sign Up with Google Button
    final signUpWithGoogleButton = ElevatedButton(
      onPressed: () {
        authController.signInWithGoogle();
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Sign In With Google",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              width: 10,
            ),
            Image(
              height: 20,
              image: AssetImage(
                "assets/images/google.png",
              ),
            ),
          ],
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color(0xFF899cad).withOpacity(0.4),
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
                      Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
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
                      // ! Sign Up With Google Button
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: signUpWithGoogleButton,
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
                            padding: EdgeInsets.only(top: 12.0),
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

  // void logIn(String email, String password) {
  //   if (_formKey.currentState!.validate()) {
  //     Navigator.pushNamed(context, HomeScreen.id);
  //   }
  // }

  void _togglePasswordVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
