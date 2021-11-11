import 'package:flutter/material.dart';
import 'package:login_signup_page_flutter/task_4_&_taks_6/screens/signup_page/info_screen.dart';

class PasscodeScreen extends StatefulWidget {
  const PasscodeScreen({Key? key}) : super(key: key);
  static const String id = "passcode_screen";

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PasscodeScreen> {
  // * Form Key

  // * Editing Controller
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // *Form Key
    final _formKey = GlobalKey<FormState>();
    // // ! Continue Button
    // final getSecureCodeButton = ElevatedButton(
    //   onPressed: () {
    //     // ignore: avoid_print
    //     print("Continuing!");
    //   },
    //   child: const Padding(
    //     padding: EdgeInsets.all(12.0),
    //     child: Text(
    //       "Continue",
    //       style: TextStyle(fontSize: 18),
    // //     ),
    // //   ),
    //   style: ButtonStyle(
    //     shape: MaterialStateProperty.all(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //     backgroundColor: MaterialStateProperty.all(
    //       const Color(0xFF1cbb7c),
    //     ),
    //   ),
    // );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // ignore: avoid_print
                        print("Going Back!");
                        Navigator.pop(context);
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
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1cbb7c),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1cbb7c),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                  child: Text(
                    "Passcode",
                    style: TextStyle(
                        fontSize: size.width / 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Form(key: _formKey, child: TextFormField()),
            ],
          ),
        ),
      ),
    );
  }
}
