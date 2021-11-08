import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup_page_flutter/task_4_login_signup/screens/signup_page/terms_conditions_screen.dart';
import '../home_screen.dart';
import 'info_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const String id = "signup_screen";

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // *Importing Image or Taking Image
  XFile? _image;

  // *Form Key
  final _formKey = GlobalKey<FormState>();

  // * Editing Controller
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textFormFieldPadding = 8;
    // ! First Name Field
    final firstNameField = TextFormField(
      decoration: const InputDecoration(
        // prefixIcon: ,
        border: InputBorder.none,
        hintText: 'First Name',
      ),
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("Please Enter Your First Name");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name (Minimum 2 Characters.)");
        }
        return null;
      },
      onSaved: (value) {
        firstNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
    // ! Last Name Field
    final lastNameField = TextFormField(
      decoration: const InputDecoration(
        // prefixIcon: ,
        border: InputBorder.none,
        hintText: 'Last Name',
      ),
      autofocus: false,
      controller: lastNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("Please Enter Your Last Name");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid Name (Minimum 2 Characters.)");
        }
        return null;
      },
      onSaved: (value) {
        lastNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );
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
    // ! Confrim Password Field
    final confirmPassField = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Confirm Password',
      ),
      autofocus: false,
      controller: confirmPassController,
      validator: (value) {
        if (passwordController.text != value) {
          return "Passwords Don't Match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPassController.text = value!;
      },
      textInputAction: TextInputAction.done,
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
    //Image Picker

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ? Welcome
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // ignore: avoid_print
                        print("Going Back!");
                      });
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xFF1cbb7c),
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1cbb7c),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: size.width / 15,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // ignore: avoid_print
                        print("Showing Info!");
                        Navigator.pushNamed(context, InfoScreen.id);
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Info",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1cbb7c),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: size.width / 12, fontWeight: FontWeight.bold),
                ),
              ),
              // ? Setting Profile Photo
              Center(
                child: Stack(
                  children: [
                    const Icon(
                      Icons.account_circle_sharp,
                      size: 150,
                      color: Color(0xffcdd8dd),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 75,
                      child: _image == null
                          ? Image.asset('assets/images/transparent.png')
                          : ClipRRect(
                              child: Image(
                                image: FileImage(
                                  File(_image!.path),
                                ),
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: InkWell(
                        onTap: () {
                          _showSelectedImageDialog();
                        },
                        child: SizedBox(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: size.width / 25.0,
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 4.0, bottom: 4),
                                child: FaIcon(
                                  FontAwesomeIcons.edit,
                                  size: size.width / 22.5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 60,
              ),
              // ? Signup Form
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      // ! First Name Field
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: textFormFieldPadding),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFf3f3f3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: firstNameField,
                          ),
                        ),
                      ),
                      // ! Last Name Field
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: textFormFieldPadding),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFf3f3f3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: lastNameField,
                          ),
                        ),
                      ),
                      // ! Email Field
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: textFormFieldPadding),
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
                        padding: EdgeInsets.symmetric(
                            vertical: textFormFieldPadding),
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
                      // ! Confirm Password Field
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: textFormFieldPadding),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFf3f3f3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: confirmPassField,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Function? _showSelectedImageDialog() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: const Text("Choose Photo"),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                _handleImage(source: ImageSource.camera);
              },
              child: const Text(
                "Take Photo",
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                _handleImage(source: ImageSource.gallery);
              },
              child: const Text(
                "Choose From Gallery",
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text("Cancel",
                style: TextStyle(
                  color: Colors.red,
                )),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void _handleImage({required ImageSource source}) async {
    Navigator.pop(context);
    XFile? imageFile = await ImagePicker().pickImage(source: source);
    if (imageFile != null) {
      setState(() {
        _image = imageFile;
      });
    }
  }

  void signUp(String email, String password) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, HomeScreen.id);
    }
  }
}
